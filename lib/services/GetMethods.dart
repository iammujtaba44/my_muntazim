import 'package:my_muntazim/services/Constants.dart';
import 'package:my_muntazim/services/RequestServices.dart';

import 'models/parentAuthModel.dart';

class GetMethods {
  static Future<bool> loginInit({String username, String password}) async {
    Constants.loginModel =
        await RequestServices.login(username: username, password: password);
    if (Constants.loginModel != null) {
      if (Constants.loginModel.message == 'success')
        return true;
      else
        return false;
    } else
      return false;
  }

  static Future<bool> studentsInit({String parentId}) async {
    Constants.studentsDataModel =
        await RequestServices.students(parentId: parentId);
    if (Constants.studentsDataModel != null) {
      if (Constants.studentsDataModel.message == 'success')
        return true;
      else
        return false;
    } else
      return false;
  }
}
