// ignore_for_file: file_names

import 'package:hive/hive.dart';

part 'Source.g.dart';

@HiveType(typeId: 2)
class Source {
  Source({
    required this.id,
    required this.name,
  });

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
