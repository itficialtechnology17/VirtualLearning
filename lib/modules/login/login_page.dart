import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/modules/login/verification_page.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLoginPage();
  }
}

class _StateLoginPage extends State<LoginPage> {
  var selectedPosition = 0;
  var isContactNoAdded = false;
  var mobileNumber = "";

  bool isValidMobileNumber = false;
  LoginController _loginController;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      _loginController = Get.put(LoginController());
    });
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32, left: 14),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 36,
                      color: const Color(0xff205072),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    "Begin Learning",
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color(0xff3aa59b),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.80,
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: getBoxShadow(1),
                                border: Border.all(
                                    color: selectedPosition == 1
                                        ? Colors.transparent
                                        : Color(0xff3aa59b)),
                                borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 24, right: 16),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.length == 10) {
                                          setState(() {
                                            isContactNoAdded = true;
                                            _loginController.enterMobileNumber =
                                                value;
                                          });
                                        } else {
                                          setState(() {
                                            isContactNoAdded = false;
                                          });
                                        }
                                      },
                                      onTap: () {
                                        setState(() {
                                          selectedPosition = 1;
                                        });
                                      },
                                      onFieldSubmitted: (value) {
                                        setState(() {
                                          selectedPosition = 0;
                                        });
                                      },
                                      maxLength: 10,
                                      style:
                                          TextStyle(color: Color(0xff205072)),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintText: "Mobile No.",
                                          counterText: "",
                                          hintStyle: TextStyle(
                                              color: Color(0xff3AA59B)
                                                  .withOpacity(0.3)),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      child: isContactNoAdded
                                          ? Center(
                                              child: Icon(
                                              Icons.done,
                                              size: 15,
                                              color: Colors.white,
                                            ))
                                          : Container(),
                                      decoration: BoxDecoration(
                                          color: isContactNoAdded
                                              ? Color(0xff205072)
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(isContactNoAdded
                                                      ? 0xff205072
                                                      : 0xff3aa59b)
                                                  .withOpacity(isContactNoAdded
                                                      ? 1
                                                      : 0.3),
                                              width: isContactNoAdded ? 0 : 1)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          height: MediaQuery.of(context).size.height * 0.08,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xffA1E217),
                                            Color(0xff196C31)
                                          ]),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                    child: Text(
                                      'GET OTP',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.white60,
                                  borderRadius: BorderRadius.circular(16),
                                  onTap: () {
                                    if (isContactNoAdded) {
                                      _loginController.getOTP();
                                      Get.to(VerificationPage());
                                      // Get.off(VerificationPage());
                                    } else {
                                      Flushbar(
                                        messageText: Text(
                                          "Please Enter Valid Mobile No.",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Color(0xff205072),
                                      )..show(context);
                                    }
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.80,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0A78),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/ic_splash.png"),
                fit: BoxFit.cover)),
        padding: EdgeInsets.all(20),
        child: KeyboardActions(
          config: _buildConfig(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * 0.20),
              Image.asset(
                "assets/images/ic_app_logo_name.png",
                width: Get.width * 0.30,
              ),
              SizedBox(height: Get.height * 0.05),
              Text(
                "Login",
                style: textStyle14Bold.copyWith(color: Colors.white),
              ),
              SizedBox(height: Get.height * 0.03),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2))),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: margin4, right: margin4),
                      child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.13,
                          child: TextFormField(
                            enabled: false,
                            initialValue: "+91",
                            style: textStyle11
                                .copyWith(color: Colors.white)
                                .copyWith(letterSpacing: 4.0),
                            decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "+91"),
                          )),
                    ),
                    Container(
                      width: 2,
                      height: MediaQuery.of(context).size.height * 0.03,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                    SizedBox(
                      width: margin4,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.60,
                      child: TextFormField(
                        // textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        maxLength: 10,

                        onChanged: (value) {
                          if (value.length == 10) {
                            setState(() {
                              isContactNoAdded = true;
                              _loginController.enterMobileNumber = value;
                            });
                          } else {
                            setState(() {
                              isContactNoAdded = false;
                            });
                          }
                        },
                        style: textStyle11
                            .copyWith(color: Colors.white)
                            .copyWith(letterSpacing: 4.0),
                        autofocus: true,
                        onFieldSubmitted: (value) {
                          if (isContactNoAdded) {
                            _loginController.getOTP();
                            Get.to(VerificationPage());
                          } else {
                            showToast("Please enter valid mobile number", 0);
                          }
                        },

                        decoration: InputDecoration(
                            counterText: "",
                            hintStyle: TextStyle(color: Colors.white60)
                                .copyWith(letterSpacing: 4.0),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "00000 00000"),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Text(
                "Let's Start with your Mobile Number",
                style: textStyleSmall.copyWith(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final FocusNode _nodeText4 = FocusNode();
  final FocusNode _nodeText5 = FocusNode();
  final FocusNode _nodeText6 = FocusNode();

  /// Creates the [KeyboardActionsConfig] to hook up the fields
  /// and their focus nodes to our [FormKeyboardActions].
  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
        ),
        KeyboardActionsItem(focusNode: _nodeText2, toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.close),
              ),
            );
          }
        ]),
        KeyboardActionsItem(
          focusNode: _nodeText3,
          onTapAction: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Custom Action"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  );
                });
          },
        ),
        KeyboardActionsItem(
          focusNode: _nodeText5,
          toolbarButtons: [
            //button 1
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "CLOSE",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
            //button 2
            (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "DONE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
          ],
        ),
        KeyboardActionsItem(
          focusNode: _nodeText6,
          footerBuilder: (_) => PreferredSize(
              child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text('Custom Footer'),
                  )),
              preferredSize: Size.fromHeight(40)),
        ),
      ],
    );
  }

  getBoxShadow(int i) {
    if (selectedPosition == i) {
      return [
        BoxShadow(color: Colors.grey, blurRadius: 8, offset: Offset(4.0, 3.0))
      ];
    } else
      return null;
  }
}
