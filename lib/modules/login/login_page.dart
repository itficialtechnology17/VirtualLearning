import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/login_controller.dart';
import 'package:virtual_learning/modules/login/verfication_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLoginPage();
  }
}

class _StateLoginPage extends State<LoginPage> {
  var selectedPosition = 0;
  var isContactNoAdded = false;

  LoginController _loginController = Get.put(LoginController());

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
                SvgPicture.asset(
                  'assets/svg/ic_back.svg',
                  height: MediaQuery.of(context).size.width * 0.05,
                  width: MediaQuery.of(context).size.width * 0.05,
                  fit: BoxFit.cover,
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  VerificationPage()));
                                    } else {
                                      Flushbar(
                                        messageText: Text(
                                          "Please Enter Valid Mobile No.",
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
