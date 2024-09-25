import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/features/auth/domain/entities/user_model.dart';
import '../../../../../core/firebase/error/firebase_error_handler.dart';
import '../../../domain/entities/credential_model.dart';

abstract class FirebaseDataSource {
  Future<void> login(CredentialModel credentialModel);
  Future<void> register(CredentialModel credentialModel);
  Future<void> logout();
}

class AuthDataSource extends FirebaseDataSource {
  final _auth = FirebaseAuth.instance;
  @override
  Future<void> login(CredentialModel credentialModel) async {
    try {
      await _auth.signInWithEmailAndPassword(email: credentialModel.email,password: credentialModel.password);
    } catch (e) {
      throw FirebaseErrorHandler.handle(e).failure;
    }
  }

  @override
  Future<void> register(CredentialModel credentialModel) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: credentialModel.email,password: credentialModel.password);
      // save user data in secure storage
    } catch (e) {
      throw FirebaseErrorHandler.handle(e).failure;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw FirebaseErrorHandler.handle(e).failure;
    }
  }
}