import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';

class PatUpdatePage extends ConsumerStatefulWidget {
  const PatUpdatePage({Key? key, required this.pat}) : super(key: key);
  final PatientDataModel pat;

  @override
  ConsumerState<PatUpdatePage> createState() => _RegisterPageState(pat: pat);
}

class _RegisterPageState extends ConsumerState<PatUpdatePage> {
  _RegisterPageState({required this.pat});
  final PatientDataModel pat;
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
                              controller: ref.read(patUpdateRiverpod).name,
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
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: ref.read(patUpdateRiverpod).pass,
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
                        onPressed: () => ref.read(patUpdateRiverpod).fetch(),
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
