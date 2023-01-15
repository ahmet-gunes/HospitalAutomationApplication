// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/pages/doc_main_page.dart';
import 'package:doktorhasta/pages/patient_home_views/chats.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/config/color_constants.dart';

class ViewDocDetail extends StatefulWidget {
  const ViewDocDetail({Key? key, required this.doc}) : super(key: key);
  final DoctorDataModel doc;

  @override
  // ignore: no_logic_in_create_state
  State<ViewDocDetail> createState() => _ViewDocDetailState(doc: doc);
}

class _ViewDocDetailState extends State<ViewDocDetail> {
  _ViewDocDetailState({required this.doc});

  late DoctorDataModel doc;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 0 ? DoctorMainPage(doc: doc) : Chats(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: const Color.fromARGB(255, 78, 87, 100),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: ('Chat'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white60,
        onTap: _onItemTapped,
      ),
    );
  }
}
