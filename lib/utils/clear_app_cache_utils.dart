import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;

class AppCacheUtils {
  static Future<bool> deleteAppCache() async {
    bool appCacheDeleted = await _deleteCacheDir();
    bool appDirectoryDeleted = await _deleteAppDir();
    bool externalStorageDeleted = await _deleteExternalStorage();

    return appDirectoryDeleted && appCacheDeleted && externalStorageDeleted;
  }

  static Future<bool> _deleteCacheDir() async {
    try {
      final cacheDir = await path_provider.getTemporaryDirectory();
      if (cacheDir.existsSync()) {
        cacheDir.deleteSync(recursive: true);
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> _deleteAppDir() async {
    try {
      final appDir = await path_provider.getApplicationSupportDirectory();
      if (appDir.existsSync()) {
        appDir.deleteSync(recursive: true);
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> _deleteExternalStorage() async {
    try {
      final appDir = Platform.isIOS
          ? await path_provider.getApplicationDocumentsDirectory()
          : await path_provider.getExternalStorageDirectory();
      if (appDir == null) return true;
      if (appDir.existsSync()) {
        appDir.deleteSync(recursive: true);
      }

      return true;
    } catch (_) {
      return false;
    }
  }
}
