//Page ya mtumiaji kutoa taarifa ya tukio
import 'package:flutter/material.dart';
import 'package:reporttopolice/services/postreport.dart';

class RipotiUhalifu extends StatefulWidget {
  const RipotiUhalifu({Key? key}) : super(key: key);

  @override
  State<RipotiUhalifu> createState() => _RipotiUhalifuState();
}

class _RipotiUhalifuState extends State<RipotiUhalifu> {
  String _location='';
  String _maelezo='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(39, 120, 160, 50),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Toa taifa',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
      body: ListView(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eneo la tukio/Uhalifu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      _location =value;
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Malelezo ya tukio /uhalifu kwa ufupi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: ((value) {
                      _maelezo=value;
                    }),
                    minLines: 1,
                    maxLines: 25,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        )),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Row(
              
              children: [
                Column(children: [
                  Text('Picha',style: TextStyle(fontSize: 20,color: Colors.lightBlue),),
                 Icon(Icons.camera),
                ]),
                SizedBox(width: 20,),Column(children: [
                  Text('Video',style: TextStyle(fontSize: 20,color: Colors.lightBlue),),
                 Icon(Icons.video_call),
                ]),SizedBox(width: 20,),Column(children: [
                  Text('Sauti',style: TextStyle(fontSize: 20,color: Colors.lightBlue),),
                 Icon(Icons.record_voice_over),
                ]),
               
              ],
            ),
          ),
          InkWell(
            onTap: ()async {
             await PostRipot().postreport(_location, _maelezo).then((value)=>Navigator.pop(context));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Text('Tuma',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),)),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
