import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  ModelUser({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.schoolName,
    this.mobileNumber,
    this.email,
    this.motherName,
    this.fatherName,
    this.address,
    this.fatherMobileNumber,
    this.status,
    this.subscribed,
    this.instituteId,
    this.createdOn,
    this.otp,
  });

  int id;
  dynamic firstName;
  dynamic lastName;
  dynamic gender;
  dynamic dob;
  dynamic schoolName;
  String mobileNumber;
  dynamic email;
  dynamic motherName;
  dynamic fatherName;
  dynamic address;
  dynamic fatherMobileNumber;
  int status;
  dynamic subscribed;
  dynamic instituteId;
  DateTime createdOn;
  int otp;

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        dob: json["dob"],
        schoolName: json["school_name"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
        motherName: json["mother_name"],
        fatherName: json["father_name"],
        address: json["address"],
        fatherMobileNumber: json["father_mobile_number"],
        status: json["status"],
        subscribed: json["subscribed"],
        instituteId: json["institute_id"],
        createdOn: DateTime.parse(json["created_on"]),
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "dob": dob,
        "school_name": schoolName,
        "mobile_number": mobileNumber,
        "email": email,
        "mother_name": motherName,
        "father_name": fatherName,
        "address": address,
        "father_mobile_number": fatherMobileNumber,
        "status": status,
        "subscribed": subscribed,
        "institute_id": instituteId,
        "created_on": createdOn.toIso8601String(),
        "otp": otp,
      };
}
