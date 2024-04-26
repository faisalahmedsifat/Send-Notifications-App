class Validator {
  static bool isEmailValid(String email) {
    // Add your email validation logic here
    return RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(email);
  }

  static bool passwordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  static bool isPasswordValid(String password){
    return password.length >= 6;
  }

  // static bool isPasswordValid(String password) {
  //   // Add your password validation logic here
  //   // Return true if the password is valid, false otherwise
  // }
}
