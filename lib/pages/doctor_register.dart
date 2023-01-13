import 'package:doktorhasta/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
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
                              controller: ref.read(docRegisterRiverpod).name,
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
                                  ref.read(docRegisterRiverpod).discipline,
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
                              controller: ref.read(docRegisterRiverpod).gender,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.chevron_right),
                                  hintText: 'Cinsiyet',
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
                                  ref.read(docRegisterRiverpod).mastery1,
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
                              controller:
                                  ref.read(docRegisterRiverpod).graduate,
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
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller:
                                  ref.read(docRegisterRiverpod).mastery2,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.blur_circular_rounded),
                                  hintText: 'Uzmanlık (İsteğe Bağlı)',
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
                              controller:
                                  ref.read(docRegisterRiverpod).workplace,
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
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller:
                                  ref.read(docRegisterRiverpod).mastery3,
                              maxLines: 1,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.blur_circular_rounded),
                                  hintText: 'Uzmanlık (İsteğe Bağlı)',
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
                        controller: ref.read(docRegisterRiverpod).email,
                        maxLines: 1,
                        decoration: InputDecoration(
                            hintText: 'E-Posta',
                            prefixIcon: const Icon(Icons.email),
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
                      TextFormField(
                        controller: ref.read(docRegisterRiverpod).pass,
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
                        onPressed: () => ref.read(docRegisterRiverpod).fetch(),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          backgroundColor:
                              const Color.fromARGB(255, 78, 87, 100),
                        ),
                        child: const Text(
                          'Kayıt Ol',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Hesabınız var mı?'),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              child: const Text('Giriş Yap')),
                        ],
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
