import 'package:get/get_utils/src/get_utils/get_utils.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Required";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return notValidMessage("username");
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return notValidMessage("Email");
    }
  }
  if (type == "number") {
    if (!GetUtils.isNumericOnly(val)) {
      return notValidMessage("number");
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return notValidMessage("Phone");
    }
  }
  if (type == "text") {}
  if (val.length < min) {
    return notValidLength("less", min);
  }
  if (val.length > max) {
    return notValidLength("larger", max);
  }
}

String notValidMessage(String val) {
  return "not valid ${val}";
}

String notValidLength(String operator, int min) {
  return "value cant be ${operator} than ${min}";
}
