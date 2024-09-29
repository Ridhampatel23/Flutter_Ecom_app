import 'package:get_storage/get_storage.dart';

class ecomLocalStorage {
  static final ecomLocalStorage _instance = ecomLocalStorage._internal();

  factory ecomLocalStorage() {
    return _instance;
  }

  ecomLocalStorage._internal();

  final _storage = GetStorage();

  //Generic method to save data
  Future<void> saveData<ecom>(String key, ecom value) async {
    await _storage.write(key, value);
  }

  //Generic method to read data
  ecom? readData<ecom>(String key) {
    return _storage.read<ecom>(key);
  }

  //Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

//Clear all data in storage
  Future<void> clearall() async {
    await _storage.erase();
  }
}
