import 'package:doktorhasta/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/config/color_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientMainPage extends ConsumerStatefulWidget {
  const PatientMainPage({Key? key, required this.pat}) : super(key: key);
  final PatientDataModel pat;

  @override
  ConsumerState<PatientMainPage> createState() =>
      _PatientMainPageState(pat: pat);
}

class _PatientMainPageState extends ConsumerState<PatientMainPage> {
  _PatientMainPageState({required this.pat});
  final PatientDataModel pat;
  @override
  void initState() {
    super.initState();
    ref.read(chatUpdateRiverpod).pat = pat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mavi2,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'HASTA',
            style: TextStyle(color: ColorConstants.mavi4),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(50),
            width: 150,
            height: 150,
            color: Colors.black,
            child: const Center(
              child: Text(
                'FOTO',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          ltOlustur('Hastanın Adı', pat.patientName),
          ltOlustur('Cinsiyet', pat.patientGender),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.mavi2,
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }

  ListTile ltOlustur(String soru, String cevap) {
    return ListTile(
      title: Text(
        soru,
        style: const TextStyle(color: ColorConstants.mavi2),
      ),
      subtitle:
          Text(cevap, style: const TextStyle(color: ColorConstants.mavi3)),
      leading: const Icon(Icons.donut_large),
    );
  }
}
