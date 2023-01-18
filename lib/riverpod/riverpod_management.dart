import 'package:doktorhasta/riverpod/doc_login_riverpod.dart';
import 'package:doktorhasta/riverpod/doc_register_riverpod.dart';
import 'package:doktorhasta/riverpod/doc_online_flag_riverpod.dart';
import 'package:doktorhasta/riverpod/doc_send_message_riverpod.dart';
import 'package:doktorhasta/riverpod/messageslist_riverpod.dart';
import 'package:doktorhasta/riverpod/pat_update_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doktorhasta/riverpod/pat_login_riverpod.dart';
import 'package:doktorhasta/riverpod/pat_register_riverpod.dart';
import 'chat_update_riverpod.dart';
import 'doc_update_riverpod.dart';
import 'package:doktorhasta/riverpod/pat_send_message_riverpod.dart';

final docLoginRiverpod = ChangeNotifierProvider((_) => DocLoginRiverpod());
final patLoginRiverpod = ChangeNotifierProvider((_) => PatLoginRiverpod());
final docRegisterRiverpod =
    ChangeNotifierProvider((_) => DocRegisterRiverpod());
final patRegisterRiverpod =
    ChangeNotifierProvider((_) => PatRegisterRiverpod());

final onlineFlagRiverpod = ChangeNotifierProvider((_) => DocOnlineFlag());
final docUpdateRiverpod = ChangeNotifierProvider((_) => DocUpdateRiverpod());
final chatUpdateRiverpod = ChangeNotifierProvider((_) => ChatUpdateRiverpod());
final patUpdateRiverpod = ChangeNotifierProvider((_) => PatUpdateRiverpod());
final patsendMessageRiverpod = ChangeNotifierProvider((_) => PatSendMessage());
final docsendMessageRiverpod = ChangeNotifierProvider((_) => DocSendMessage());
