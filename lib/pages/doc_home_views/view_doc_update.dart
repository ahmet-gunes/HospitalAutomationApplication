import 'package:doktorhasta/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';
import '../../Model/doctor_model.dart';

class DocUpdatePage extends ConsumerStatefulWidget {
  const DocUpdatePage({Key? key, required this.doc}) : super(key: key);
  final DoctorDataModel doc;

  @override
  ConsumerState<DocUpdatePage> createState() => _RegisterPageState(doc: doc);
}

class _RegisterPageState extends ConsumerState<DocUpdatePage> {
  _RegisterPageState({required this.doc});
  final DoctorDataModel doc;
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 100, right: 5),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/login.png',
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: ref.read(docUpdateRiverpod).name,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: 'İsim',
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 87, 100),
                                  ))),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller:
                                  ref.read(docUpdateRiverpod).discipline,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: 'Ana Bilim Dalı',
                                  prefixIcon:
                                      const Icon(Icons.bubble_chart_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 87, 100),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: ref.read(docUpdateRiverpod).mastery1,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.blur_circular_rounded),
                                  hintText: 'Uzmanlık',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 87, 100),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: ref.read(docUpdateRiverpod).graduate,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  hintText: 'Fakülte',
                                  prefixIcon: const Icon(Icons.chevron_right),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 87, 100),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: ref.read(docUpdateRiverpod).workplace,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.chevron_right),
                                  hintText: 'Çalıştığınız Yer',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Color.fromARGB(255, 78, 87, 100),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: ref.read(docUpdateRiverpod).pass,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Şifre Giriniz';
                          }
                          return null;
                        },
                        maxLines: 1,
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            hintText: 'Şifre',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 87, 100),
                            ))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () => ref.read(docUpdateRiverpod).fetch(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          backgroundColor:
                              const Color.fromARGB(255, 78, 87, 100),
                        ),
                        child: const Text(
                          'Bilgileri Güncelle',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
