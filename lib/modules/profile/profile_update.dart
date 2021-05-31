import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/login_controller.dart';
import 'package:virtual_learning/model/model_user.dart';
import 'package:virtual_learning/network/request.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/utils/url.dart';

class ProfileUpdate extends StatefulWidget {
  String message = "";

  ProfileUpdate.value(this.message);

  @override
  State<StatefulWidget> createState() {
    return _StateProfileUpdate();
  }
}

class _StateProfileUpdate extends State<ProfileUpdate> {
  var userName = "";
  var emailAddress = "";
  var cityId = "";
  var locationId = "";
  var cityName = "Surat";
  var locationName = "";
  var genderType = "";

  var address = "Address";

  String photo_1 = "";
  String photo_2 = "";
  String photo_3 = "";
  var facebook = "";
  var instagram = "";
  var website = "";
  var description = "";

  File _image;
  File _image2;
  File _image3;

  var isLogoSelected = false;
  var isOtherPhoto1Selected = false;
  var isOtherPhoto2Selected = false;

  var isLogoUpdate = false;
  var isOtherPhoto1Updated = false;
  var isOtherPhoto2Updated = false;

  ThemeController _themeController = Get.find();

  LoginController _loginController = Get.find();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ModelUser modelUser = ModelUser();

  @override
  void initState() {
    super.initState();
    if (widget.message != "") {
      showToast(widget.message);
    }

    modelUser = _loginController.modelUser.value;
  }

  borderDecoration(String type) {
    return InputDecoration(
        labelText: type,
        contentPadding: EdgeInsets.all(0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff4F5A65)),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: _themeController.background.value,
          body: Obx(() => Stack(
                children: [
                  /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
                  Scaffold(
                    backgroundColor: _themeController.background.value,
                    appBar: PreferredSize(
                      preferredSize:
                          Size.fromHeight(AppBar().preferredSize.height),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          Expanded(
                            child: Container(
                              // color: Colors.lightGreenAccent,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Material(
                                      color: Colors.transparent,
                                      type: MaterialType.circle,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(margin8),
                                          child: Image.asset(
                                            ASSETS_ICONS_PATH + 'ic_back.png',
                                            height: iconHeightWidth,
                                            width: iconHeightWidth,
                                            fit: BoxFit.fitWidth,
                                            color: _themeController
                                                .iconColor.value,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      "Profile Update".toUpperCase(),
                                      style: textStyle10Bold.copyWith(
                                          color:
                                              _themeController.textColor.value),
                                      textScaleFactor: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    body: Container(
                      padding: EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                            ),
                            Text("Personal Details"),
                            SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              decoration: borderDecoration("Name"),
                              initialValue: _loginController
                                          .modelUser.value.firstName ==
                                      null
                                  ? ""
                                  : _loginController.modelUser.value.firstName,
                              onChanged: (value) {
                                setState(() {
                                  userName = value;
                                  modelUser.firstName = userName;
                                });
                              },
                              style: textStyle10.copyWith(
                                  color: _themeController.textColor.value),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              initialValue:
                                  _loginController.modelUser.value.email == null
                                      ? ""
                                      : _loginController.modelUser.value.email,
                              decoration: borderDecoration("Email"),
                              onChanged: (value) {
                                setState(() {
                                  emailAddress = value;
                                  modelUser.email = emailAddress;
                                });
                              },
                              style: textStyle10.copyWith(
                                  color: _themeController.textColor.value),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottomNavigationBar: Container(
                      height: Get.height * 0.05,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xff14C269),
                                Color(0xff0A0A78),
                              ]),
                          borderRadius: BorderRadius.circular(24)),
                      margin: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.30,
                          vertical: Platform.isAndroid ? 0 : 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Center(
                                    child: isUpdating
                                        ? CircularProgressIndicator()
                                        : Text(
                                            "Save".toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          )),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.grey[50],
                                    onTap: () {
                                      if (modelUser.firstName.isEmpty) {
                                        showSnackBar("Required",
                                            "Name is required", Colors.yellow);
                                      } else if (modelUser.email.isEmpty) {
                                        showSnackBar("Required",
                                            "Email is required", Colors.yellow);
                                      } else {
                                        _loginController.modelUser.value
                                            .firstName = modelUser.firstName;
                                        _loginController.modelUser.value.email =
                                            modelUser.email;
                                        updateUserDetails();
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  bool isUpdating = false;

  void updateUserDetails() async {
    setState(() {
      isUpdating = true;
    });
    Request request = Request(url: urlUpdateProfile, body: {
      'type': "API",
      'id': studentId.toString(),
      'first_name': _loginController.modelUser.value.firstName.toString(),
      'email': _loginController.modelUser.value.email.toString(),
      'is_registered': "0",
      'standard_id': standardId.toString(),
    });

    request.post().then((value) async {
      setState(() {
        isUpdating = false;
      });
      final responseData = json.decode(value.body);

      if (responseData['status_code'] == 1) {
        showToast(responseData['message']);
        Get.back();
      } else {
        showSnackBar("Error", responseData['message'], Colors.red);
      }
    }).catchError((onError) {
      setState(() {
        isUpdating = false;
      });
      showSnackBar("Error", "Opps! Internal App Error", Colors.red);
      print(onError);
    });
  }
}
