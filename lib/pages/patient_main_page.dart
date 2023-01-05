import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:doktorhasta/config/color_constants.dart';

class PatientMainPage extends StatefulWidget {
  const PatientMainPage({super.key});

  @override
  State<PatientMainPage> createState() => _PatientMainPageState();
}

class _PatientMainPageState extends State<PatientMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mavi2,
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          'HASTA ADI',
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
          ltOlustur('Hastanın Adı', ''),
          ltOlustur('Cinsiyet', ''),
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
