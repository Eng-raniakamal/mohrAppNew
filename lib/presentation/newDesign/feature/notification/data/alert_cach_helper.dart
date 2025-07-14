import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../domain/model/model.dart';


class AlertCacheHelper {
  static const String _cacheKey = 'alert_cache';
  static const String _cacheTimeKey = 'alert_cache_time';
  static const Duration _cacheDuration = Duration(minutes: 5);

  static Future<void> saveToCache(List<AlertModel> alerts) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData =
    jsonEncode(alerts.map((e) => e.toJson()).toList());
    await prefs.setString(_cacheKey, encodedData);
    await prefs.setString(_cacheTimeKey, DateTime.now().toIso8601String());
  }

  static Future<List<AlertModel>?> getFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString(_cacheKey);
    if (encodedData == null) return null;

    final List<dynamic> decodedList = jsonDecode(encodedData);
    return decodedList.map((e) => AlertModel.fromJson(e)).toList();
  }

  static Future<bool> isCacheValid() async {
    final prefs = await SharedPreferences.getInstance();
    final String? cacheTime = prefs.getString(_cacheTimeKey);
    if (cacheTime == null) return false;

    final DateTime savedTime = DateTime.parse(cacheTime);
    return DateTime.now().difference(savedTime) < _cacheDuration;
  }

  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cacheKey);
    await prefs.remove(_cacheTimeKey);
  }
}