// ignore_for_file: file_names, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:guven_future/Models/AppException.dart';
import 'package:guven_future/Services/HiveService.dart';
import 'package:guven_future/Services/Manager/BaseServerManager.dart';
import 'package:guven_future/Services/Response/ListResponse.dart';
import 'package:guven_future/Utilities/Constants.dart';
import 'package:guven_future/Utilities/Helpers.dart';

class ServerManager<T> implements BaseServerManager {
  final baseURL = "https://newsapi.org/v2/everything";
  final API_KEY = "48958de87d3144e59d7f7ed94954c6fc";

  var dio = getIt<Dio>();
  var hiveService = getIt<HiveService>();

  @override
  Future<ListResponse<T>> getData({
    required Map<String, dynamic> params,
    required Function(List<dynamic>) parseFunction,
  }) async {
    try {
      bool dataAvaliable = await hiveService.isExists(boxName: NEWS_LIST);

      if (dataAvaliable) {
        final List<T> data = await hiveService.getBoxes(NEWS_LIST);

        final item = ListResponse<T>(data: data, status: "ok", statusCode: 200, totalResults: data.length);

        return item;
      } else {
        params.addAll({"apiKey": API_KEY});
        final response = await dio.get(
          baseURL,
          queryParameters: params,
        );

        if (response.statusCode != 200) {
          throw getInternalException(response.statusCode!);
        }

        final data = ListResponse<T>.fromJSON(response, parseFunction);
        await hiveService.addBoxesFromResponse(data, NEWS_LIST);

        return data;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }

      rethrow;
    }
  }

  AppException getInternalException(int statusCode) {
    switch (statusCode) {
      case 204:
        return NoContentException("Sunucudan boş veri gönderdi.");
      case 400:
        return BadRequestException("Hatalı istek atıldı.");
      case 404:
        return NotFoundException("Aradığınız şey bulunamadı.");
      case 500:
        return InternalServerError("Sunucudan kaynaklı bir hata oluştu.");
      default:
        return DefaultException("Bir hata meydana geldi.");
    }
  }
}
