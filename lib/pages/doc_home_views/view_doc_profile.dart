import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/Model/patient_model.dart';

class DocProfile extends ConsumerStatefulWidget {
  const DocProfile({Key? key, required this.doc}) : super(key: key);
  final DoctorDataModel doc;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      // ignore: no_logic_in_create_state
      _DocProfileState(doc: doc);
}

class _DocProfileState extends ConsumerState<DocProfile> {
  _DocProfileState({required this.doc});
  final DoctorDataModel doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(75, 102, 99, 99),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
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
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(198, 158, 175, 186),
                          ),
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: (Text(
                            "İsim : ${doc.doctorName.replaceRange(0, 1, doc.doctorName[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(198, 158, 175, 186),
                          ),
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: (Text(
                            "Cinsiyet : ${doc.doctorGender.replaceRange(0, 1, doc.doctorGender[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ))),
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Expanded(
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(198, 158, 175, 186),
                          ),
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: (Text(
                            "Mezuniyet : ${doc.doctorGraduate.replaceRange(0, 1, doc.doctorGraduate[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(198, 158, 175, 186),
                          ),
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: (Text(
                            "Çalıştığı Yer : ${doc.doctorWorkplace.replaceRange(0, 1, doc.doctorWorkplace[0].toUpperCase())}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ))),
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Container(
                        width: 172,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(198, 158, 175, 186),
                        ),
                        padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: (Text(
                          "Bölüm : ${doc.doctorDiscipline.replaceRange(0, 1, doc.doctorDiscipline[0].toUpperCase())}",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16),
                        ))),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    Center(
                      child: Container(
                          height: 40,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(198, 158, 175, 186),
                          ),
                          padding: EdgeInsets.only(left: 15),
                          alignment: Alignment.centerLeft,
                          child: (Text(
                            "Uzmanlık : aaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ))),
                    ),
                  ]),
                ]),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text(
                  'Profili Düzenle',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text(
                  'Çıkış Yap',
                ),
              ),
            ],
          ),
        ));
  }
}
