import 'package:dartz/dartz.dart';
import 'package:weather_app/features/auth/domain/base_usecase/firebase_base_usecase.dart';
import '../../../../core/firebase/error/firebase_failure.dart';
import '../repository/firebase_repository.dart';

class LoginUseCase extends FirebaseBaseUsecase {
  final FirebaseRepository firebaseBaseRepository;

  LoginUseCase(this.firebaseBaseRepository);

  @override
  Future<Either<FirebaseFailure, void>> call(parameters) async {
    return await firebaseBaseRepository.login(parameters);
  }
}