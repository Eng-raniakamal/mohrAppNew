class ValidUtils  {
  static ifValidPassword(String? text) {

    if (text == null || text.trim().isEmpty) {
      return "ادخل باسورد";
    }
    if (text.length < 6) {
      return "ادخل باسورد لايثل عن 6 رموز";
    }
  }
  static ifValidEmail(String? text) {
    String msgError = ' أدخل بريدك الإلكتروني الصحيح';
    String msgErrorValid = ' أدخل البريد الإلكتروني بشكل الصحيح';
    bool emailValid;
    if (text == null || text.trim().isEmpty) {
      return " $msgError ";
    }
    emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
    if (!emailValid) {
      return " $msgErrorValid ";
    }

  }

}
