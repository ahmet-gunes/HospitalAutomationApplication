import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doktorhasta/config/color_constants.dart';
import 'doc_login.dart';
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
          backgroundColor: ColorConstants.mavi2,
          title: Center(child: Text('Hoşgeldiniz')),
          bottom: TabBar(
            tabs: [
              Text('DOKTOR GİRİŞİ'),
              Text('HASTA GİRİŞİ'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DoctorLogin(),
            PatientLogin(),
          ],
        ),
      ),
    );
  }
}
