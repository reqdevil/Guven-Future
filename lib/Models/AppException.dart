// ignore_for_file: file_names

abstract class AppException implements Exception {
  final String? message;
  final String prefix;

  AppException([this.prefix = "", this.message]);

  @override
  String toString() {
    return "$prefix: $message";
  }
}

class DefaultException extends AppException {
  DefaultException([String? message]) : super("Hata Oluştu", message);
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super("Hatalı İstek", message);
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super("Bağlantı Hatası", message);
}

class SocketError extends AppException {
  SocketError([String? message]) : super("Bağlantı Hatası", message);
}

class TimeoutError extends AppException {
  TimeoutError([String? message]) : super("Zaman Aşımı", message);
}

class FormatError extends AppException {
  FormatError([String? message]) : super("Biçim Hatası", message);
}

class NoContentException extends AppException {
  NoContentException([String? message]) : super("İçerik Yok", message);
}

class NotFoundException extends AppException {
  NotFoundException([String? message]) : super("Bulunamadı", message);
}

class InternalServerError extends AppException {
  InternalServerError([String? message]) : super("Sunucu Hatası", message);
}
