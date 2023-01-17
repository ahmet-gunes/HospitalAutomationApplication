// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:doktorhasta/pages/patient_home_views/chats.dart';
import 'package:doktorhasta/pages/patient_home_views/view_docs.dart';
import 'package:doktorhasta/pages/patient_home_views/view_pat_profile.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/config/color_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Patient_Home extends ConsumerStatefulWidget {
  const Patient_Home({Key? key, required this.pat}) : super(key: key);
  final PatientDataModel pat;

  @override
  // ignore: no_logic_in_create_state
  ConsumerState<Patient_Home> createState() => _Patient_HomeState(pat: pat);
}

class _Patient_HomeState extends ConsumerState<Patient_Home> {
  _Patient_HomeState({required this.pat});

  late PatientDataModel pat;

  int _selectedIndex = 0;
  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 0
            ? PatProfile(pat: pat)
            : _selectedIndex == 1
                ? ViewDocs(pat: pat)
                : Chats(),
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
            icon: Icon(Icons.medical_information),
            label: 'Doktorlar',
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

ListTile ltOlustur(String soru, String cevap) {
  return ListTile(
    title: Text(
      soru,
      style: const TextStyle(color: ColorConstants.mavi2),
    ),
    subtitle: Text(cevap, style: const TextStyle(color: ColorConstants.mavi3)),
    leading: const Icon(Icons.donut_large),
  );
}
