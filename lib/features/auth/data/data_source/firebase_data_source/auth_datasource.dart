import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/firebase/error/firebase_error_handler.dart';
import '../../../../../core/preferences/app_pref.dart';
import '../../../domain/entities/credential_model.dart';

abstract class FirebaseDataSource {
  Future<void> login(CredentialModel credentialModel);
  Future<void> register(CredentialModel credentialModel);
  Future<void> logout();
}

class AuthDataSource extends FirebaseDataSource {
  final _auth = FirebaseAuth.instance;
  final AppPreferences _appPreferences = sl<AppPreferences>();
  @override
  Future<void> login(CredentialModel credentialModel) async {
    try {
      await _auth.signInWithEmailAndPassword(email: credentialModel.email,password: credentialModel.password);
      await _appPreferences.setUserEmail(userEmail, _auth.currentUser!.email!);
    } catch (e) {
      throw FirebaseErrorHandler.handle(e).failure;
    }
  }

  @override
  Future<void> register(CredentialModel credentialModel) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: credentialModel.email,password: credentialModel.password);
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