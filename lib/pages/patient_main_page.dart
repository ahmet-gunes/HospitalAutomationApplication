import 'package:flutter/material.dart';
import 'package:doktorhasta/Model/patient_model.dart';
import 'package:doktorhasta/config/color_constants.dart';

class PatientMainPage extends StatefulWidget {
  const PatientMainPage({Key? key, required this.pat}) : super(key: key);
  final patientDataModel pat;

  @override
  // ignore: no_logic_in_create_state
  State<PatientMainPage> createState() => _PatientMainPageState(pat: pat);
}

class _PatientMainPageState extends State<PatientMainPage> {
  _PatientMainPageState({required this.pat});
  final patientDataModel pat;
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
        )),
      ),
      body: Column(
        children: [
          Container(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.all(50),
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
          ltOlustur('Hastanın Adı', pat.PatientName),
          ltOlustur('Cinsiyet', pat.PatientGender),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.mavi2,
        onPressed: () {},
        child: Icon(Icons.message),
      ),
    );
  }

  ListTile ltOlustur(String soru, String cevap) {
    return ListTile(
      title: Text(
        soru,
        style: TextStyle(color: ColorConstants.mavi2),
      ),
      subtitle: Text(cevap, style: TextStyle(color: ColorConstants.mavi3)),
      leading: Icon(Icons.donut_large),
    );
  }
}
