import 'package:arog_movil/views/configuracionCiudadano.dart';
import 'package:arog_movil/views/configurarNotificaciones.dart';
import 'package:arog_movil/views/perfilCiudadano.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RutasCiudadano extends StatefulWidget {
  @override
  _RutasCiudadanoState createState() => _RutasCiudadanoState();
}

class _RutasCiudadanoState extends State<RutasCiudadano> {
  bool _showCalendar = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<DateTime> _generateWeekDays() {
    DateTime today = DateTime.now();
    return List.generate(7, (index) => today.add(Duration(days: index - 3)));
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> days = _generateWeekDays();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings, color: Colors.lightGreen),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Configuracion()),
            );
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.grey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 5),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.lightGreen),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => configurarNotificaciones(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.lightGreen),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Perfilciudadano()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Rutas',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 80),

            SizedBox(
              width: 300,
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  DateTime day = days[index];
                  bool isSelected =
                      _selectedDay?.day == day.day &&
                      _selectedDay?.month == day.month &&
                      _selectedDay?.year == day.year;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDay = day;
                        _focusedDay = day;
                        _showCalendar = true;
                      });
                    },
                    child: Container(
                      width: 60,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? Colors.lightGreen[600]
                                : const Color.fromARGB(255, 209, 207, 207),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green, width: 2.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${day.day}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            _getWeekdayName(day.weekday),
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            if (_showCalendar)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.lightGreen,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.lightGreen[800],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  String _getWeekdayName(int weekday) {
    const List<String> weekdays = [
      'Dom',
      'Lun',
      'Mar',
      'Mié',
      'Jue',
      'Vie',
      'Sáb',
    ];
    return weekdays[weekday % 7];
  }
}
