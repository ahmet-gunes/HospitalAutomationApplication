import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/pages/home_page.dart';
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
                  child: CircleAvatar(
                      backgroundColor: Colors.white60,
                      radius: 70,
                      child: Image.asset(
                        'assets/images/default_avatar.png',
                      ))),
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(52, 255, 255, 255),
                ),
                child: Column(children: [
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "İsim : ${doc.doctorName.replaceRange(0, 1, doc.doctorName[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Cinsiyet : ${doc.doctorGender.replaceRange(0, 1, doc.doctorGender[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Mezuniyet : ${doc.doctorGraduate.replaceRange(0, 1, doc.doctorGraduate[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Çalıştığı Yer : ${doc.doctorWorkplace.replaceRange(0, 1, doc.doctorWorkplace[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: EdgeInsets.only(top: 10, left: 15, bottom: 10),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: (Text(
                            "Bölüm : ${doc.doctorDiscipline.replaceRange(0, 1, doc.doctorDiscipline[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 18),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: SizedBox(
                      width: 15,
                    ))
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: EdgeInsets.only(
                            top: 10, left: 15, bottom: 10, right: 4),
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
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
        onPressed: () {},
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.message),
      ),
    );
  }
}
