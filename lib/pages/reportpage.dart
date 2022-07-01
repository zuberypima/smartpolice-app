import 'package:flutter/material.dart';
import 'package:reporttopolice/pages/riportuhalifu.dart';
import 'package:reporttopolice/widgets/topagebutton.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int _phoneviewheight =100;
  int _phoneviewwidth =100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(color: Color.fromRGBO(39, 120, 160, 50)),
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(),
                    child: Image(image: AssetImage('assets/taifa.png')),
                  ),
                  Text(
                    'Toa taarifa ya  kwa polisi',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    height: 90,
                    width: 60,
                    decoration: BoxDecoration(),
                    child: Image(image: AssetImage('assets/logoPolice.png')),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RipotiUhalifu()));
              }, child: Text('Repoti Uhalifu')),
              SizedBox(width: 10,),
              TextButton(onPressed: () {}, child: Text('Repoti Ajali')),
               SizedBox(width: 10,),
              TextButton(onPressed: () {}, child: Text('Taarifa ya Kesi yako')),
            ],
          )
        ],
      ),
    );
  }
}
