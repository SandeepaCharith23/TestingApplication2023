class UserModel {
  final String firstName;
  final String emailAddress;
  final String phoneNumber;
  final String passWord;
  final String? userId;

  const UserModel({
    required this.firstName,
    required this.emailAddress,
    required this.phoneNumber,
    required this.passWord,
    this.userId,
  });

  toJson(){
    return {
      "Firstname":firstName,
      "EmailAddress":emailAddress,
      "PhoneNumber":phoneNumber,
      "Password":passWord,
      "UserId":userId,
    };
  }
}
