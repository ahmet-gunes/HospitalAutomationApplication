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
  late final DoctorDataModel doc;
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
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                doc.doctorName.replaceFirst(
                    doc.doctorName[0], doc.doctorName[0].toUpperCase()),
                style: const TextStyle(
                    color: Color.fromARGB(255, 78, 87, 100),
                    fontSize: 19,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(200, 211, 214, 216),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 118, 127, 138),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "İsim :",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white60),
                                  ),
                                ),
                                Text(
                                  doc.doctorName.replaceFirst(doc.doctorName[0],
                                      doc.doctorName[0].toUpperCase()),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ])),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 118, 127, 138),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "Cinsiyet :",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white60),
                                  ),
                                ),
                                Text(
                                  doc.doctorGender.replaceFirst(
                                      doc.doctorGender[0],
                                      doc.doctorGender[0].toUpperCase()),
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 118, 127, 138),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    "E-Posta :",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white60),
                                  ),
                                ),
                                Text(
                                  doc.doctorMail,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ])),
                    ])),
              ),
              const SizedBox(
                height: 10,
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
