import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../env.dart';

class PaginationRepository {
  final dio = Dio();
  Future<dynamic> firstLoad(int page) async {
    try {
      final res = await dio
          .get("${AppEnvironment.baseAPiUrl}?_page=$page&_limit=${20}");
      return res;
    } catch (err) {
      if (kDebugMode) {
        print("Something went wrong..");
      }
    }
  }
}
