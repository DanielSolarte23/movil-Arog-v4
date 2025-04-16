import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:arog_movil/views/ciudadano/configuracionCiudadano.dart';
import 'package:arog_movil/views/notificaciones/configurarNotificaciones.dart';
import 'package:arog_movil/views/administrador/homeAdmin.dart';
import 'package:arog_movil/views/ciudadano/perfilCiudadano.dart';
import 'package:flutter/material.dart';

class RutasCiudadano extends StatefulWidget {
  @override
  State<RutasCiudadano> createState() => RutasCiudadanoState();
}

class RutasCiudadanoState extends State<RutasCiudadano> {
  final MapController _mapController = MapController();
  bool _isMapLoading = true;
  LatLng _currentPosition = LatLng(4.570868, -74.297333);
  double _currentZoom = 13.0;

  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Puntos', 'icon': Icons.pin_drop},
    {'title': 'Horarios', 'icon': Icons.calendar_today},
  ];

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _isMapLoading = false;
      });
      _mapController.move(_currentPosition, _currentZoom);
    } catch (e) {
      print("Error obteniendo ubicación: $e");
      setState(() => _isMapLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
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
              hintText: 'Buscar...',
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
          IconButton(
            icon: const Icon(Icons.home, color: Colors.lightGreen),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeAdmin()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Permite desplazamiento vertical
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.pin_drop,
                        size: 26,
                        color: Color.fromARGB(255, 78, 78, 78),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Rutas',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 78, 78, 78),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.lightGreen),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        center: _currentPosition,
                        zoom: _currentZoom,
                        minZoom: 5,
                        maxZoom: 18,
                        onMapReady: () {
                          setState(() => _isMapLoading = false);
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: _currentPosition,
                              width: 80,
                              height: 80,
                              child: Icon(
                                Icons.location_on,
                                color: Colors.lightGreen,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: Column(
                        children: [
                          FloatingActionButton.small(
                            heroTag: "zoomIn",
                            onPressed: () {
                              final zoom = _mapController.zoom + 1;
                              _mapController.move(_currentPosition, zoom);
                            },
                            backgroundColor: Colors.white,
                            child: Icon(Icons.add, color: Colors.lightGreen),
                          ),
                          SizedBox(height: 8),
                          FloatingActionButton.small(
                            heroTag: "zoomOut",
                            onPressed: () {
                              final zoom = _mapController.zoom - 1;
                              _mapController.move(_currentPosition, zoom);
                            },
                            backgroundColor: Colors.white,
                            child: Icon(Icons.remove, color: Colors.lightGreen),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: FloatingActionButton.small(
                        heroTag: "myLocation",
                        onPressed: _getCurrentLocation,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.my_location,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ),
                    if (_isMapLoading)
                      Container(
                        color: Colors.white,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.lightGreen,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0,
                runSpacing: 10.0,
                children:
                    menuItems.map((item) {
                      return SizedBox(
                        width: 110,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              if (item['route'] != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => item['route'],
                                  ),
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    item['icon'],
                                    color: Colors.lightGreen[600],
                                    size: 24,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 311,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 121, 177, 61),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
