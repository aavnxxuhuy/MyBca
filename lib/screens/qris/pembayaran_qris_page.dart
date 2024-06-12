import 'package:flutter/material.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';

class PembayaranQrisPage extends StatefulWidget {
  const PembayaranQrisPage({super.key});

  @override
  State<PembayaranQrisPage> createState() => _PembayaranQrisPageState();
}

class _PembayaranQrisPageState extends State<PembayaranQrisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF0060AF),
        title: widgetFont("Pembayaran QRIS", title4),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: 150,
              color: Color(0xFF0060AF),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
