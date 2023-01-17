import 'dart:convert';
import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/pages/home_page.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/Model/patient_model.dart';

class ViewDocDetail extends ConsumerStatefulWidget {
  const ViewDocDetail({Key? key, required this.doc, required this.pat})
      : super(key: key);
  final DoctorDataModel doc;
  final PatientDataModel pat;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      // ignore: no_logic_in_create_state
      _ViewDocDetailState(doc: doc, pat: pat);
}

class _ViewDocDetailState extends ConsumerState<ViewDocDetail> {
  _ViewDocDetailState({required this.doc, required this.pat});
  final DoctorDataModel doc;
  final PatientDataModel pat;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(80),
                    child: (doc.doctorPhoto != null)
                        ? Image.memory(
                            base64Decode(doc.doctorPhoto),
                            fit: BoxFit.fill,
                          )
                        : (doc.doctorGender.toLowerCase() == "erkek")
                            ? Image.asset("assets/images/male.png")
                            : Image.asset("assets/images/female.png"),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                doc.doctorName
                    .replaceRange(0, 1, doc.doctorName[0].toUpperCase()),
                style: const TextStyle(
                    color: Color.fromARGB(255, 78, 87, 100),
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(52, 255, 255, 255),
                ),
                child: Column(children: [
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "İsim : ${doc.doctorName.replaceRange(0, 1, doc.doctorName[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Cinsiyet : ${doc.doctorGender.replaceRange(0, 1, doc.doctorGender[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Mezuniyet : ${doc.doctorGraduate.replaceRange(0, 1, doc.doctorGraduate[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Çalıştığı Yer : ${doc.doctorWorkplace.replaceRange(0, 1, doc.doctorWorkplace[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Bölüm : ${doc.doctorDiscipline.replaceRange(0, 1, doc.doctorDiscipline[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                        child: SizedBox(
                      width: 15,
                    ))
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: const EdgeInsets.only(
                            top: 10, left: 15, bottom: 10, right: 4),
                        alignment: Alignment.centerLeft,
                        child: const SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Uzmanlık : aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                  ]),
                ]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(chatUpdateRiverpod).fetch(doctor: doc),
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.message),
      ),
    );
  }
}
