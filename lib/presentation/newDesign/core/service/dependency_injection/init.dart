import 'package:get_it/get_it.dart';

import 'init_api.dart';
import 'init_core.dart';
import 'init_cubits.dart';
import 'init_data_sources.dart';
import 'init_repositories.dart';
import 'init_use_cases.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 🧱 تهيئة الطبقات الأساسية (مثلاً SharedPreferences, Dio, Logger, إلخ)
  initCore();

  // 🌐 تهيئة API clients أو Dio interceptors
  initApi();

  // 🗃️ تهيئة Data Sources (مثل remote/local sources)
  initDataSources();

  // 🧩 تهيئة Repositories التي تجمع البيانات من المصادر
  initRepositories();

  // 🧠 تهيئة UseCases التي تحتوي على منطق الأعمال
  initUseCases();

  // 🎯 تهيئة Cubits (لإدارة الحالة)
  initCubits();
}