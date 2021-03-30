import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class LetsKnowYou extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLetsKnowYou();
  }
}

class _StateLetsKnowYou extends State<LetsKnowYou> {
  LoginController _loginController = Get.find();
  var isEmailIdAdded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/ic_register_bg.png"),
                  fit: BoxFit.cover)),
          child: Obx(() => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.10),
                    Image.asset(
                      "assets/images/ic_app_logo_name.png",
                      width: Get.width * 0.30,
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Text(
                      "Lets us Know more\nAbout you",
                      style: textStyle14Bold.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Container(
                      padding: EdgeInsets.only(left: margin4, right: margin4),
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 2))),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length > 3) {
                                setState(() {
                                  _loginController.modelUser.value.firstName =
                                      value;
                                });
                              }
                            },
                            style:
                                textStyle12Bold.copyWith(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: Get.width * (-0.02),
                                    vertical: Get.height * 0.02),
                                counterText: "",
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintStyle: textStyle10Bold.copyWith(
                                    color: Colors.white60),
                                hintText: "Name"),
                          )),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      "Let's know your name",
                      style: textStyleSmall.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Container(
                      padding: EdgeInsets.only(left: margin4, right: margin4),
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.white, width: 2))),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: TextFormField(
                            style:
                                textStyle12Bold.copyWith(color: Colors.white),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (checkEmailId(value)) {
                                  setState(() {
                                    isEmailIdAdded = true;
                                    _loginController.modelUser.value.email =
                                        value;
                                  });
                                } else {
                                  setState(() {
                                    isEmailIdAdded = false;
                                  });
                                }
                              } else {
                                setState(() {
                                  isEmailIdAdded = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: Get.width * (-0.02),
                                    vertical: Get.height * 0.02),
                                counterText: "",
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintStyle: textStyle10Bold.copyWith(
                                    color: Colors.white60),
                                hintText: "Email"),
                          )),
                    ),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      "Let's know your Email",
                      style: textStyleSmall.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        shrinkWrap: true,
                        childAspectRatio: 3 / 1,
                        children: List.generate(
                            _loginController.arrOfContactHours.length, (index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: index ==
                                        _loginController
                                            .selectedContactTimePosition
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _loginController
                                        .selectedContactTimePosition = index;
                                    _loginController.selectedTimeToContact =
                                        _loginController
                                            .arrOfContactHours[index];
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    _loginController.arrOfContactHours[index],
                                    style: textStyle10Bold.copyWith(
                                        color: _loginController
                                                    .selectedContactTimePosition ==
                                                index
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                    SizedBox(height: Get.height * 0.01),
                    Text(
                      "Best Time to Connect you.",
                      style: textStyleSmall.copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          if (_loginController.modelUser.value.firstName ==
                                  "" ||
                              _loginController.modelUser.value.firstName ==
                                  null) {
                            Flushbar(
                              messageText: Text(
                                "Please Enter Name",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.white,
                            )..show(context);
                          } else if (!isEmailIdAdded) {
                            Flushbar(
                              messageText: Text(
                                "Please Enter Valid Email Address",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.white,
                            )..show(context);
                          } else {
                            _loginController.updateUserDetails("1");
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4)),
                          constraints: BoxConstraints(
                            minWidth: Get.width * 0.20,
                            maxWidth: Get.width * 0.30,
                            minHeight: Get.height * 0.06,
                          ),
                          child: Center(
                            child: _loginController.isSignUp.value
                                ? SizedBox(
                                    height: Get.width * 0.07,
                                    width: Get.width * 0.07,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Next",
                                        style: textStyle10Bold.copyWith(
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: margin4,
                                      ),
                                      Icon(
                                        Icons.navigate_next_outlined,
                                      )
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.18,
                    ),
                  ],
                ),
              )),
        ));
  }
}
