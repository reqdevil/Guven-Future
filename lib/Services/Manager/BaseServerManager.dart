// ignore_for_file: file_names

import 'package:guven_future/Services/Response/ListResponse.dart';

abstract class BaseServerManager<T> {
  Future<ListResponse<T>> getData({
    required Map<String, dynamic> params,
    required Function(List<dynamic>) parseFunction,
  });
}
