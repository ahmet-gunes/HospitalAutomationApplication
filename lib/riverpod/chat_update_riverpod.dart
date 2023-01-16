import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/Model/message_model.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:flutter/material.dart';

class ChatUpdateRiverpod extends ChangeNotifier {
  late DoctorDataModel doctor;
  late PatientDataModel pat;
  late MessageModel message;
}
