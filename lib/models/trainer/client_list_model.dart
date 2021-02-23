import 'package:gym_app/apis/api_helper.dart';
import 'package:gym_app/apis/api_response.dart';

Future<ApiResponse> clientList(int id) async {
  ApiResponse x = await ApiHelper().postReq(
    endpoint: "http://p2c-gym.herokuapp.com/trainer/trainerbatch/customer",
    data: {"id": id},
  );

  return x;
}
