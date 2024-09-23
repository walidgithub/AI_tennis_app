import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/domain/entities/user_model.dart';

class FirebaseManager {
  final _auth = FirebaseAuth.instance;

  Future<void> login(UserModel userModel) async {
    try {
      await _auth.signInWithEmailAndPassword(email: userModel.email,password: userModel.password);
    } on FirebaseAuthException catch (error) {
      throw error;
    }
  }
}