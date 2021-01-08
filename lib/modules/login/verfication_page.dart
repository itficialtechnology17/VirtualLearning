import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:virtual_learning/controller/login_controller.dart';

class VerificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateVerificationPage();
  }
}

class _StateVerificationPage extends State<VerificationPage> {
  var selectedPosition = 0;
  var isCodeOne = false;
  var isCodeTwo = false;
  var isCodeThree = false;
  var isCodeFour = false;
  var isCodeAdded = false;
  String code1 = "", code2 = "", code3 = "", code4 = "";
  var focusNode1, focusNode2, focusNode3;

  LoginController _loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
  }

  @override
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
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/svg/ic_back.svg',
                    height: MediaQuery.of(context).size.width * 0.05,
                    width: MediaQuery.of(context).size.width * 0.05,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32, left: 14),
                  child: Text(
                    'Verification',
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
                    "Verify your number and never stop learning",
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                      color:
                          isCodeOne == true ? Color(0xff205072) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color(0xff3aa59b), width: isCodeOne ? 0 : 1)),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color: isCodeOne == true
                            ? Colors.white
                            : Color(0xff205072)),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          isCodeOne = true;
                          code1 = value;
                          FocusScope.of(context).requestFocus(focusNode1);
                        });
                      } else {
                        setState(() {
                          isCodeOne = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                      color:
                          isCodeTwo == true ? Color(0xff205072) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color(0xff3aa59b), width: isCodeTwo ? 0 : 1)),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    focusNode: focusNode1,
                    style: TextStyle(
                        color: isCodeTwo == true
                            ? Colors.white
                            : Color(0xff205072)),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          isCodeTwo = true;
                          code2 = value;
                          FocusScope.of(context).requestFocus(focusNode2);
                        });
                      } else {
                        setState(() {
                          isCodeTwo = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                      color: isCodeThree == true
                          ? Color(0xff205072)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color(0xff3aa59b),
                          width: isCodeThree ? 0 : 1)),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    focusNode: focusNode2,
                    style: TextStyle(
                        color: isCodeThree == true
                            ? Colors.white
                            : Color(0xff205072)),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          isCodeThree = true;
                          code3 = value;
                          FocusScope.of(context).requestFocus(focusNode3);
                        });
                      } else {
                        setState(() {
                          isCodeThree = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                      color:
                          isCodeFour == true ? Color(0xff205072) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Color(0xff3aa59b), width: isCodeFour ? 0 : 1)),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    focusNode: focusNode3,
                    style: TextStyle(
                        color: isCodeFour == true
                            ? Colors.white
                            : Color(0xff205072)),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          isCodeFour = true;
                          code4 = value;
                          if (isCodeOne &&
                              isCodeTwo &&
                              isCodeThree &&
                              isCodeFour) {
                            isCodeAdded = true;
                          }
                        });
                      } else {
                        setState(() {
                          isCodeFour = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Container(
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
                              colors: [Color(0xffA1E217), Color(0xff196C31)]),
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          'CONTINUE',
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
                        if (isCodeAdded) {
                          _loginController
                              .checkOTP(code1 + code2 + code3 + code4);
                        } else {
                          Flushbar(
                            messageText: Text(
                              "Please Enter Valid OTP.",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            duration: Duration(seconds: 3),
                            backgroundColor: Color(0xff205072),
                          )..show(context);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
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
