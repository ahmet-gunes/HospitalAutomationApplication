import 'dart:developer';

import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/service/online_flag_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DocOnlineFlag extends ChangeNotifier {
  final service = Online_Flag_Service();

  late DoctorDataModel doctor;

  void fetch({required int status}) => {
        service.online_status_call(json: {
          'status': status,
          'doctorMail': doctor.doctorMail,
          'doctorPassword': doctor.doctorPassword
        }).then((value) {
          if (value == true) {
            if (status > 0) {
              log("Doktor ${doctor.doctorName} Çevrimiçi Oldu.");
            } else {
              log('Doktor ${doctor.doctorName} Çevrimdışı oldu.');
            }
          } else {
            log("Online flag hatası");
          }
        })
      };
}
