import 'dart:js_util';
import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/config/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoctorMainPage extends StatefulWidget {
  const DoctorMainPage({Key? key, required this.doc}) : super(key: key);
  final doctorDataModel doc;

  @override
  State<DoctorMainPage> createState() => _DoctorMainPageState(doc: doc);
}

class _DoctorMainPageState extends State<DoctorMainPage> {
  _DoctorMainPageState({required this.doc});
  final doctorDataModel doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mavi2,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'DOKTOR ADI',
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
            child: Center(
              child: Text(
                'FOTO',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 20,
          ),
          ltOlustur('Doktorun Adı', doc.doctorName),
          ltOlustur('Ana Bölümü', doc.doctorDiscipline),
          ltOlustur('Yan Bölümleri', doc.doctorMastery1),
          ltOlustur('Mezun Olduğu Yer', doc.doctorGraduate),
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
