class CacheManager {
  static final KEY_LOCATIONS = 'locations';


  final _cacheData = <String, dynamic>{};

  void addCacheData(String key, data) {
    _cacheData[key] = data;
  }

  T? getCacheData<T>(String key) {
    if (_cacheData[key] != null) {
      return _cacheData[key] as T;
    }
    return null;
  }

  void clearCacheData() {
    _cacheData.clear();
  }
}
