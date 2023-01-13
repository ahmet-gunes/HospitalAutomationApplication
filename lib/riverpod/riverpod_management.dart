import 'package:doktorhasta/riverpod/doc_login_riverpod.dart';
import 'package:doktorhasta/riverpod/doc_register_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doktorhasta/riverpod/pat_login_riverpod.dart';
import 'package:doktorhasta/riverpod/pat_register_riverpod.dart';

final docLoginRiverpod = ChangeNotifierProvider((_) => DocLoginRiverpod());
final patLoginRiverpod = ChangeNotifierProvider((_) => PatLoginRiverpod());
final docRegisterRiverpod =
    ChangeNotifierProvider((_) => DocRegisterRiverpod());
final patRegisterRiverpod =
    ChangeNotifierProvider((_) => PatRegisterRiverpod());
