import 'package:dartz/dartz.dart';
import 'package:weather_app/core/firebase/error/firebase_error_handler.dart';
import 'package:weather_app/core/firebase/error/firebase_failure.dart';
import 'package:weather_app/features/auth/domain/entities/user_model.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/credential_model.dart';
import '../../domain/repository/firebase_repository.dart';
import '../data_source/firebase_data_source/auth_datasource.dart';

class AuthRepository extends FirebaseRepository {
  final AuthDataSource _authDataSource;
  final NetworkInfo _networkInfo;

  AuthRepository(this._authDataSource, this._networkInfo);

  @override
  Future<Either<FirebaseFailure, void>> login(CredentialModel credentialModel) async {
      try {
        if (await _networkInfo.isConnected) {
          final result = await _authDataSource.login(credentialModel);
          return Right(result);
        } else {
          return Left(FirebaseErrorHandler.handle("NoInternet").failure);
        }
      } catch (error) {
        return Left(FirebaseErrorHandler.handle(error).failure);
      }
  }

  @override
  Future<Either<FirebaseFailure, void>> register(CredentialModel credentialModel) async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _authDataSource.register(credentialModel);
        return Right(result);
      } else {
        return Left(FirebaseErrorHandler.handle("NoInternet").failure);
      }
    } catch (error) {
      return Left(FirebaseErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<FirebaseFailure, void>> logout() async {
    try {
      if (await _networkInfo.isConnected) {
        final result = await _authDataSource.logout();
        return Right(result);
      } else {
        return Left(FirebaseErrorHandler.handle("NoInternet").failure);
      }
    } catch (error) {
      return Left(FirebaseErrorHandler.handle(error).failure);
    }
  }
}
