import 'dart:convert';
import 'package:doktorhasta/Model/doctor_model.dart';
import 'package:doktorhasta/config/loading_popup.dart';
import 'package:doktorhasta/pages/doc_main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:grock/grock.dart';

class ViewDocs extends ConsumerStatefulWidget {
  const ViewDocs({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ViewDocsState();
}

List<DoctorDataModel> docList = [];
Future<List<DoctorDataModel>> _getDoctorList() async {
  const String baseurl = "http://192.168.1.102:8080";
  try {
    var response = await Dio().get("$baseurl/doctors");
    List<DoctorDataModel>? doctorList = [];
    if (response.statusCode == 200) {
      doctorList = (response.data as List)
          .map((e) => DoctorDataModel.fromJson(e))
          .cast<DoctorDataModel>()
          .toList();
    }
    docList = doctorList;
    return doctorList;
  } on DioError catch (e) {
    return Future.error(e.message);
  }
}

class _ViewDocsState extends ConsumerState<ViewDocs> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('DOKTORLAR'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: customSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Center(
        child: FutureBuilder<List<DoctorDataModel>>(
          future: _getDoctorList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doctorList = snapshot.data!;
              return ListView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  itemBuilder: (context, index) {
                    var doctor = doctorList[index];
                    return InkWell(
                      onTap: () {
                        Grock.to(DoctorMainPage(doc: doctor));
                      },
                      child: Card(
                        child: Row(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              color: Colors.red,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doctor.doctorName),
                                Text(doctor.doctorDiscipline),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: doctorList.length);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class customSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  IconButton buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var a in docList) {
      if (a.doctorName.contains(query) || a.doctorDiscipline.contains(query)) {
        matchQuery.add(a.doctorName);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var a in docList) {
      if (a.doctorName.toLowerCase().contains(query) ||
          a.doctorDiscipline.toLowerCase().contains(query)) {
        matchQuery.add(a.doctorName);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
