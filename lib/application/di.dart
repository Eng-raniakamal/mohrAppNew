
import 'package:essmohr/data/data_source/local_data_source.dart';
import 'package:essmohr/data/data_source/remote_data_source.dart';
import 'package:essmohr/data/networks/appAPIs.dart';
import 'package:essmohr/data/networks/dio_factory.dart';
import 'package:essmohr/data/networks/network_info.dart';
import 'package:essmohr/data/repository/repository_impl.dart';
import 'package:essmohr/domain/repository/repository.dart';
import 'package:essmohr/domain/usecase/Degree_useCase.dart';
import 'package:essmohr/domain/usecase/VacatioType_useCase.dart';
import 'package:essmohr/domain/usecase/attendance_UseCase.dart';
import 'package:essmohr/domain/usecase/displaySkills_useCase.dart';
import 'package:essmohr/domain/usecase/empAcademicDegree_useCase.dart';
import 'package:essmohr/domain/usecase/empSkills_UseCase.dart';
import 'package:essmohr/domain/usecase/grade_useCase.dart';
import 'package:essmohr/domain/usecase/qualification_useCase.dart';
import 'package:essmohr/domain/usecase/salaryDetails_UseCase.dart';
import 'package:essmohr/domain/usecase/salary_UseCase.dart';
import 'package:essmohr/domain/usecase/empBD_useCase.dart';
import 'package:essmohr/domain/usecase/employee_UseCase.dart';
import 'package:essmohr/domain/usecase/login_usecase.dart';
import 'package:essmohr/domain/usecase/saveAcademicDegree_UseCase.dart';
import 'package:essmohr/domain/usecase/saveEmpBD_useCase.dart';
import 'package:essmohr/domain/usecase/userImage_usecase.dart';
import 'package:essmohr/domain/usecase/vacation_UseCase.dart';
import 'package:essmohr/presentation/AddImage/viewModel/GetImage_ViewModel.dart';
import 'package:essmohr/presentation/Alert_Notification/ViewModel/notificationViewModel.dart';
import 'package:essmohr/presentation/Attendance/viewModel/attendViewModel.dart';
import 'package:essmohr/presentation/Requests/Salary/ViewModel/salaryDetailsViewModel.dart';
import 'package:essmohr/presentation/Requests/Salary/ViewModel/salaryViewModel.dart';
import 'package:essmohr/presentation/Requests/Vacations/viewModel/VacationType_ViewModel.dart';
import 'package:essmohr/presentation/Requests/Vacations/viewModel/vacationViewModel.dart';

import 'package:essmohr/presentation/User/User_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/Degree_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/displayEmpAcademicDegree_ViewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/displayEmpBasicData_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/displayEmpSkills_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/empSkills_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/qualification_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/grade_viewModel.dart';
import 'package:essmohr/presentation/editEmployee/ViewModel/saveEmpAcademicDegree_ViewModel.dart';
import 'package:essmohr/presentation/login/loginviewmodel.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
//import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


//import '../presentation/editEmployee/ViewModel/saveEmpBD_viewModel.dart';
import '../presentation/editEmployee/ViewModel/saveEmpBD_viewModel.dart';
import '../presentation/newDesign/core/service/dependency_injection/init.dart';
import '../presentation/newDesign/core/service/dependency_injection/init_api.dart';
import '../presentation/newDesign/core/service/dependency_injection/init_core.dart';
import '../presentation/newDesign/core/service/dependency_injection/init_cubits.dart';
import '../presentation/newDesign/core/service/dependency_injection/init_data_sources.dart';
import '../presentation/newDesign/core/service/dependency_injection/init_repositories.dart';
import '../presentation/newDesign/core/service/dependency_injection/init_use_cases.dart';
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


  ////////
  instance.registerLazySingleton<NotificationData>
    (() => NotificationData());
  ///////
  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker.createInstance()));
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
          () => RepositoryImpl(instance(), instance(), instance()));


  // local data source
  instance.registerLazySingleton<LocalDataSource>(
          () => LocalDataSourceImplementer());


  await initNewModules();

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

initUserImageModule() {
  if (!GetIt.I.isRegistered<UserImageUseCase>()) {
    instance.registerFactory<UserImageUseCase>(() => UserImageUseCase(instance()));
    instance.registerFactory<EmployeeImageViewModel>(() {
      var item = instance<UserImageUseCase>();
      return EmployeeImageViewModel(item);
    });
  }
}

initEmployeeBasicDataModule() {
  if (!GetIt.I.isRegistered<BasicDataUseCase>()) {
    instance.registerFactory<BasicDataUseCase>(() => BasicDataUseCase(instance()));
    instance.registerFactory<EmployeeBasicDataViewModel>(() {
      var item = instance<BasicDataUseCase>();
      return EmployeeBasicDataViewModel(item);
    });
  }
  }

initSaveEmpBasicDataModule() {
  if (!GetIt.I.isRegistered<saveEmpBasicDataUseCase>()) {
    instance.registerFactory<saveEmpBasicDataUseCase>(() => saveEmpBasicDataUseCase(instance()));
    instance.registerFactory<SaveBDViewModel >(() {
      var item = instance<saveEmpBasicDataUseCase>();
      return SaveBDViewModel(item,UserId);
    }
  );
  }
}

