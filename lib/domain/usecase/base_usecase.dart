import 'package:essmohr/data/networks/failure.dart';
import 'package:dartz/dartz.dart';


//because had in/out
//in that's  a data is coming from view model(email,pasword,deviceid)
//out that's a result is comming from data layer passing it
// to view model either
abstract class BaseUseCase<In, Out> {
  //out is an authentication object(model)

  Future<Either<Failure, Out>> execute(In input);
}
