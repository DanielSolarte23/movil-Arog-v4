import 'package:flutter/material.dart';
import 'package:arog_movil/screen/Header.dart';

class Noticias extends StatelessWidget {
  Noticias({super.key});

  final List<String> imgList = [
    'assets/images/Noticias.png',
    'assets/images/Noticias.png',
    'assets/images/Noticias.png',
    'assets/images/Noticias.png',
    'assets/images/Noticias.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomLayout(
      onNotifications: () {
          showTopNotifications(context);
      },
      header: Column(
        children: [
          Container(
            height: 150,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(4, 4),
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/Arog.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Menu',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Column(
        children: [
          _buildCarousel(context),
          const SizedBox(height: 20),
          Expanded(child: _buildCard()),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        itemCount: imgList.length,
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imgList[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard() {
    return ListView(
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
      child: SizedBox(
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
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(
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
