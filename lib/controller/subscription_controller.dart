import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/model/model_price.dart';
import 'package:virtual_learning/model/model_subscription.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/show_snackbar.dart';
import 'package:virtual_learning/utils/url.dart';

class SubscriptionController extends GetxController {
  var isLoadingPlans = false.obs;
  var isLoadingPrice = false.obs;
  var arrOfSubscription = List<ModelSubscription>().obs;
  var arrOfPrice = List<ModelPrice>().obs;

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

  void getPrice(String planId) async {
    arrOfPrice.clear();
    isLoadingPrice.value = true;

    Request request = Request(url: urlGetPrice, body: {
      'type': "API",
      'plan_id': planId,
      'standard_id': standardId,
    });
    request.post().then((value) {
      isLoadingPrice.value = false;
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        arrOfPrice.assignAll((responseData['pricing'] as List)
            .map((data) => ModelPrice.fromJson(data))
            .toList());
        print("Success");
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      isLoadingPrice.value = false;
      print(onError);
    });
  }

  /* void doSubscribe(
    String planId,
    String subjectId,
  ) async {
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
  }*/
/*
  Future<Map<String, dynamic>> apiRemoveFromCart(foodId) async {
    final http.Response response = await http.post(
      baseUrl + urlRemoveFromCart,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'type': "API",
        'c_id': userId,
        'restaurant_id': restaurantId,
        'food_id': foodId
      }),
    );

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      _cartController.apiGetCartItem();
      return responseData;
    } else {
      Map<String, dynamic> map = Map<String, String>();
      map['status_code'] = 1;
      map['message'] = "Opps! Something went wrong.";
      return map;
    }
  }*/
}
