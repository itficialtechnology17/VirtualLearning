import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_learning/controller/subject_controller.dart';
import 'package:virtual_learning/controller/subscription_controller.dart';
import 'package:virtual_learning/model/model_subject.dart';
import 'package:virtual_learning/model/model_subscription.dart';

class SelectSubject extends StatefulWidget {
  final ModelSubscription modelSubscription;

  SelectSubject(this.modelSubscription);

  @override
  State<StatefulWidget> createState() {
    return _StateSelectSubject();
  }
}

class _StateSelectSubject extends State<SelectSubject> {
  SubjectController _subjectController = Get.find();
  SubscriptionController _subscriptionController = Get.find();
  List<ModelSubject> arrOfSubject = List<ModelSubject>();

  @override
  void initState() {
    super.initState();
    arrOfSubject = _subjectController.arrOfSubject;
  }

  var isLoading = false;
  String countPrice = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Obx(() => Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      )),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Text(
                          widget.modelSubscription.title.toUpperCase(),
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      _subscriptionController.isLoadingPrice.value
                          ? Container(
                              constraints: BoxConstraints(minHeight: 200),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : Obx(() => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  _subscriptionController.arrOfPrice.isNotEmpty
                                      ? Column(
                                          children: [
                                            Text(
                                              "* Per Subject Price: " +
                                                  _subscriptionController
                                                      .arrOfPrice[0]
                                                      .subjectPrice
                                                      .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2
                                                  .copyWith(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                            ),
                                            Text(
                                              "* Full Course Price: " +
                                                  _subscriptionController
                                                      .arrOfPrice[0].coursePrice
                                                      .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2
                                                  .copyWith(
                                                      fontSize: 14,
                                                      color: Colors.grey),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        )
                                      : Container(
                                          height: 8,
                                        ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: arrOfSubject.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Material(
                                        color: Colors.white,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              setSelection(index);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                arrOfSubject[index].isSelected
                                                    ? Icon(
                                                        Icons.check_box,
                                                        size: 25,
                                                        color: Colors.green,
                                                      )
                                                    : Icon(
                                                        Icons.crop_square,
                                                        size: 25,
                                                        color: Colors.green,
                                                      ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            arrOfSubject[index]
                                                                .name,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle1,
                                                      ),
                                                    ],
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        // _paymentController.checkCredentials();
                                        /*var result =
                                            await _subscriptionController
                                                .doSubscribe(
                                                    "", getSubjectId());*/

                                        Map<String, String> map =
                                            Map<String, String>();
                                        map['subject_ids'] = getSubjectId();
                                        map['amount'] = countPrice.toString();
                                        map['subscription_id'] = widget
                                            .modelSubscription.id
                                            .toString();
                                        Navigator.pop(context, map);
                                      },
                                      child: Container(
                                        width: Get.width,
                                        height: Get.height * 0.06,
                                        color: Colors.green,
                                        child: Center(
                                          child: !isLoading
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Done".toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .button
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      countPrice.isEmpty
                                                          ? ""
                                                          : "(Rs. " +
                                                              countPrice +
                                                              ")".toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .button
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    )
                                                  ],
                                                )
                                              : SizedBox(
                                                  height: Get.height * 0.03,
                                                  width: Get.height * 0.03,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                  ),
                                                ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 16,
                                  )
                                ],
                              )),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  void setSelection(int index) {
    for (int i = 0; i < arrOfSubject.length; i++) {
      if (i == index) {
        if (arrOfSubject[index].isSelected) {
          arrOfSubject[index].isSelected = false;
        } else {
          arrOfSubject[index].isSelected = true;
        }
      }
    }
    calculatePrice();
  }

  getSubjectId() {
    String listOfSubjectId = "";
    for (int i = 0; i < arrOfSubject.length; i++) {
      if (arrOfSubject[i].isSelected) {
        listOfSubjectId = listOfSubjectId + arrOfSubject[i].id.toString();
        if (i < arrOfSubject.length - 1) {
          listOfSubjectId = listOfSubjectId + ",";
        }
      }
    }
    return listOfSubjectId;
  }

  calculatePrice() {
    int price = 0;
    for (int i = 0; i < arrOfSubject.length; i++) {
      if (arrOfSubject[i].isSelected) {
        price = price +
            int.parse(_subscriptionController.arrOfPrice[0].subjectPrice);
      }
    }
    if (price > int.parse(_subscriptionController.arrOfPrice[0].coursePrice)) {
      setState(() {
        countPrice = _subscriptionController.arrOfPrice[0].coursePrice;
      });
    } else {
      setState(() {
        countPrice = price.toString();
      });
    }
  }
}
