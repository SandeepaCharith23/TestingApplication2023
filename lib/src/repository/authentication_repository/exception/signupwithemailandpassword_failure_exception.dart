class SignUpwithEmailAndPasswordFailures {
  final String errormsg;

  //constructor
  const SignUpwithEmailAndPasswordFailures(
      [this.errormsg = "An Unknown Error occured."]);

  factory SignUpwithEmailAndPasswordFailures.code(String code) {
    //return error msg form switch statement
    switch (code) {
      case 'weak-password':
        return const SignUpwithEmailAndPasswordFailures(
            'Please enter a stronger password');
      case 'invalid-email':
        return const SignUpwithEmailAndPasswordFailures(
            'Email is not valid or badly formatted');
      case 'user-not-found ':
        return const SignUpwithEmailAndPasswordFailures(
            'This User cannot find ');
      case 'wrong-password':
        return const SignUpwithEmailAndPasswordFailures(
            'Please enter Correct Password');
      case 'user-disabled':
        return const SignUpwithEmailAndPasswordFailures(
            'This use has been disabled,Please contact support for help');
      default:
        return const SignUpwithEmailAndPasswordFailures();
    }
  }
}
