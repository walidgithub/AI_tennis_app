import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/features/auth/domain/entities/user_model.dart';
import '../../../../../core/firebase/error/firebase_error_handler.dart';

abstract class FirebaseDataSource {
  Future<void> login(UserModel userModel);
  Future<void> register(UserModel userModel);
}

class AuthDataSource extends FirebaseDataSource {
  final _auth = FirebaseAuth.instance;
  @override
  Future<void> login(UserModel userModel) async {
    try {
      await _auth.signInWithEmailAndPassword(email: userModel.email,password: userModel.password);
    } catch (e) {
      throw FirebaseErrorHandler.handle(e).failure;
    }
  }

  @override
  Future<void> register(UserModel userModel) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: userModel.email,password: userModel.password);
    } catch (e) {
      throw FirebaseErrorHandler.handle(e).failure;
    }
  }
}