import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static List getAll({required Box box}) {
    try {
      return box.values.toList();
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }

  static Future<void> addToDb({required Box box, required String id, required dynamic data}) async {
    try {
      await box.put(id, data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> removeFromDb({required Box box, required String id}) async {
    try {
      await box.delete(id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> deleteBox(Box box) async {
    try {
      await box.clear();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> deleteBoxFromDisk(Box box) async {
    try {
      await box.deleteFromDisk();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<Box?> openBox(String boxName) async {
    try {
      return await Hive.openBox(boxName);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  static Future<void> closeBox(Box box) async {
    try {
      if (box.isOpen) {
        await box.close();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
