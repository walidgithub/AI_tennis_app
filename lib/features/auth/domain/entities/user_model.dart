class UserModel {
  const UserModel({
    required this.email,
    required this.phoneNumber,
    required this.photoURL,
    required this.displayName
  });
  final String email;
  final String phoneNumber;
  final String photoURL;
  final String displayName;
}