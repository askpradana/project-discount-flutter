import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_discount/model.dart';

final discountListProvider =
    FutureProvider.autoDispose<DiscountModel>((ref) async {
  final response = await http
      .get(Uri.parse("http://localhost:8090/api/collections/discount/records"));

  if (response.statusCode == 200) {
    // If the server returns a successful response, parse the JSON
    final json = jsonDecode(response.body);
    final discountModel = DiscountModel.fromJson(json);
    return discountModel;
  } else {
    // If the server returns an error response, throw an exception
    throw Exception('Failed to load discount model');
  }
});
