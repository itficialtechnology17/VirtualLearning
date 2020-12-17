import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            ],
          )
        ],
      ),
    );
  }
}
/*
Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage("assets/images/ic_ask_doubt.png"))),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Center(
          child:,
        ),
      ));
}*/

Widget _createDrawerItem(
    {IconData icon,
    String text,
    GestureTapCallback onTap,
    BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
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
