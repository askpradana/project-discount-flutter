import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_discount/model.list.dart';

final httpClientProvider = Provider<http.Client>((ref) {
  // Create and configure your HTTP client here
  final client = http.Client();

  // You can add default headers, timeouts, etc. here if needed
  // client.headers['Authorization'] = 'Bearer YourToken';
  // client.timeout = Duration(seconds: 30);

  return client;
});

final discountListProvider =
    FutureProvider.autoDispose<ModelListDiscount>((ref) async {
  final httpClient = ref.read(httpClientProvider);

  try {
    final response = await httpClient.get(
        Uri.parse("http://localhost:8090/api/collections/ongoing/records"));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final discountModel = ModelListDiscount.fromJson(json);
      return discountModel;
    } else {
      log('response code: ${response.statusCode}');
      throw Exception('Failed to load discount model: ${response.statusCode}');
    }
  } catch (e) {
    log(e.toString());
    throw Exception('Failed to load discount model: $e');
  }
});
