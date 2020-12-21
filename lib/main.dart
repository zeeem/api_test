import 'dart:collection';
import 'package:http/http.dart' as http;
import 'NetworkGateway/networkManager.dart';
import 'dart:convert';

String baseAPIurl = "yizhouzhao.dev";

main(List<String> args) async {
  print("dart running --->>");

  //function to run
  await api_call_POST(); // POST
  // await api_call_GET(); //GET
}

api_call_GET() async {
  NetworkManager apiNetworkManager =
      NetworkManager(baseAPIurl, nursingHome: false);
  var response = await apiNetworkManager.request('GET', '/api/shortdoctors/');
  var body = await response.body;
  var valMap = await jsonDecode(response.body);
  // print(response);
  print(body);
  print(response.statusCode);
  // await print(response.body);
}

api_call_POST() async {
  String userNum = '2';
  String usertype = '1';
  Map<String, dynamic> map = {
    "username": "test_u${userNum}",
    "email": "test_u${userNum}@email.com",
    "height": "5.9",
    "weight": "68.4",
    "user_type": "$usertype", //0 = patient, 1=doctor
    "phone": "78090${usertype}000${userNum}",
    "date_of_birth": "1993-12-23",
    "gender": "0",
    "notes": " ",
    "password": "123123",
    "first_name": "fn_test_user$userNum",
    "last_name": "ln_test_user$userNum"
  };

  Map<String, dynamic> loginMap = {
    "username": "test_u2",
    "password": "123123#"
  };

  // print('map body====>> $map');

  NetworkManager apiNetworkManager =
      NetworkManager(baseAPIurl, nursingHome: false);
  var response =
      await apiNetworkManager.request('POST', '/api/login/', body: loginMap);

  // var body = jsonDecode(response.body);
  // print('logged in as: ${body['id']}');S
  print(response.statusCode);

//   Map<String, dynamic> facilityAssignMap = {"user": "${body['id']}"};

// // facility uuid: 381c31f1-f4fc-4d9a-aac0-6cdf7a78cdda

//   var response2 = await apiNetworkManager.request(
//       'PUT', '/api/belongsto/381c31f1-f4fc-4d9a-aac0-6cdf7a78cdda/',
//       body: facilityAssignMap);

//   print(response2.statusCode);
}
