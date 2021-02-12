import 'dart:convert';
import 'dart:io';

import 'package:cashfree/cashfree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/controller/subscription_controller.dart';
import 'package:virtual_learning/modules/subscription/cashfree_payment.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/url.dart';

class PaymentController extends GetxController {
  LoginController _loginController = Get.find();
  String planId = "";

  final Cashfree _cashfree = Cashfree();
  SubscriptionController _subscriptionController = Get.find();

  var index = -1.obs;
  @override
  void onInit() {
    super.onInit();
    _cashfree.on(Cashfree.EVENT_PAYMENT_SUCCESS, _handleCashfreePaymentSuccess);
    _cashfree.on(Cashfree.EVENT_PAYMENT_ERROR, _handleCashfreePaymentError);
    _cashfree.on(Cashfree.EVENT_ERROR, _handleCashfreeError);
  }

  void checkCredentials(
      String amount, String subscriptionId, String subjectIds, int i) {
    var message = "";
    planId = subscriptionId;
    index = i;

    if (_loginController.modelUser.value.mobileNumber != null &&
        _loginController.modelUser.value.mobileNumber.length >= 10 &&
        checkEmailId(_loginController.modelUser.value.email)) {
      getToken(amount, subscriptionId, subjectIds);
    } else {
      if (_loginController.modelUser.value.email == "null" ||
          !checkEmailId(_loginController.modelUser.value.email)) {
        if (_loginController.modelUser.value.mobileNumber == null ||
            _loginController.modelUser.value.mobileNumber.length < 10) {
          message = "Please Enter Valid Mobile Number & Email";
        } else {
          message = "Please Enter Valid Email Address";
          // showToast("Please Enter Valid Email Address");
        }
      } else {
        if (_loginController.modelUser.value.mobileNumber == null ||
            _loginController.modelUser.value.mobileNumber == "" ||
            _loginController.modelUser.value.mobileNumber.length < 10) {
          message = "Please Enter Valid Mobile Number";
        }
      }
      // Get.to(AccountPage.value(message));
    }
  }

  var isTokenGenerating = false.obs;

  void getToken(String amount, String subscriptionId, String subjectIds) async {
    if (Platform.isAndroid) {
      _subscriptionController.arrOfSubscription[index].isLoading = true;

      Request request = Request(url: urlGenerateToken, body: {
        'type': "API",
        'amount': amount,
        'student_id': studentId.toString(),
        // 'plan_id': subscriptionId.toString(),
      });

      request.post().then((value) {
        _subscriptionController.arrOfSubscription[index].isLoading = false;
        if (value.statusCode == 200) {
          var responseData = jsonDecode(value.body);
          if (responseData['status_code'] == 1) {
            var responseData = jsonDecode(value.body);
            _doPayment(responseData, amount);
          } else {
            showSnackBar("Opps!", responseData['message'], Colors.red);
          }
        } else {
          showSnackBar("Error", "Opps! Something wrong.", Colors.red);
        }
      }).catchError((onError) {
        _subscriptionController.arrOfSubscription[index].isLoading = false;
        print(onError);
      });
    } else {
      Map<String, dynamic> responseJSON =
          await Get.to(CashfreePayment(amount, "Subscribe", "planId"));

      if (responseJSON['txStatus'] == "SUCCESS") {
        sendSuccessPaymentResponse(
            "SUCCESS",
            responseJSON['referenceId'],
            responseJSON['orderId'],
            responseJSON['signature'],
            responseJSON['orderAmount'],
            responseJSON['paymentMode']);
      } else {
        sendErrorPaymentResponse("FAILED");
      }
    }
  }

  void _doPayment(responseData, String amount) {
    var options = {
      'token': responseData['cftoken'],
      'stage': paymentStage,
      'appId': responseData['app_id'],
      'orderId': responseData['orderId'],
      'orderAmount': amount,
      'orderNote': "",
      'orderCurrency': responseData['orderCurrency'],
      'customerName': _loginController.modelUser.value.firstName,
      'customerEmail': _loginController.modelUser.value.email,
      'customerPhone': _loginController.modelUser.value.mobileNumber == null
          ? "9999999999"
          : _loginController.modelUser.value.mobileNumber,
      'notifyUrl': '',
      "paymentModes": ''
    };
    _cashfree.doPayment(options);
  }

  void _handleCashfreePaymentSuccess(
      CashfreePaymentSuccessResponse paymentResponse) async {
    sendSuccessPaymentResponse(
        paymentResponse.type,
        paymentResponse.referenceId,
        paymentResponse.orderId,
        paymentResponse.signature,
        paymentResponse.orderAmount,
        paymentResponse.paymentMode);
  }

  void sendSuccessPaymentResponse(
      type, referenceId, orderId, signature, orderAmount, paymentMode) async {
    _subscriptionController.arrOfSubscription[index].isLoading = true;

    Request request = Request(url: urlPaymentDetails, body: {
      'student_id': studentId,
      'type': type,
      'referenceId': referenceId,
      'orderId': orderId,
      'status': "Success",
      'message': "Payment Successful",
      'signature': signature,
      'orderAmount': orderAmount,
      'paymentMode': paymentMode,
    });

    request.post().then((value) {
      _subscriptionController.arrOfSubscription[index].isLoading = false;
      if (value.statusCode == 200) {
        var responseData = jsonDecode(value.body);
        if (responseData['status_code'] == 1) {
          showSnackBar("Success", responseData['message'], Colors.green);
        } else {
          showSnackBar("Opps!", responseData['message'], Colors.red);
        }
      } else {
        showSnackBar("Error", "Opps! Something wrong.", Colors.red);
      }
    }).catchError((onError) {
      _subscriptionController.arrOfSubscription[index].isLoading = false;
      print(onError);
    });
  }

  void _handleCashfreePaymentError(
      CashfreePaymentFailureResponse response) async {
    sendErrorPaymentResponse(response.type);
    showSnackBar("Error", response.txMsg, Colors.red);
  }

  void sendErrorPaymentResponse(String type) async {
    Request request = Request(url: urlPaymentDetails, body: {
      'type': type,
      'student_id': studentId,
      'orderAmount': "",
      'status': "Failed",
      'message': "Payment Failed",
      'orderId': "",
    });
    request.post().then((value) {}).catchError((onError) {});
  }

  void _handleCashfreeError(CashfreeError cashfreeError) async {
    _subscriptionController.arrOfSubscription[index].isLoading = false;
  }

  void submitSubscribe(
      type, referenceId, orderId, signature, orderAmount, paymentMode) async {
    _subscriptionController.arrOfSubscription[index].isLoading = true;

    Request request = Request(url: urlSubscribe, body: {
      'student_id': studentId,
      'type': type,
      'referenceId': referenceId,
      'orderId': orderId,
      'status': "Success",
      'message': "Payment Successful",
      'signature': signature,
      'orderAmount': orderAmount,
      'paymentMode': paymentMode,
    });

    request.post().then((value) {
      _subscriptionController.arrOfSubscription[index].isLoading = false;
      if (value.statusCode == 200) {
        var responseData = jsonDecode(value.body);
        if (responseData['status_code'] == 1) {
          showSnackBar("Success", responseData['message'], Colors.green);
        } else {
          showSnackBar("Opps!", responseData['message'], Colors.red);
        }
      } else {
        showSnackBar("Error", "Opps! Something wrong.", Colors.red);
      }
    }).catchError((onError) {
      _subscriptionController.arrOfSubscription[index].isLoading = false;
      print(onError);
    });
  }
}
