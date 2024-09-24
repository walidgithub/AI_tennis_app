import 'package:dartz/dartz.dart';
import 'package:weather_app/core/base_usecase/firebase_base_usecase.dart';
import '../../../../core/firebase/error/firebase_failure.dart';
import '../repository/firebase_repository.dart';

class RegisterUseCase extends FirebaseBaseUsecase {
  final FirebaseRepository firebaseBaseRepository;

  RegisterUseCase(this.firebaseBaseRepository);

  @override
  Future<Either<FirebaseFailure, void>> call(parameters) async {
    return await firebaseBaseRepository.register(parameters);
  }
}