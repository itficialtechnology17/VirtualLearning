import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_subscription.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/show_snackbar.dart';
import 'package:virtual_learning/utils/url.dart';

class SubscriptionController extends GetxController {
  var isLoadingPlans = false.obs;
  var arrOfSubscription = List<ModelSubscription>().obs;

  @override
  void onInit() {
    super.onInit();
    getPlans();
  }

  void getPlans() async {
    isLoadingPlans.value = true;

    Request request = Request(url: urlGetSubscription, body: {
      'type': "API",
    });
    request.post().then((value) {
      isLoadingPlans.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfSubscription.assignAll((responseData['plans'] as List)
            .map((data) => ModelSubscription.fromJson(data))
            .toList());
        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isLoadingPlans.value = false;
      print(onError);
    });
  }
}
