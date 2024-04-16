//import 'package:mohr_hr/data/networks/error_handler.dart';
//import 'package:mohr_hr/data/response/responses.dart';

import 'package:mohr_hr/data/networks/error_handler.dart';
import 'package:mohr_hr/data/response/responses.dart';

const CACHE_User_KEY = "CACHE_User_KEY";
// the time of intrval data
const CACHE_USER_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";
const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 30s in millis

abstract class LocalDataSource {


   Future<UserProfileResponse> getUserData();
   Future<void> saveUserToCache(UserProfileResponse UserdataResponse);
   void clearCache();
   void removeFromCache(String key);

}

class LocalDataSourceImplementer implements LocalDataSource {
  // run time cache
  Map<String, CachedItem> cacheMap = {};

  @override
  //runtime casche
  Future<UserProfileResponse> getUserData() {
    CachedItem? cacheditem = cacheMap[CACHE_User_KEY];

    if (cacheditem != null && cacheditem.isValid(CACHE_USER_INTERVAL)) {
      //return the response from cache
      return cacheditem.data;
    }
    else {
      //return the erroe that cache is not there or it's not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }


  @override
  Future<void> saveUserToCache(UserProfileResponse dataResponse) async {
    cacheMap[CACHE_User_KEY] = CachedItem(dataResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }
}

class CachedItem {
  dynamic data;
  //the time that i created an instance from the class
  int cacheTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  // function return true or false if the cache has value or not
  bool isValid(int expirationTime) {
    //  let say expirationTime is 60 secs

    // current time in milli sec is 1:00:00
    //cache time 12:59:30
    // 30 sec<60 sec that's right the cache time is valid
    //valid until 1:00:30

    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch; // time now is 1:00:00 pm
    bool isCacheValid = currentTimeInMillis - expirationTime <= cacheTime;
    // cache time was in 12:59:30
    // false if current time > 1:00:30
    // true if current time <1:00:30
    return isCacheValid;
  }
}
