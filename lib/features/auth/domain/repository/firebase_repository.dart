import 'package:dartz/dartz.dart';
import 'package:weather_app/features/auth/domain/entities/user_model.dart';
import '../../../../core/firebase/error/firebase_failure.dart';

abstract class FirebaseRepository {
  Future<Either<FirebaseFailure, void>> login(
      UserModel userModel);

  Future<Either<FirebaseFailure, void>> register(
      UserModel userModel);
}