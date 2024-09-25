import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_app/core/firebase/error/firebase_failure.dart';

abstract class FirebaseBaseUsecase<T, Parameters> {
  Future<Either<FirebaseFailure, T>> call(Parameters parameters);
}

class FirebaseNoParameters extends Equatable {
  const FirebaseNoParameters();
  @override
  List<Object?> get props => [];
}