import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:route_movie_app/firebase_options.dart';
import 'package:route_movie_app/movie_app.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MovieApp());
}



