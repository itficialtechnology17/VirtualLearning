import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/login_page.dart';
import 'package:virtual_learning/modules/menu/analytics_page.dart';
import 'package:virtual_learning/modules/menu/bookmarks.dart';
import 'package:virtual_learning/modules/menu/notification_page.dart';
import 'package:virtual_learning/modules/menu/parent_connect.dart';
import 'package:virtual_learning/modules/profile/profile_setting.dart';
import 'package:virtual_learning/modules/profile/webpage.dart';
import 'package:virtual_learning/modules/subscription/subscription.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/my_preference.dart';
import 'package:virtual_learning/widgets/gradient_icon.dart';

class CustomDrawer extends StatelessWidget {
  var userProfile = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 120,
              elevation: 0,
              pinned: true,
              brightness: Brightness.dark,
              backgroundColor: Color(0xff4F5A65),
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                      Color(0xff14C269),
                      Color(0xff0A0A78),
                    ])),
                child: Center(
                  child: Image.asset(
                    "assets/icons/ic_logo_name.png",
                    fit: BoxFit.contain,
                    width: Get.width * 0.20,
                    height: Get.width * 0.20,
                  ) /*Image(
                    image: AssetImage(
                      "assets/images/ic_trans_logo.png",
                    ),
                    height: MediaQuery.of(context).size.width * 0.25,
                    width: MediaQuery.of(context).size.width * 0.25,
                    fit: BoxFit.contain,
                  )*/
                  ,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, position) {
                  return MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        _createDrawerItem(
                            icon: Icons.perm_identity,
                            text: 'Profile Setting',
                            context: context),
                        _createDrawerItem(
                            icon: Icons.graphic_eq,
                            text: 'Analytics',
                            context: context),
                        Platform.isAndroid
                            ? _createDrawerItem(
                                icon: Icons.local_police_outlined,
                                text: 'Subscribe Now',
                                context: context)
                            : Container(
                                height: 0,
                              ),
                        _createDrawerItem(
                            icon: Icons.bookmark_border,
                            text: 'Bookmarks',
                            context: context),
                        _createDrawerItem(
                            icon: Icons.notifications_none,
                            text: 'Notification',
                            context: context),
                        _createDrawerItem(
                            icon: Icons.people_alt_outlined,
                            text: 'Parent Connect',
                            context: context),
                        Divider(),
                        _createDrawerItem(
                            icon: Icons.privacy_tip_outlined,
                            text: 'Privacy Policy',
                            context: context),
                        _createDrawerItem(
                            icon: Icons.power_settings_new_rounded,
                            text: 'Logout',
                            context: context),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon,
      String text,
      GestureTapCallback onTap,
      BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        if (text == "Profile Setting") {
          Get.to(ProfileSetting());
        } else if (text == "Analytics") {
          Get.to(AnalyticsPage());
        } else if (text == "Bookmarks") {
          Get.to(Bookmarks());
        } else if (text == "Notification") {
          Get.to(NotificationPage());
        } else if (text == "Parent Connect") {
          Get.to(ParentConnect());
        } else if (text == "Subscribe Now") {
          Get.to(Subscription());
        } else if (text == "Privacy Policy") {
          Get.to(WebPage.titleUrl("Privacy & Term", privacyPolicy));
        } else if (text == "Logout") {
          showDialog(
              context: context, builder: (context) => _confirmLogout(context));
        }
      },
      child: ListTile(
        title: Row(
          children: <Widget>[
            RadiantGradientMask(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text.toUpperCase()),
            )
          ],
        ),
        onTap: onTap,
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
