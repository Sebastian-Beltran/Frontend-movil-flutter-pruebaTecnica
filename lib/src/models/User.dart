// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.id,
        this.firstName,
        this.lastName,
        this.typeDocument,
        this.document,
        this.email,
        this.phone,
        this.admissionDate,
        this.salary,
    });

    int id;
    String firstName;
    String lastName;
    String typeDocument;
    int document;
    String email;
    int phone;
    String admissionDate;
    int salary;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        typeDocument: json["type_document"],
        document: json["document"],
        email: json["email"],
        phone: json["phone"],
        admissionDate: json["admission_date"],
        salary: json["salary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "type_document": typeDocument,
        "document": document,
        "email": email,
        "phone": phone,
        "admission_date": admissionDate,
        "salary": salary,
    };
}
