import 'dart:convert';

import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/pages/doc_home_views/view_doc_update.dart';
import 'package:doktorhasta/pages/home_page.dart';
import 'package:doktorhasta/pages/photo_picker/screens/set_photo_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:grock/grock.dart';
import 'package:image_picker/image_picker.dart';

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(80),
                      child: (doc.doctorPhoto != null)
                          ? Image.memory(
                              base64Decode(doc.doctorPhoto),
                              fit: BoxFit.fill,
                            )
                          : (doc.doctorGender == "erkek")
                              ? Image.asset("assets/images/male.png")
                              : Image.asset("assets/images/female.png"),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    Grock.to(const SetPhotoScreen());
                  },
                  child: const Text(
                    'Fotoğrafı Düzenle',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    Grock.to(DocUpdatePage(doc: doc));
                  },
                  child: const Text(
                    'Profili Düzenle',
                  ),
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
                const SizedBox(
                  height: 20,
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
          ),
        ));
  }
}
