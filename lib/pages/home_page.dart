// ignore_for_file: unnecessary_new

import 'package:doktorhasta/pages/patient_login.dart';
import 'package:doktorhasta/pages/doctor_login.dart';
import 'package:doktorhasta/riverpod/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with WidgetsBindingObserver {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      ref.read(onlineFlagRiverpod).fetch(status: 1);
    } else if (state == AppLifecycleState.paused) {
      ref.read(onlineFlagRiverpod).fetch(status: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 78, 87, 100),
          title: const Center(child: Text('Hoşgeldiniz')),
          bottom: const PreferredSize(
            preferredSize: Size(50.0, 50.0),
            child: TabBar(
              tabs: [
                SizedBox(
                  height: 40.0,
                  child: Tab(text: 'Doktor Girişi'),
                ),
                SizedBox(
                  height: 40.0,
                  child: Tab(text: 'Hasta Girişi'),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            DoctorLogin(),
            PatientLogin(),
          ],
        ),
      ),
    );
  }
}
