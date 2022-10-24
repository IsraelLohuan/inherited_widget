abstract class LocalStorage {
  Future<void> init();
  T get<T>(String key);
  Future<void> put<T>(String key, T value);
  Future<void> delete(String key);
}