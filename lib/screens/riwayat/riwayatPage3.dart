import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mybca_prototype/screens/riwayat/riwayat_provider.dart';
import 'package:mybca_prototype/utils/fonts.dart';
import 'package:mybca_prototype/utils/string_const.dart';
import 'package:table_calendar/table_calendar.dart';

class riwayatPage3 extends StatefulWidget {
  const riwayatPage3({super.key});

  @override
  State<riwayatPage3> createState() => _riwayatPage3State();
}

class _riwayatPage3State extends State<riwayatPage3> {

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  // var to store date
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String? month;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState((){
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay){
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      print(_rangeStart);
      print(_rangeEnd);
      month = DateFormat.MMMM().format(_rangeStart!);
    });
  }

  @override
  Widget build(BuildContext context) {
    RiwayatProvider provider = Modular.get<RiwayatProvider>();
    final read = context.read<RiwayatProvider>();
    final watch = context.watch<RiwayatProvider>();

    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
            backgroundColor: Color(0xFF0060AF),
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: widgetFont("Riwayat", title4)
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFF0060AF),
            child: Column(
              children: [
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
                      Center(child: widgetFont("Pilih Tanggal", jumbo2)),
                      SizedBox(height: 20,),
                      TableCalendar(
                        firstDay : DateTime.utc(2010, 3, 14),
                        lastDay: DateTime.utc(2030,4,14),
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                        calendarFormat: _calendarFormat,
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        onDaySelected: _onDaySelected,
                        rangeStartDay: _rangeStart,
                        onRangeSelected: _onRangeSelected,
                        rangeSelectionMode: RangeSelectionMode.toggledOn,
                        rangeEndDay: _rangeEnd,
                        calendarStyle: CalendarStyle(
                          outsideDaysVisible: false,
                        ),
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                      ),
                      SizedBox(height: 20,),
                      Center(
                          child: Text(
                              "Periode maksimal yang dapat dipilih hanya 31 hari terakhir",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25))),
                      SizedBox(height: 50,),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff1e5fad),
                        ),
                        child: TextButton(
                            onPressed: () {
                              if (month == null) {
                                Asuka.showDialog(
                                  builder: (context) => AlertDialog(
                                    title: const Text('Warning'),
                                    content: const Text('Pick A Start Date And End Date'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              } else{
                                provider.tampilkan(_rangeStart, _rangeEnd, month);
                              }
                            },
                            child: widgetFont('Tampilkan', jumbo1)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
