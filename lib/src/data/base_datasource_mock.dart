import 'dart:convert';

import 'package:flutter/services.dart';

abstract class BaseDatasourceMock {
  Future doAsyncMock(String file) async {
    try {
      final fileLocation = 'assets/mocks/$file';

      var json = await rootBundle.loadString(fileLocation);

      return jsonDecode(json);
    } catch (e) {
      throw Exception(e);
    }
  }
}
