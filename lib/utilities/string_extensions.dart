extension StringExtensions on String {
  isValidEmail() {
    RegExp regEx = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regEx.hasMatch(this);
  }

  containsLowerCase() {
    RegExp regEx = new RegExp(r"(?=.*[a-z])\w+");
    return regEx.hasMatch(this);
  }

  containsUpperCase() {
    RegExp regEx = new RegExp(r"(?=.*[A-Z])\w+");
    return regEx.hasMatch(this);
  }

  containsNumbers() {
    return this.contains(new RegExp(r'[0-9]'));
  }
}
