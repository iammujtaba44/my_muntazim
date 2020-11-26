import 'package:my_muntazim/services/ApiUrls.dart';
import 'package:my_muntazim/services/Constants.dart';
import 'package:my_muntazim/services/models/LoginModel.dart';
import 'package:my_muntazim/services/models/StudentsDataModel.dart';
import 'package:my_muntazim/services/models/parentAuthModel.dart';
import 'package:http/http.dart' as http;


class RequestServices {
  static Future<LoginModel> login({String username, String password}) async {
    var response = await http.post(LoginUrl, body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;

      return loginModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }

  //Students

  static Future<StudentsDataModel> students({String parentId}) async {
    var response = await http.get(StudentsUrl + parentId,
        headers: {'access-token': Constants.loginModel.data.accessToken});

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final String map = response.body;

      return studentDataModelFromJson(map);
    } else {
      print("Query failed: ${response.body} (${response.statusCode})");
      return null;
    }
  }
}
