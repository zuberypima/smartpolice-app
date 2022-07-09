import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Casefollowup extends StatefulWidget {
  const Casefollowup({Key? key}) : super(key: key);

  @override
  State<Casefollowup> createState() => _CasefollowupState();
}

class _CasefollowupState extends State<Casefollowup> {
  String _rbno = '';
  String _password = '';
  CollectionReference casevalue =
      FirebaseFirestore.instance.collection('Majalada');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
            child: Text(
          'Fuatilia Kesi',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
                child: Text(
              'Fuatilia Kesi Taarifa ya Kesi yako',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'RB No:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              onChanged: ((value) {
                setState(() {
                  _rbno = value;
                });
              }),
              decoration: InputDecoration(
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text(
              'Neno la siri:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextFormField(
              onChanged: (value) {
                _password = value;
              },
              decoration: InputDecoration(
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          InkWell(
            onTap: (() {
              setState(() {
                checkcasePresence(_rbno, _password);
              });
            }),
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    border: Border.all(width: 3),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  'Tafuta',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  checkcasePresence(String caseid, String password) {
    FirebaseFirestore.instance
        .collection('Majalada')
        .where('Kesi No', isEqualTo: caseid)
        .where('CasePassword', isEqualTo: password)
        .get()
        .then((QuerySnapshot snapshots) {
      if (snapshots.docs.isNotEmpty) {
        return showDialog(
            context: context,
            builder: (context) {
              return Container(
                child: AlertDialog(
                  content: Container(
                      height: 230,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(20)),
                      child: FutureBuilder<DocumentSnapshot>(
                        future: casevalue.doc(caseid).get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return Text("Document does not exist");
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Center(
                                child: Text(
                              "${data['casestatus']}",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 19),
                            ));
                          }

                          return Text("loading");
                        },
                      )),
                ),
              );
            });
      }
      if (snapshots.docs.isEmpty) {
        return showDialog(
            context: context,
            builder: (context) {
              return Container(
                child: AlertDialog(
                  content: Container(
                      height: 230,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'Hakikisha taaarifa ulizoweka',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                ),
              );
            });
      }
    });
  }
}
