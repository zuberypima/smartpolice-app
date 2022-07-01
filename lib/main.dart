import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reporttopolice/pages/reportpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: FutureBuilder(
        future: _initialization,
        //initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasError){
            print('Error');
          }
          if(snapshot.connectionState ==ConnectionState.done){
            return ReportPage();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
//ReportPage(),