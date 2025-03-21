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
              padding: const EdgeInsets.symmetric(horizontal: 26),      
              child:CustomInput(label: "Nombre", hint: "Ingresa tu nombre"),
                ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child:CustomInput(label: "Correo Electronico", hint: "Correo electronico"),
                ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),   
              child:CustomDateInput(label: "Fecha de nacimiento"),
                ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
              child:CustomPasswordInput(label: "Contraseña"),
                ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
              child:CustomPasswordInput(label: "Confirmar Contraseña"),
                ),
              SizedBox(height: 16),
            ElevatedButton(
              onPressed:(){
                print('Boton de registro presionado');
              } , 
              child: Text(
                'Registrarse',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor:Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize:Size(250, 60)
                ),
                ),
            ], 
          ),
        ),
      ),
    );
  }
}



//INPUTS NORMALES REUTILIZABLE
// Widget reutilizable para inputs normales
class CustomInput extends StatelessWidget {
  final String label;
  final String hint;

  const CustomInput({required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child:TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green,width: 1)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green, width: 1),
            ),
            hintText: hint,
          ),
          )
        ),
        
      ],
    );
  }
}

// campo de fecha


class CustomDateInput extends StatefulWidget {
  final String label;

  const CustomDateInput({required this.label});

  @override
  _CustomDateInputState createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  TextEditingController _dateController = TextEditingController();

  // Método para abrir el selector de fecha
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

 @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),           
        child:TextField(
          controller: _dateController,
          readOnly: true, // Para que el usuario no pueda escribir manualmente
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green,width: 1)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green, width: 1),
            ),
            hintText: "Selecciona una fecha",
            suffixIcon: Icon(Icons.calendar_today,
            color: Colors.green
            ), // Icono de calendario
          ),
          onTap: () => _selectDate(context), // Abre el selector de fecha al tocar el input
        ),
          ),
      ],
    );
  }
}

// input contraseña 


class CustomPasswordInput extends StatefulWidget {
  final String label;

  const CustomPasswordInput({required this.label});

  @override
  _CustomPasswordInputState createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool _obscureText = true; // Estado para ocultar/mostrar la contraseña

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          
       child:TextField(
          obscureText: _obscureText, // Oculta la contraseña
          decoration: InputDecoration(
            border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green,width: 1)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.green, width: 1),
            ),
            hintText: "Ingresa tu contraseña",
            suffixIcon: IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.green,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText; // Alternar visibilidad
                });
              },
            ),
          ),
        ), 
          ),
      ],
    );
  }
}

