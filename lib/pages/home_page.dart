// ignore_for_file: unnecessary_new

import 'package:doktorhasta/pages/patient_login.dart';
import 'package:doktorhasta/pages/doctor_login.dart';
import 'package:flutter/material.dart';

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
          backgroundColor: const Color.fromARGB(255, 78, 87, 100),
          title: const Center(child: Text('Hoşgeldiniz')),
          bottom: const PreferredSize(
            preferredSize: Size(50.0, 50.0),
            child: TabBar(
              tabs: [
                SizedBox(
                  height: 40.0,
                  child: Tab(text: 'Doktor Girişi'),
                ),
                SizedBox(
                  height: 40.0,
                  child: Tab(text: 'Hasta Girişi'),
                ),
              ],
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
