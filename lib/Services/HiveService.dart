// ignore_for_file: file_names

import 'package:guven_future/Services/Response/ListResponse.dart';
import 'package:hive/hive.dart';

class HiveService {
  Future<bool> isExists({required String boxName}) async {
    final box = await Hive.openBox(boxName);
    int length = box.length;
    return length != 0;
  }

  Future<void> addBoxesFromResponse<T>(ListResponse<T> listResponse, String boxName) async {
    final box = await Hive.openBox(boxName);

    for (var item in listResponse.data!) {
      box.add(item);
    }
  }

  Future<void> addBoxesFromList<T>(List<T> list, String boxName) async {
    final box = await Hive.openBox(boxName);

    for (var item in list) {
      box.add(item);
    }
  }

  Future<List<T>> getBoxes<T>(String boxName) async {
    List<T> boxList = [];

    final box = await Hive.openBox(boxName);

    int length = box.length;

    for (int i = 0; i < length; i++) {
      boxList.add(box.getAt(i));
    }

    return boxList;
  }

  void clearBoxes(String boxName) async {
    final box = await Hive.openBox(boxName);
    box.clear();
  }
}