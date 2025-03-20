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
                padding: const EdgeInsets.all(60.0),
                child: Image.asset(
                  'assets/images/ArogV2.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Registrarse',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
          
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.lightGreen, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Correo Electrónico'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.lightGreen, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Fecha de nacimiento'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: DatePickerFormField(),
              ),
              const SizedBox(height: 20),
              const Text('Contraseña'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Confirmar contraseña'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
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
  final TextEditingController _controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      _controller.text = "${pickedDate.toLocal()}".split(' ')[0]; // yyyy-MM-dd
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      onTap: () => _selectDate(context), // Evento para abrir el DatePicker
      decoration: InputDecoration(
        labelText: 'Selecciona una fecha',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.lightGreen, width: 2),
        ),
        suffixIcon: const Icon(Icons.calendar_today, color: Colors.lightGreen),
      ),
    );
  }
}
