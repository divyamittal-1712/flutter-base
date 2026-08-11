extension EmailValidator on String? {
  bool isValidEmail() {
    if(this == null) return false;
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this!);
  }
}

extension PasswordValidator on String? {
  bool isValidPassword() {
    if (this == null) return false;
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(this!);
  }
}

extension PhoneValidator on String? {
  bool isValidPhone() {
    if(this == null) return false;
    if(this!.length != 10) return false;

    return true;
  }
}