import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product.dart';

class SupabaseService {
  static final SupabaseClient _client = Supabase.instance.client;

  // ─── Products ───────────────────────────────────────────────

  static Future<List<Product>> getAllProducts() async {
    final response = await _client
        .from('products')
        .select()
        .order('name', ascending: true);
    return (response as List).map((e) => Product.fromJson(e)).toList();
  }

  static Future<Product?> getProductByBarcode(String barcode) async {
    final response = await _client
        .from('products')
        .select()
        .eq('barcode', barcode)
        .maybeSingle();
    if (response == null) return null;
    return Product.fromJson(response);
  }

  static Future<Product> addProduct(Product product) async {
    final response = await _client
        .from('products')
        .insert(product.toJson())
        .select()
        .single();
    return Product.fromJson(response);
  }

  static Future<Product> updateProduct(Product product) async {
    final response = await _client
        .from('products')
        .update(product.toJson())
        .eq('id', product.id!)
        .select()
        .single();
    return Product.fromJson(response);
  }

  static Future<void> deleteProduct(String id) async {
    await _client.from('products').delete().eq('id', id);
  }

  // ─── Image Upload ────────────────────────────────────────────

  static Future<String> uploadProductImage(File imageFile, String productId) async {
    final fileName = 'product_$productId.jpg';
    final bytes = await imageFile.readAsBytes();

    await _client.storage
        .from('product-images')
        .uploadBinary(fileName, bytes, fileOptions: const FileOptions(upsert: true));

    final publicUrl = _client.storage
        .from('product-images')
        .getPublicUrl(fileName);

    return publicUrl;
  }
}
