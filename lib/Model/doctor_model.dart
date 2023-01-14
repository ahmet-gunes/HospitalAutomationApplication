import 'dart:convert';

import 'package:flutter/cupertino.dart';

class DoctorDataModel {
  final int doctorID;
  final String doctorName;
  final String doctorMail;
  final int doctorPassword;
  var doctorPhoto;
  final String doctorGender;
  final String doctorDiscipline;
  final String doctorMastery1;
  final String? doctorMastery2;
  final String? doctorMastery3;
  final String doctorGraduate;
  final String doctorWorkplace;
  final int doctorOnline;
  DoctorDataModel(
      this.doctorID,
      this.doctorName,
      this.doctorMail,
      this.doctorPassword,
      this.doctorPhoto,
      this.doctorGender,
      this.doctorDiscipline,
      this.doctorMastery1,
      this.doctorMastery2,
      this.doctorMastery3,
      this.doctorGraduate,
      this.doctorWorkplace,
      this.doctorOnline);

  DoctorDataModel.fromJson(Map<String, dynamic> json)
      : doctorID = json['doctorID'],
        doctorName = json['doctorName'],
        doctorMail = json['doctorMail'],
        doctorPassword = json['doctorPassword'],
        doctorPhoto = json['doctorPhoto'],
        doctorGender = json['doctorGender'],
        doctorDiscipline = json['doctorDiscipline'],
        doctorMastery1 = json['doctorMastery1'],
        doctorMastery2 = json['doctorMastery2'],
        doctorMastery3 = json['doctorMastery3'],
        doctorGraduate = json['doctorGraduate'],
        doctorWorkplace = json['doctorWorkplace'],
        doctorOnline = json['doctorOnline'];

  Map<String, dynamic> toJson() => {
        'doctorID': doctorID,
        'doctorName': doctorName,
        'doctorMail': doctorMail,
        'doctorPassword': doctorPassword,
        'doctorPhoto': doctorPhoto,
        'doctorGender': doctorGender,
        'doctorDiscipline': doctorDiscipline,
        'doctorMastery1': doctorMastery1,
        'doctorMastery2': doctorMastery2,
        'doctorMastery3': doctorMastery3,
        'doctorGraduate': doctorGraduate,
        'doctorWorkplace': doctorWorkplace,
        'doctorOnline': doctorOnline,
      };
}
