import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/login_page.dart';
import 'package:virtual_learning/modules/menu/parent_connect.dart';
import 'package:virtual_learning/modules/profile/contact_page.dart';
import 'package:virtual_learning/modules/profile/profile_update.dart';
import 'package:virtual_learning/modules/profile/webpage.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/my_preference.dart';
import 'package:virtual_learning/utils/textstyle.dart';
import 'package:virtual_learning/widgets/gradient_icon.dart';

class MoreTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateHome();
  }
}

class _StateHome extends State<MoreTab> {
  bool isDarkMode = false;
  bool isNotificationOn = false;
  String output = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9FB),
      body: Stack(
        children: [
          /* Image.asset(
                ASSETS_BG_PATH + 'ic_home_top_bg.png',
                height: Get.height * 0.20,
                width: Get.width * 0.60,
                fit: BoxFit.fill,
              ),*/
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.lightGreenAccent,
                      child: Center(
                        child: Text(
                          "Profile Setting".toUpperCase(),
                          style: textStyle10Bold,
                          textScaleFactor: 1.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
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
                              "Profile",
                              style:
                                  textStyle10.copyWith(color: Colors.blueGrey),
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
                                style: textStyle10.copyWith(
                                    color: Colors.blueGrey),
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
                        style: textStyle10Bold.copyWith(color: Colors.grey),
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
                                style: textStyle10.copyWith(
                                    color: Colors.blueGrey),
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
                                style: textStyle10.copyWith(
                                    color: Colors.blueGrey),
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
                                style: textStyle10.copyWith(
                                    color: Colors.blueGrey),
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
                                style: textStyle10.copyWith(
                                    color: Colors.blueGrey),
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
                                      builder: (context) => WebPage.titleUrl(
                                          "Privacy & Term", privacyPolicy)));
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
                                style: textStyle10.copyWith(
                                    color: Colors.blueGrey),
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
                                      builder: (context) => WebPage.titleUrl(
                                          "About Us", aboutUs)));
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
                                style: textStyle10.copyWith(
                                    color: Colors.blueGrey),
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
                                style: textStyle10.copyWith(
                                    color: Colors.blueGrey),
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
                  padding: EdgeInsets.only(top: 8, left: 30, bottom: margin16),
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "App Version 1.0.0",
                      style: textStyle9.copyWith(color: Colors.blueGrey),
                    ),
                  ),
                ),
              ],
            ),
          )
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
