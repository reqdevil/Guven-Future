// ignore_for_file: file_names

import 'dart:convert';

import 'package:dio/dio.dart';

class ListResponse<T> {
  int statusCode;
  String status;
  int totalResults;
  List<T>? data;

  ListResponse({
    required this.statusCode,
    required this.status,
    required this.totalResults,
    required this.data,
  });

  factory ListResponse.fromJSON(
    Response response,
    Function create,
  ) {
    Map<String, dynamic> json = jsonDecode(response.toString());

    return ListResponse<T>(
      statusCode: response.statusCode!,
      status: json["status"],
      totalResults: json["totalResults"],
      data: response.statusCode == 200 ? create(json["articles"]) : null,
    );
  }
}
