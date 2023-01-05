import 'package:doktorhasta/config/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DoctorMainPage extends StatefulWidget {
  const DoctorMainPage({super.key});

  @override
  State<DoctorMainPage> createState() => _DoctorMainPageState();
}

class _DoctorMainPageState extends State<DoctorMainPage> {
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
          ltOlustur('Doktorun Adı', ''),
          ltOlustur('Ana Bölümü', 'asdasda'),
          ltOlustur('Yan Bölümleri', ''),
          ltOlustur('Mezun Olduğu Yer', ''),
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


/*
Center(
        child: Column(
          children: [
            Container(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.all(50),
              width: 250,
              height: 250,
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
            ltOlustur('Doktorun Adı', ''),
            ltOlustur('Ana Bölümü', 'asdasda'),
            ltOlustur('Yan Bölümleri', ''),
            ltOlustur('Mezun Olduğu Yer', ''),
          ],
        ),
      ),
*/