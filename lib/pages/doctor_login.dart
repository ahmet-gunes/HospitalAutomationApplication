import 'package:doktorhasta/riverpod/doc_login_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/pages/doctor_register.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorLogin extends ConsumerStatefulWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  ConsumerState<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends ConsumerState<DoctorLogin> {
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
                padding: EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/images/login.png',
                ),
                alignment: Alignment.center,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      child: TextFormField(
                        controller: ref.read(docLoginRiverpod).email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'E-mail Giriniz';
                          }
                          return null;
                        },
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: 'E-mail',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromARGB(255, 78, 87, 100),
                            ))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      controller: ref.read(docLoginRiverpod).pass,
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => ref.read(docLoginRiverpod).fetch(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                      backgroundColor: const Color.fromARGB(255, 78, 87, 100),
                    ),
                    child: const Text(
                      'Giriş Yap',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterPage(title: 'Register UI'),
                            ),
                          );
                        },
                        child: const Text(
                          'Doktor Hesabı Oluştur',
                          style: TextStyle(
                            color: Color.fromARGB(255, 78, 87, 100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
