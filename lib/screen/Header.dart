import 'package:flutter/material.dart';
import 'package:arog_movil/screen/Notificaciones.dart';

class CustomLayout extends StatelessWidget {
  final Widget header;
  final Widget content;
  final VoidCallback? onNotifications;

  const CustomLayout({
    Key? key,
    required this.header,
    required this.content,
    this.onNotifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTopBar(context),
            const SizedBox(height: 20),
            header,
            const Divider(color: Colors.green, thickness: 2, height: 20),
            const SizedBox(height: 30),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(context, Icons.settings, 'Ícono de configuración presionado'),
        const SizedBox(width: 16),
        _buildSearchField(),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.notifications, size: 40, color: Colors.lightGreen),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              builder: (context) => const NotificacionesModal(),
            );
          },
        ),
        const SizedBox(width: 16),
        _buildIconButton(context, Icons.person, 'Ícono de perfil presionado'),
      ],
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, String msg, [VoidCallback? onPressed]) {
    return IconButton(
      icon: Icon(icon, size: 40, color: Colors.lightGreen),
      onPressed: onPressed ?? () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg))),
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
              offset: const Offset(0, 3),
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
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

void showTopNotifications(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5), // Fondo semitransparente
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) {
      return const Align(
        alignment: Alignment.topCenter,
        child: SafeArea(child: NotificacionesModal()),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: const Offset(0, -1), end: Offset.zero).animate(anim1),
        child: child,
      );
    },
  );
}
