import 'package:flutter/material.dart';
import 'package:arog_movil/screen/Notificaciones.dart';

void showTopNotifications(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Cerrar",
    barrierColor: Colors.black.withOpacity(0.4),
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation1, animation2) {
      return const SafeArea(child: NotificacionesModal());
    },
    transitionBuilder: (context, animation1, animation2, child) {
      final curvedValue = Curves.easeInOut.transform(animation1.value) - 1.0;
      return Transform.translate(
        offset: Offset(0, curvedValue * -300),
        child: Opacity(
          opacity: animation1.value,
          child: child,
        ),
      );
    },
  );
}
