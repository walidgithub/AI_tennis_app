import 'package:dartz/dartz.dart';
import 'package:weather_app/core/base_usecase/firebase_base_usecase.dart';
import '../../../../core/firebase/error/firebase_failure.dart';
import '../repository/firebase_repository.dart';

class LogoutUseCase extends FirebaseBaseUsecase<void, FirebaseNoParameters> {
  final FirebaseRepository firebaseBaseRepository;

  LogoutUseCase(this.firebaseBaseRepository);

  @override
  Future<Either<FirebaseFailure, void>> call(FirebaseNoParameters parameters) async {
    return await firebaseBaseRepository.logout();
  }
}