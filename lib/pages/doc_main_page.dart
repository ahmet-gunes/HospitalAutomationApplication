import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/config/color_constants.dart';
import 'package:doktorhasta/pages/patient_home_views/chats.dart';
import 'package:flutter/material.dart';

import 'doc_home_views/view_doc_profile.dart';

class DoctorMainPage extends StatefulWidget {
  const DoctorMainPage({Key? key, required this.doc}) : super(key: key);
  final DoctorDataModel? doc;

  @override
  // ignore: no_logic_in_create_state
  State<DoctorMainPage> createState() => _DoctorMainPageState(doc: doc!);
}

class _DoctorMainPageState extends State<DoctorMainPage> {
  int _selectedIndex = 0;
  late DoctorDataModel doc;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _DoctorMainPageState({required this.doc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 0 ? DocProfile(doc: doc) : Chats(),
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

  ListTile ltOlustur(String soru, String? cevap) {
    return ListTile(
      title: Text(
        soru,
        style: const TextStyle(color: ColorConstants.mavi2),
      ),
      subtitle:
          Text(cevap!, style: const TextStyle(color: ColorConstants.mavi3)),
      leading: const Icon(Icons.donut_large),
    );
  }
}
