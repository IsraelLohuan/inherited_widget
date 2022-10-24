import 'package:hive_flutter/hive_flutter.dart';
import 'package:inherited_widget_estudo/services/local_storage/local_storage.dart';

const _boxName = 'HiveLocalStorage';

class HiveLocalStorage implements LocalStorage {
  Box? _box;
  
  void _checkIniHive() {
    if(_box == null) {
      throw Exception('Hive não iniciado!');
    }
  }

  @override
  Future<void> delete(String key) async {
    _checkIniHive();
    await _box!.delete(key);
  }

  @override
  T get<T>(String key) {
    _checkIniHive();
    return _box!.get(key);
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(_boxName);
  }

  @override
  Future<void> put<T>(String key, T value) async {
    _checkIniHive();
    await _box!.put(key, value);
  }
}