void initSave2EmpBasicDataModule() {
  if (!GetIt.I.isRegistered<saveEmpBasicDataUseCase>()) {
    instance.registerFactory<saveEmpBasicDataUseCase>(
          () => saveEmpBasicDataUseCase(instance()),
    );
  }

  if (!GetIt.I.isRegistered<SaveBDViewModel>()) {
    instance.registerFactory<SaveBDViewModel>(
          () => SaveBDViewModel(instance(),UserId), // مرر use case هنا فقط إذا كان هذا هو المطلوب
    );
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

    initDisplayEmployeeSkillsModule() {
      if (!GetIt.I.isRegistered<displaySkillsUseCase>()) {
        instance.registerFactory<displaySkillsUseCase>(() =>
            displaySkillsUseCase(instance()));
        instance.registerFactory<DisplayEmpSkillsViewModel>(() {
          var item = instance<displaySkillsUseCase>();
          return DisplayEmpSkillsViewModel(item);
        });
      }
    }
    initDisplayAcademicDegreesModule() {
      if (!GetIt.I.isRegistered<GetAcademicDegreeUseCase>()) {
        instance.registerFactory<GetAcademicDegreeUseCase>(() =>
            GetAcademicDegreeUseCase(instance()));
        instance.registerFactory<DisplayAcademicDegreeViewModel>(() {
          var item = instance<GetAcademicDegreeUseCase>();
          return DisplayAcademicDegreeViewModel(item);
        });
      }
    }

    initSaveAcademicDegreesModule() {
      if (!GetIt.I.isRegistered<saveAcademicDegreeUseCase>()) {
        instance.registerFactory<saveAcademicDegreeUseCase>(() =>
            saveAcademicDegreeUseCase(instance()));
        instance.registerFactory<SaveAcademicDegreeViewModel>(() {
          var item = instance<saveAcademicDegreeUseCase>();
          return SaveAcademicDegreeViewModel(item);
        });
      }
    }


    initAttendanceModule() {
      if (!GetIt.I.isRegistered<AttendanceUseCase>()) {
        instance.registerFactory<AttendanceUseCase>(() =>
            AttendanceUseCase(instance()));
        instance.registerFactory<AttendanceViewModel>(() {
          var item = instance<AttendanceUseCase>();
          return AttendanceViewModel(item);
        }
        );
      }
    }

    initSalaryModule() {
      if (!GetIt.I.isRegistered<SalaryUseCase>()) {
        instance.registerFactory<SalaryUseCase>(() =>
            SalaryUseCase(instance()));
        instance.registerFactory<SalaryViewModel>(() {
          var item = instance<SalaryUseCase>();
          return SalaryViewModel(item);
        }
        );
      }
    }
    initSalaryDetailsModule() {
      if (!GetIt.I.isRegistered<SalaryDetailsUseCase>()) {
        instance.registerFactory<SalaryDetailsUseCase>(() =>
            SalaryDetailsUseCase(instance()));
        instance.registerFactory<SalaryDetailsViewModel>(() {
          var item = instance<SalaryDetailsUseCase>();
          return SalaryDetailsViewModel(item);
        }
        );
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

    initVacationTypeModule() {
      if (!GetIt.I.isRegistered<VacationTypeUseCase>()) {
        instance.registerFactory<VacationTypeUseCase>(() =>
            VacationTypeUseCase(instance()));
        instance.registerFactory<VacationTypeViewModel>(() {
          var item = instance<VacationTypeUseCase>();
          return VacationTypeViewModel(item);
        }
        );
      }
    }

    initQualificationModule() {
      if (!GetIt.I.isRegistered<QualificationUseCase>()) {
        instance.registerFactory<QualificationUseCase>(() =>
            QualificationUseCase(instance()));
        instance.registerFactory<QualificationViewModel>(() {
          var item = instance<QualificationUseCase>();
          return QualificationViewModel(item);
        }
        );
      }
    }


    initGradeModule() {
      if (!GetIt.I.isRegistered<GradeUseCase>()) {
        instance.registerFactory<GradeUseCase>(() =>
            GradeUseCase(instance()));
        instance.registerFactory<GradeViewModel>(() {
          var item = instance<GradeUseCase>();
          return GradeViewModel(item);
        }
        );
      }
    }

    initDegreeModule() {
      if (!GetIt.I.isRegistered<DegreeUseCase>()) {
        instance.registerFactory<DegreeUseCase>(() =>
            DegreeUseCase(instance()));
        instance.registerFactory<DegreeViewModel>(() {
          var item = instance<DegreeUseCase>();
          return DegreeViewModel(item);
        }
        );
      }
    }

    resetModules() {
      instance.reset(dispose: false);
      initAppModule();
      initLoginModule();
      initUserModule();
      initUserImageModule();
      initEmployeeBasicDataModule();
      initSaveEmpBasicDataModule();
      initDisplayEmployeeSkillsModule();
      initEmployeeSkillsModule();
      initDisplayAcademicDegreesModule();
      initSaveAcademicDegreesModule();
      initVacationModule();
      initAttendanceModule();
      initSalaryModule();
      initSalaryDetailsModule();
      initQualificationModule();
      initGradeModule();
      initDegreeModule();


    }

