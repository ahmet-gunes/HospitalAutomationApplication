import 'dart:convert';
import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ViewDocs extends ConsumerStatefulWidget {
  const ViewDocs({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ViewDocsState();
}

Future<List<DoctorDataModel>> _getDoctorList() async {
  const String baseurl = "http://192.168.1.101:8080";
  try {
    var response = await Dio().get("$baseurl/doctors");
    List<DoctorDataModel>? doctorList = [];
    if (response.statusCode == 200) {
      doctorList = (response.data as List)
          .map((e) => DoctorDataModel.fromJson(e))
          .cast<DoctorDataModel>()
          .toList();
    }
    return doctorList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}

class _ViewDocsState extends ConsumerState<ViewDocs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<DoctorDataModel>>(
          future: _getDoctorList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doctorList = snapshot.data!;
              return ListView.builder(
                  itemBuilder: (context, index) {
                    var doctor = doctorList[index];
                    return ListTile(
                      title: Text(doctor.doctorName),
                      subtitle: Text(doctor.doctorDiscipline),
                    );
                  },
                  itemCount: doctorList.length);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
