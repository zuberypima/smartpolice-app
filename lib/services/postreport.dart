import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
CollectionReference _taarifa =FirebaseFirestore.instance.collection('Taarifa');

class PostRipot{
  postreport(String location,String maelezo)async{
await _taarifa.add({
  'Eneo':location,
  'Maelezo':maelezo,
});
  }
}