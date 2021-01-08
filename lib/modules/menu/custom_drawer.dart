import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/modules/login/login_page.dart';
import 'package:virtual_learning/modules/menu/bookmarks.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/my_preference.dart';

class CustomDrawer extends StatelessWidget {
  var userProfile = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ic_bg.png"),
                      fit: BoxFit.fill))),
          ListView(
            shrinkWrap: true,
            children: [
              // _createHeader(),
              SizedBox(
                height: 16,
              ),
              userProfile == ""
                  ? CircleAvatar(
                      radius: 50,
                      child: SvgPicture.network(
                        "https://www.flaticon.com/svg/static/icons/svg/599/599305.svg",
                      ),
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(userProfile),
                    ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Text("VirtualE",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500)),
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Text("Edit Profile".toUpperCase(),
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              Divider(),
              _createDrawerItem(
                  icon: Icons.face, text: 'Analytics', context: context),
              _createDrawerItem(
                  icon: Icons.face, text: 'Bookmarks', context: context),
              _createDrawerItem(
                  icon: Icons.face, text: 'Notification', context: context),
              _createDrawerItem(
                  icon: Icons.face, text: 'Parent Connect', context: context),
              Divider(),
              _createDrawerItem(
                  icon: Icons.face, text: 'Contact Us', context: context),
              _createDrawerItem(
                  icon: Icons.face, text: 'Subscribe Now', context: context),
              _createDrawerItem(
                  icon: Icons.face,
                  text: 'Terms & Conditions',
                  context: context),
              _createDrawerItem(
                  icon: Icons.power_settings_new_rounded,
                  text: 'Logout',
                  context: context),
            ],
          )
        ],
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
        if (text == "Bookmarks") {
          Get.to(Bookmarks());
        } else if (text == "Logout") {
          showDialog(
              context: context, builder: (context) => _confirmLogout(context));
        }
      },
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
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
