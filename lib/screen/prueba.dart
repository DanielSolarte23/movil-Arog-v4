import 'package:flutter/material.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(60.0),
                child: Image.asset(
                  'assets/images/ArogV2.png',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Registrarse',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text('Nombre'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Correo Electronico'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electronico',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Fecha de nacimiento'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: DatePickerFormField(), // Aquí usamos DatePickerFormField
              ),
              SizedBox(height: 20),
              Text('Contraseña'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.lightGreen, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Confirmar contraseña'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirmar contraseña',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DatePickerFormField extends StatefulWidget {
  @override
  _DatePickerFormFieldState createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<DatePickerFormField> {
  TextEditingController _controller = TextEditingController();

  // Función para mostrar el DatePicker al hacer clic
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900); // Primer año disponible
    DateTime lastDate = DateTime.now(); // Última fecha disponible

    // Mostrar el DatePicker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    // Si el usuario selecciona una fecha, actualizar el campo
    if (pickedDate != null) {
      setState(() {
        _controller.text = "${pickedDate.toLocal()}".split(' ')[0]; // Formato: yyyy-MM-dd
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context), // Cuando el campo sea tocado, se abre el DatePicker
      child: AbsorbPointer( // Esto previene que el campo se pueda editar manualmente
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Selecciona una fecha',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0), // Borde completo
              borderSide: BorderSide(color: Colors.lightGreen, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
