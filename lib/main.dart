import 'package:flutter/material.dart';
import 'package:genmerc/theme/theme.dart';
import 'package:firedart/firedart.dart';

/*const firebaseConfig = {
  apiKey: "AIzaSyCLzhrdFXnEX6wYY5-uP5Cad7ce2Grvn6M",
  authDomain: "genmerc-eb644.firebaseapp.com",
  projectId: "genmerc-eb644",
  storageBucket: "genmerc-eb644.appspot.com",
  messagingSenderId: "597213776170",
  appId: "1:597213776170:web:508f660129facd0e83b653",
  measurementId: "G-Q5TJ96XR67"
};*/
const apiKey = "AIzaSyCLzhrdFXnEX6wYY5-uP5Cad7ce2Grvn6M";
const projectId = "genmerc-eb644";

void main() {
  Firestore.initialize(projectId);
  runApp(const MyApp());
}
