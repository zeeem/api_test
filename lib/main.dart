import 'dart:collection';
import 'package:http/http.dart' as http;
import 'NetworkGateway/networkManager.dart';

String baseAPIurl = "https://yizhouzhao.dev";

main(List<String> args) async {
  print("dart running --->>");
  await api_call_POST();
}

api_call_GET() async {
  NetworkManager apiNetworkManager =
      NetworkManager(baseAPIurl, nursingHome: false);
  var response = await apiNetworkManager.request('GET', '/api/shortdoctors/');
  print(response);
  print(response.body);
  print(response.statusCode);
  await print(response.body);
}

api_call_POST() async {
  String userNum = '3';
  String usertype = '0';
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

  print('map body====>> $map');

  NetworkManager apiNetworkManager =
      NetworkManager(baseAPIurl, nursingHome: false);
  var response =
      await apiNetworkManager.request('POST', '/api/shortdoctors/', body: map);
  print(response);
  print(response.body);
  print(response.statusCode);
  await print(response.body);
}
