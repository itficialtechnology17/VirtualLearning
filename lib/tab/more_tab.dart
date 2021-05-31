import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:virtual_learning/controller/ThemeController.dart';
import 'package:virtual_learning/controller/dashboard_controller.dart';
import 'package:virtual_learning/modules/login/login_page.dart';
import 'package:virtual_learning/modules/menu/parent_connect.dart';
import 'package:virtual_learning/modules/profile/contact_page.dart';
import 'package:virtual_learning/modules/profile/profile_update.dart';
import 'package:virtual_learning/modules/profile/webpage.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/methods.dart';
import 'package:virtual_learning/utils/my_preference.dart';
import 'package:virtual_learning/utils/textstyle.dart';

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
  DashboardController _dashboardController = Get.find();

  ThemeController _themeController = Get.find();

  @override
  void initState() {
    super.initState();
    // getThemeMode();
  }

  final appData = GetStorage();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: _themeController.isDarkTheme.value
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: _themeController.isDarkTheme.value
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: _themeController.background.value,
        statusBarColor: _themeController.background.value));

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
                              child: Center(
                                child: Text(
                                  "Profile Setting".toUpperCase(),
                                  style: textStyle10Bold.copyWith(
                                      color: _themeController.textColor.value),
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
                                    leading: Icon(
                                      Icons.perm_identity,
                                      color: _themeController.textColor.value,
                                    ),
                                    title: Text(
                                      "Profile",
                                      style: textStyle10.copyWith(
                                          color:
                                              _themeController.textColor.value),
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
                                    leading: Icon(
                                      Icons.people_alt_outlined,
                                      color: _themeController.textColor.value,
                                    ),
                                    // leading: RadiantGradientMask(
                                    //   child: Icon(
                                    //     Icons.people_alt_outlined,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                    title: Padding(
                                      child: Text(
                                        "Parent Connect",
                                        style: textStyle10.copyWith(
                                            color: _themeController
                                                .textColor.value),
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
                                style: textStyle10Bold.copyWith(
                                    color: Colors.grey),
                              ),
                              SizedBox(height: margin16),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  child: ListTile(
                                    onTap: () {},
                                    leading: Icon(
                                      Icons.notifications_none_rounded,
                                      color: _themeController.textColor.value,
                                    ),
                                    title: Padding(
                                      child: Text(
                                        "Notification",
                                        style: textStyle10.copyWith(
                                            color: _themeController
                                                .textColor.value),
                                      ),
                                      padding: EdgeInsets.only(bottom: 0),
                                    ),
                                    trailing: Switch(
                                      value: isNotificationOn,
                                      onChanged: (value) {
                                        setState(() {
                                          isNotificationOn = value;
                                          if (isNotificationOn) {
                                          } else {}
                                        });
                                      },
                                      activeTrackColor: Colors.green,
                                      activeColor: Colors.white,
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
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
                                    leading: Icon(
                                      Icons.brightness_4_outlined,
                                      color: _themeController.textColor.value,
                                    ),
                                    title: Padding(
                                      child: Text(
                                        "Night Mode",
                                        style: textStyle10.copyWith(
                                            color: _themeController
                                                .textColor.value),
                                      ),
                                      padding: EdgeInsets.only(bottom: 0),
                                    ),
                                    trailing: Switch(
                                      value: _themeController.isDarkTheme.value,
                                      onChanged: (value) {
                                        setState(() {
                                          _themeController.isDarkTheme.value =
                                              value;
                                          appData.write(
                                              KEY_IS_DARK_THEME, value);
                                          _themeController.setTheme();
                                        });
                                      },
                                      activeTrackColor: Colors.green,
                                      activeColor: Colors.white,
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
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
                                    leading: Icon(
                                      Icons.email_outlined,
                                      color: _themeController.textColor.value,
                                    ),
                                    title: Padding(
                                      child: Text(
                                        "Contact Us",
                                        style: textStyle10.copyWith(
                                            color: _themeController
                                                .textColor.value),
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
                                      AppReview.storeListing
                                          .then((String onValue) {
                                        setState(() {
                                          output = onValue;
                                        });
                                        print(onValue);
                                      });
                                    },
                                    leading: Icon(
                                      Icons.star_border,
                                      color: _themeController.textColor.value,
                                    ),
                                    title: Padding(
                                      child: Text(
                                        "Rate the app",
                                        style: textStyle10.copyWith(
                                            color: _themeController
                                                .textColor.value),
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
                                                      "Privacy & Terms",
                                                      privacyPolicy)));
                                    },
                                    leading: Icon(
                                      Icons.privacy_tip_outlined,
                                      color: _themeController.textColor.value,
                                    ),
                                    title: Padding(
                                      child: Text(
                                        "Privacy & Term",
                                        style: textStyle10.copyWith(
                                            color: _themeController
                                                .textColor.value),
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
                                                      "About Us", aboutUs)));
                                    },
                                    leading: Icon(
                                      Icons.info_outline,
                                      color: _themeController.textColor.value,
                                    ),
                                    title: Padding(
                                      child: Text(
                                        "About Us",
                                        style: textStyle10.copyWith(
                                            color: _themeController
                                                .textColor.value),
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
                                            color: _themeController
                                                .textColor.value),
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
                          padding: EdgeInsets.only(
                              top: 8, left: 30, bottom: margin16),
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "App Version 1.0.0",
                              style:
                                  textStyle9.copyWith(color: Colors.blueGrey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
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
