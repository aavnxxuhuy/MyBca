import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mybca_prototype/screens/transfer/transfer_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class transferPage extends StatefulWidget {
  const transferPage({super.key});

  @override
  State<transferPage> createState() => _transferPageState();
}

class _transferPageState extends State<transferPage> {
  @override
  Widget build(BuildContext context) {
    TransferProvider provider = Modular.get<TransferProvider>();

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Color(0xFF0060AF),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: widgetFont("Transfer", title4)
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  color: Color(0xFF0060AF),
                ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(0.0)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff1e5fad),
                      ),
                      child: TextButton(
                          onPressed: () => provider.keRekeningBCA(),
                          child: Text('Transfer ke Rekening BCA', style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,)),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff1e5fad),
                      ),
                      child: TextButton(
                          onPressed: () => provider.keRekeningBCA(),
                          child: Text('Transfer ke Bank Lain', style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,)),
                    ),
                      SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff1e5fad),
                      ),
                      child: TextButton(
                          onPressed: () => provider.keRekeningBCA(),
                          child: Text('Transfer Valas ke Bank Lain', style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,))),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff1e5fad),
                      ),
                      child: TextButton(
                          onPressed: () => provider.keRekeningBCA(),
                          child: Text('Virtual Account', style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,))),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff1e5fad),
                      ),
                      child: TextButton(
                          onPressed: () => provider.keRekeningBCA(),
                          child: Text('Lainnya', style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,))),
                  ],
                ),
              ),
              ]
            )
          ],
        ),
      ),
    );
  }
}
