import 'package:flutter/material.dart';

class Noticias extends StatefulWidget {
  const Noticias({super.key});

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  final List<String> imgList = [
    'assets/images/Arog-2.png',
    'assets/images/Arog.png',
    'assets/images/Noticias.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTopBar(),
            SizedBox(height: 20),
            _buildHeader(),
            Divider(color: Colors.green, thickness: 2, height: 20),
            SizedBox(height: 30),
            _buildCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        _buildIconButton(Icons.settings, 'Ícono de configuración presionado'),
        SizedBox(width: 16),
        _buildSearchField(),
        SizedBox(width: 16),
        _buildIconButton(Icons.notifications, 'Ícono de notificaciones presionado'),
        SizedBox(width: 16),
        _buildIconButton(Icons.person, 'Ícono de perfil presionado'),
      ],
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Buscar...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.lightGreen, width: 2),
            ),
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String logMessage) {
    return IconButton(
      onPressed: () {
        print(logMessage);
      },
      icon: Icon(
        icon,
        size: 40,
        color: Colors.lightGreen,
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        ClipRRect(
          child: Image.asset(
            'assets/images/Arog.png',
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.5,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Noticias',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _buildCarousel(),
        SizedBox(height: 20),
        Text(
          'Menú',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCarousel() {
    return Carousel(
      height: MediaQuery.of(context).size.width * 0.5,
      children: imgList.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            item,
            width: MediaQuery.of(context).size.width * 0.9,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCard() {
    return Expanded(
      child: ListView(
        children: [
          _buildCardRow([
            _buildCardItem(Icons.map_outlined, 'Rutas', () {
              print('Card de Rutas presionada');
            }),
            _buildCardItem(Icons.assignment_outlined, 'Tareas', () {
              print('Card de Tareas presionada');
            }),
          ]),
        ],
      ),
    );
  }

  Widget _buildCardRow(List<Widget> cards) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: cards,
    );
  }

  Widget _buildCardItem(IconData icon, String text, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 120,
        height: 150,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.green),
                SizedBox(height: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
