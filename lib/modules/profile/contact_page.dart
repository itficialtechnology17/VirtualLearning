import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_learning/utils/constant.dart';
import 'package:virtual_learning/utils/textstyle.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        brightness: Brightness.dark,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                Color(0xff14C269),
                Color(0xff0A0A78),
              ])),
        ),
        title: Text(
          "Contact Us".toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
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
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(
                contactEmail,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Contact Number 1",
                style: textStyle16,
              ),
              Text(
                contactNumber1,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Contact Number 2",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(
                contactNumber2,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ],
          )),
    );
  }
}
