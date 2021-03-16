import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/utils/methods.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSignUpPage();
  }
}

class _StateSignUpPage extends State<SignUpPage> {
  var selectedPosition = 0;
  var isNameAdded = false;
  var isCityAdded = false;
  var isSchoolAdded = false;
  var isEmailIdAdded = false;
  var focusNode1;
  var focusNode2;
  var focusNode3;

  LoginController _loginController = Get.find();
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
                SvgPicture.asset(
                  'assets/svg/ic_back.svg',
                  height: MediaQuery.of(context).size.width * 0.05,
                  width: MediaQuery.of(context).size.width * 0.05,
                  fit: BoxFit.cover,
                ),
                /*Padding(
                  padding: EdgeInsets.only(top: 32, left: 14),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 36,
                      color: const Color(0xff205072),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),*/
                Padding(
                  padding: EdgeInsets.only(top: 32, left: 16),
                  child: Text(
                    "Let's know you better",
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
                                        if (value.length > 3) {
                                          setState(() {
                                            isNameAdded = true;
                                            _loginController.modelUser.value
                                                .firstName = value;
                                          });
                                        } else {
                                          setState(() {
                                            isNameAdded = false;
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
                                          selectedPosition = 2;
                                        });
                                        FocusScope.of(context)
                                            .requestFocus(focusNode1);
                                      },
                                      style:
                                          TextStyle(color: Color(0xff205072)),
                                      decoration: InputDecoration(
                                          hintText: "Name",
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
                                      child: isNameAdded
                                          ? Center(
                                              child: Icon(
                                              Icons.done,
                                              size: 15,
                                              color: Colors.white,
                                            ))
                                          : Container(),
                                      decoration: BoxDecoration(
                                          color: isNameAdded
                                              ? Color(0xff205072)
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(isNameAdded
                                                      ? 0xff205072
                                                      : 0xff3aa59b)
                                                  .withOpacity(
                                                      isNameAdded ? 1 : 0.3),
                                              width: isNameAdded ? 0 : 1)),
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
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: getBoxShadow(2),
                                border: Border.all(
                                    color: selectedPosition == 2
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
                                        if (value.length > 2) {
                                          setState(() {
                                            isCityAdded = true;
                                            _loginController.modelUser.value
                                                .address = value;
                                          });
                                        } else {
                                          setState(() {
                                            isCityAdded = false;
                                          });
                                        }
                                      },
                                      onTap: () {
                                        setState(() {
                                          selectedPosition = 2;
                                        });
                                      },
                                      onFieldSubmitted: (value) {
                                        setState(() {
                                          selectedPosition = 3;
                                        });
                                        FocusScope.of(context)
                                            .requestFocus(focusNode2);
                                      },
                                      focusNode: focusNode1,
                                      style:
                                          TextStyle(color: Color(0xff205072)),
                                      decoration: InputDecoration(
                                          hintText: "City",
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
                                      child: isCityAdded
                                          ? Center(
                                              child: Icon(
                                              Icons.done,
                                              size: 15,
                                              color: Colors.white,
                                            ))
                                          : Container(),
                                      decoration: BoxDecoration(
                                          color: isCityAdded
                                              ? Color(0xff205072)
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(isCityAdded
                                                      ? 0xff205072
                                                      : 0xff3aa59b)
                                                  .withOpacity(
                                                      isCityAdded ? 1 : 0.3),
                                              width: isCityAdded ? 0 : 1)),
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
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: getBoxShadow(3),
                                border: Border.all(
                                    color: selectedPosition == 3
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
                                        if (value.length > 6) {
                                          setState(() {
                                            isSchoolAdded = true;
                                            _loginController.modelUser.value
                                                .schoolName = value;
                                          });
                                        } else {
                                          setState(() {
                                            isSchoolAdded = false;
                                          });
                                        }
                                      },
                                      onTap: () {
                                        setState(() {
                                          selectedPosition = 3;
                                        });
                                      },
                                      onFieldSubmitted: (value) {
                                        setState(() {
                                          selectedPosition = 4;
                                        });
                                        FocusScope.of(context)
                                            .requestFocus(focusNode3);
                                      },
                                      focusNode: focusNode2,
                                      style:
                                          TextStyle(color: Color(0xff205072)),
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                          hintText: "School Name",
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
                                      child: isSchoolAdded
                                          ? Center(
                                              child: Icon(
                                              Icons.done,
                                              size: 15,
                                              color: Colors.white,
                                            ))
                                          : Container(),
                                      decoration: BoxDecoration(
                                          color: isSchoolAdded
                                              ? Color(0xff205072)
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(isSchoolAdded
                                                      ? 0xff205072
                                                      : 0xff3aa59b)
                                                  .withOpacity(
                                                      isSchoolAdded ? 1 : 0.3),
                                              width: isSchoolAdded ? 0 : 1)),
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
                            height: MediaQuery.of(context).size.height * 0.10,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: getBoxShadow(4),
                                border: Border.all(
                                    color: selectedPosition == 4
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
                                        if (value.isNotEmpty) {
                                          if (checkEmailId(value)) {
                                            setState(() {
                                              isEmailIdAdded = true;
                                              _loginController.modelUser.value
                                                  .email = value;
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
                                      onTap: () {
                                        setState(() {
                                          selectedPosition = 4;
                                        });
                                      },
                                      onFieldSubmitted: (value) {
                                        setState(() {
                                          selectedPosition = 0;
                                        });
                                      },
                                      focusNode: focusNode3,
                                      style:
                                          TextStyle(color: Color(0xff205072)),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          hintText: "Email ID.",
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
                                      child: isEmailIdAdded
                                          ? Center(
                                              child: Icon(
                                              Icons.done,
                                              size: 15,
                                              color: Colors.white,
                                            ))
                                          : Container(),
                                      decoration: BoxDecoration(
                                          color: isEmailIdAdded
                                              ? Color(0xff205072)
                                              : Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(isEmailIdAdded
                                                      ? 0xff205072
                                                      : 0xff3aa59b)
                                                  .withOpacity(
                                                      isEmailIdAdded ? 1 : 0.3),
                                              width: isEmailIdAdded ? 0 : 1)),
                                    ),
                                  ),
                                )
                              ],
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        InkWell(
                          onTap: () {
                            if (!isNameAdded) {
                              showSnackBar(
                                  "Empty", "Please Enter Name", Colors.red);
                            } else if (!isCityAdded) {
                              showSnackBar(
                                  "Empty", "Please Enter City", Colors.red);
                            } else if (!isSchoolAdded) {
                              showSnackBar("Empty", "Please Enter School Name",
                                  Colors.red);
                            } else {
                              _loginController.updateUserDetails("1");
                            }
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.80,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xffA1E217),
                                        Color(0xff196C31)
                                      ]),
                                  boxShadow: getBoxShadow(4),
                                  borderRadius: BorderRadius.circular(16)),
                              child: _loginController.isSignUp.value
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Center(
                                      child: Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
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

  bool checkEmailId(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
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
