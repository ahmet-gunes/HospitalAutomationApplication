import 'package:doktorhasta/pages/patient_login.dart';
import 'package:doktorhasta/pages/doctor_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doktorhasta/config/color_constants.dart';
import 'patient_login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 87, 100),
          title: const Center(child: Text('Hoşgeldiniz')),
          bottom: new PreferredSize(
            preferredSize: const Size(50.0, 50.0),
            child: new Container(
              child: new TabBar(
                tabs: [
                  new Container(
                    height: 40.0,
                    child: new Tab(text: 'Doktor Girişi'),
                  ),
                  new Container(
                    height: 40.0,
                    child: new Tab(text: 'Hasta Girişi'),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            DoctorLogin(),
            PatientLogin(),
          ],
        ),
      ),
    );
  }
}
