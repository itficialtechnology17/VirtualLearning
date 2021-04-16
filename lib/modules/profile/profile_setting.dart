import 'dart:io';

import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/login_page.dart';
import 'package:virtual_learning/modules/menu/parent_connect.dart';
import 'package:virtual_learning/modules/profile/contact_page.dart';
import 'package:virtual_learning/modules/profile/profile_update.dart';
import 'package:virtual_learning/modules/profile/webpage.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/my_preference.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/widgets/gradient_icon.dart';

class ProfileSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateProfileSetting();
  }
}

class _StateProfileSetting extends State<ProfileSetting> {
  String output = "";

  bool isDarkMode = false;
  bool isNotificationOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
            ),
            expandedHeight: 150,
            elevation: 0,
            pinned: true,
            brightness: Brightness.dark,
            backgroundColor: Color(0xff4F5A65),
            leading: Material(
              color: Colors.transparent,
              type: MaterialType.circle,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Platform.isAndroid
                      ? Icons.keyboard_backspace
                      : Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                  Color(0xff14C269),
                  Color(0xff0A0A78),
                ]))),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, position) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 24.0),
                          Text(
                            "Profile Details",
                            style: textStyle12.copyWith(color: Colors.grey),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () {
                                  Get.to(ProfileUpdate.value(""));
                                },
                                leading: RadiantGradientMask(
                                  child: Icon(
                                    Icons.perm_identity,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Text(
                                  "Profile".toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: const Icon(Icons.navigate_next,
                                    size: 18, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () async {
                                  Get.to(ParentConnect());
                                },
                                leading: RadiantGradientMask(
                                  child: Icon(
                                    Icons.people_alt_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Padding(
                                  child: Text(
                                    "Parent Connect",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(bottom: 0),
                                ),
                                trailing: const Icon(Icons.navigate_next,
                                    size: 18, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.0),
                          Text(
                            "General Settings",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          SizedBox(height: 8.0),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () {},
                                leading: RadiantGradientMask(
                                  child: Icon(
                                    Icons.notifications_none_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Padding(
                                  child: Text(
                                    "Notification",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(bottom: 0),
                                ),
                                trailing: Switch(
                                  value: isNotificationOn,
                                  onChanged: (value) {
                                    setState(() {
                                      isNotificationOn = value;
                                      if (isNotificationOn) {
                                        Get.changeThemeMode(ThemeMode.dark);
                                      } else {
                                        Get.changeThemeMode(ThemeMode.light);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () {},
                                leading: RadiantGradientMask(
                                  child: Icon(
                                    Icons.brightness_4_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Padding(
                                  child: Text(
                                    "Night Mode",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(bottom: 0),
                                ),
                                trailing: Switch(
                                  value: isDarkMode,
                                  onChanged: (value) {
                                    setState(() {
                                      isDarkMode = value;
                                      if (isDarkMode) {
                                        Get.changeThemeMode(ThemeMode.dark);
                                      } else {
                                        Get.changeThemeMode(ThemeMode.light);
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () {
                                  Get.to(ContactPage());
                                },
                                leading: RadiantGradientMask(
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Padding(
                                  child: Text(
                                    "Contact Us",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(bottom: 0),
                                ),
                                trailing: const Icon(Icons.navigate_next,
                                    size: 18, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () {
                                  AppReview.storeListing.then((String onValue) {
                                    setState(() {
                                      output = onValue;
                                    });
                                    print(onValue);
                                  });
                                },
                                leading: RadiantGradientMask(
                                  child: Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Padding(
                                  child: Text(
                                    "Rate the app",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(bottom: 0),
                                ),
                                trailing: const Icon(Icons.navigate_next,
                                    size: 18, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WebPage.titleUrl("Privacy & Term",
                                                  privacyPolicy)));
                                },
                                leading: RadiantGradientMask(
                                  child: Icon(
                                    Icons.privacy_tip_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Padding(
                                  child: Text(
                                    "Privacy & Term",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(bottom: 0),
                                ),
                                trailing: const Icon(Icons.navigate_next,
                                    size: 18, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WebPage.titleUrl(
                                                  "About Us", privacyPolicy)));
                                },
                                leading: RadiantGradientMask(
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                  ),
                                ),
                                title: Padding(
                                  child: Text(
                                    "About Us",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(bottom: 0),
                                ),
                                trailing: const Icon(Icons.navigate_next,
                                    size: 18, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              child: ListTile(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          _confirmLogout(context));
                                },
                                leading: Icon(
                                  Icons.power_settings_new,
                                  color: Colors.red,
                                ),
                                title: Padding(
                                  child: Text(
                                    "Logout",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  padding: EdgeInsets.only(bottom: 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 8, left: 30),
                      height: MediaQuery.of(context).size.height * 0.20,
                      color: Colors.grey[100],
                      child: Text("App Version 1.0.0"),
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  _confirmLogout(BuildContext context) {
    return AlertDialog(
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            children: <Widget>[
              Text(
                "Confirm Logout ?",
                style: TextStyle(fontSize: 18),
              )
            ],
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () async {
            Navigator.of(context, rootNavigator: true).pop('dialog');
            await addBoolToSF(KEY_IS_LOGIN, false);
            Get.offAll(LoginPage());
          },
          textColor: Colors.black,
          child: const Text('YES'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          textColor: Colors.red,
          child: const Text('CANCEL'),
        ),
      ],
    );
  }
}
