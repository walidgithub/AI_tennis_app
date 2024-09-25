import '../../features/auth/domain/entities/user_model.dart';

class UserModelArguments {
  String email;
  String phoneNumber;
  String photoURL;
  String displayName;

  UserModelArguments({
    required this.email,
    required this.phoneNumber,
    required this.photoURL,
    required this.displayName,
  });
}