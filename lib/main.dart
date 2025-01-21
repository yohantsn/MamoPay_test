import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mamopay_test/features/welcome/view/welcome_view.dart';
import 'package:mamopay_test/firebase_options.dart';
import 'package:mamopay_test/repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Register.init();
  runApp(const MaterialApp(
    home: WelcomeView(),
  ));
}
