import 'package:bloc/bloc.dart';
import '../../presentation/home/Home.dart';
import 'package:mohr_hr/presentation/editEmployee/View/editEmployee.dart';
import '../../presentation/User/layout/employeeLayout.dart';
import '../../presentation/User/user_view.dart';
enum NavigationEvents {
  HomePageClickedEvent,
  MyProfileClickedEvent,
}
abstract class NavigationStates {}
class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc() : super(userView());
  }
  @override
  NavigationStates get initialState => userView();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Home();
        break;
      case NavigationEvents.MyProfileClickedEvent:
        yield Employee();
        break;
    }
  }
// }