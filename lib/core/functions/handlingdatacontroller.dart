import 'package:admin/core/class/statusrequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response; //can be null
  } else if (response is Map<String, dynamic>) {
    return StatusRequest.success;
  } else {
    return StatusRequest.serverfailure;
  }
}
