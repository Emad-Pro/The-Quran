import 'package:hydrated_bloc/hydrated_bloc.dart';

class StorageHelper {
  // Singleton instance for StorageHelper
  static final StorageHelper _instance = StorageHelper._internal();

  factory StorageHelper() {
    return _instance;
  }

  StorageHelper._internal();

  // Save data
  Future<void> saveData(String key, dynamic value) async {
    final storage = HydratedBloc.storage;
    storage.write(key, value);
  }

  // Get data
  getData<T>(String key) {
    final storage = HydratedBloc.storage;
    return storage.read(key);
  }

  // Delete data
  Future<void> deleteData(String key) async {
    final storage = HydratedBloc.storage;
    storage.delete(key);
  }

  // Clear all stored data
  Future<void> clearStorage() async {
    final storage = HydratedBloc.storage;
    storage.clear();
  }
}
