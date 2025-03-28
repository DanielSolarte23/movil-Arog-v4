import 'package:flutter/material.dart';

class RutasRecolector extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Ruta asignada', 'icon': Icons.route},
    {'title': 'Historial ruta', 'icon': Icons.assignment},
    {'title': 'Editar', 'icon': Icons.edit},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings, color: Colors.lightGreen),
          onPressed: () {},
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.grey),
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
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.lightGreen),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Rutas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              width: 270,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(width: 2, color: Colors.green),
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Arog-2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: menuItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.3, 
                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            menuItems[index]['icon'],
                            color: Colors.lightGreen[600],
                            size: 24, 
                          ),
                          const SizedBox(height: 6),
                          Text(
                            menuItems[index]['title'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12, 
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 20),
            Container(
              height: 190,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}