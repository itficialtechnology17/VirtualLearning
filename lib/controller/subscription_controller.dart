import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_learning/model/model_subscription_plan.dart';

class SubscriptionController extends GetxController {
  var isLoadingPlans = false.obs;
  var arrOfSubscriptionPlan = List<ModelSubscriptionPlan>().obs;

  @override
  void onInit() {
    super.onInit();
    getPlans();
  }

  /*void getPlans() async {
    isLoadingPlans.value = true;

    Request request = Request(url: urlGetPlans, body: {
      'type': "API",
    });
    request.post().then((value) {
      isLoadingPlans.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfSubscriptionPlan.assignAll((responseData['data'] as List)
            .map((data) => ModelSubscriptionPlan.fromJson(data))
            .toList());
        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isLoadingPlans.value = false;
      print(onError);
    });
  }*/

  void getPlans() async {
    final http.Response response = await http.post(
      "https://theschule.com/backend/index.php/api/plan",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'type': "API",
        'user_id': "26",
      }),
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData['status_code'] == 1) {
        arrOfSubscriptionPlan.assignAll((responseData['plan'] as List)
            .map((data) => ModelSubscriptionPlan.fromJson(data))
            .toList());
      }
    } else {
      print("");
    }
  }
}
