import 'package:mohr_hr/application/extensions.dart';
import 'package:mohr_hr/data/data_source/local_data_source.dart';
import 'package:mohr_hr/data/data_source/remote_data_source.dart';
import 'package:mohr_hr/data/networks/appAPIs.dart';
import 'package:mohr_hr/data/networks/dio_factory.dart';
import 'package:mohr_hr/data/networks/network_info.dart';
import 'package:mohr_hr/data/repository/repository_impl.dart';
import 'package:mohr_hr/domain/model/model.dart';
import 'package:mohr_hr/domain/repository/repository.dart';
import 'package:mohr_hr/domain/usecase/empBD_useCase.dart';
import 'package:mohr_hr/domain/usecase/employee_UseCase.dart';
import 'package:mohr_hr/domain/usecase/login_usecase.dart';
import 'package:mohr_hr/presentation/User/User_viewModel.dart';
import 'package:mohr_hr/presentation/login/loginviewmodel.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/usecase/empSkills_UseCase.dart';
import '../domain/usecase/vacation_UseCase.dart';
import '../presentation/Requests/Vacations/viewModel/vacationViewModel.dart';
import '../presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import '../presentation/editEmployee/ViewModel/employeeBD_viewModel.dart';
import 'app_prefs.dart';


final  instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a model where we put all generic dependencies

  final sharedPrefs = await SharedPreferences.getInstance();
  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>
    (() => sharedPrefs);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>
    (() => AppPreferences(instance()));
  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(DataConnectionChecker()));
  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app  service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() =>
      AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImplementer(instance()));


  // repository
  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance(), instance(), instance(),instance()));


  // local data source
  instance.registerLazySingleton<LocalDataSource>(
          () => LocalDataSourceImplementer());

}
initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
 }
}
 initUserModule() {
   if (!GetIt.I.isRegistered<EmployeeUseCase>()) {
     instance.registerFactory<EmployeeUseCase>(() => EmployeeUseCase(instance()));
     instance.registerFactory<EmployeeViewModel>(() {
       var item = instance<EmployeeUseCase>();
       return EmployeeViewModel(item);
     });
   }
}
initEmployeeBasicDataModule() {
  if (!GetIt.I.isRegistered<EmployeeBasicDataUseCase>()) {
    instance.registerFactory<EmployeeBasicDataUseCase>(() => EmployeeBasicDataUseCase(instance()));
    instance.registerFactory<EmployeeBDViewModel>(() {
      var item = instance<EmployeeBasicDataUseCase>();
      return EmployeeBDViewModel(item);
    });
  }
  }
initEmployeeSkillsModule() {
  if (!GetIt.I.isRegistered<EmployeeSkillsUseCase>()) {
    instance.registerFactory<EmployeeSkillsUseCase>(() =>
        EmployeeSkillsUseCase(instance()));
    instance.registerFactory<EmployeeSkillsViewModel>(() {
      var item = instance<EmployeeSkillsUseCase>();
      return EmployeeSkillsViewModel(item);
    });
  }
}
    initVacationModule() {
      if (!GetIt.I.isRegistered<VacationUseCase>()) {
        instance.registerFactory<VacationUseCase>(() =>
            VacationUseCase(instance()));
        instance.registerFactory<VacationViewModel>(() {
          var item = instance<VacationUseCase>();
          return VacationViewModel(item);
        }
        );
      }
    }
      resetModules() {
        instance.reset(dispose: false);
        initAppModule();
        initLoginModule();
        initUserModule();
        initVacationModule();
      }

