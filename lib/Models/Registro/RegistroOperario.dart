
class CampoFormulario {
  final int id;
  final int formularioTipoId; // Este es el formularioTipoId que debe ser auto completado
  final String nombre;
  final String descripcion;
  final String tipo;
  final bool requerido;
  final int orden;
  final List<String>? opciones;

  CampoFormulario({
    required this.id,
    required this.formularioTipoId, // Lo incluimos en el constructor
    required this.nombre,
    required this.descripcion,
    required this.tipo,
    required this.requerido,
    required this.orden,
    this.opciones,
  });

  // Ahora pasamos formularioTipoId como argumento
  factory CampoFormulario.fromJson(Map<String, dynamic> json, int formularioTipoId) {
    return CampoFormulario(
      id: json['id'],
      formularioTipoId: formularioTipoId, // Ahora lo pasamos como argumento
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      tipo: json['tipo'],
      requerido: json['requerido'],
      orden: json['orden'],
      opciones: json['opciones'] != null
          ? List<String>.from(json['opciones'])
          : null,
    );
  }
}

class Formulario {
  final int id;
  final String nombre;
  final String descripcion;
  final DateTime fechaCreacion;
  final List<CampoFormulario> campos;
  final bool activo;
  final int creadorId;
  final int formularioTipoId;

  Formulario({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.fechaCreacion,
    required this.campos,
    required this.activo,
    required this.creadorId,
    required this.formularioTipoId,
  });

  factory Formulario.fromJson(Map<String, dynamic> json) {
    // Primero extraemos los campos como antes
    List<CampoFormulario> camposList =
        (json['campos'] as List<dynamic>)
            .map((campo) => CampoFormulario.fromJson(campo, json['id'])) // Aquí pasamos el formularioTipoId desde el formulario
            .toList();

    // Ahora extraemos formularioTipoId desde el primer campo, si existe
    int formularioTipoIdExtraido =
        camposList.isNotEmpty ? camposList[0].formularioTipoId : json['id'];

    return Formulario(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      fechaCreacion: DateTime.parse(json['fechaCreacion']),
      campos: camposList,
      activo: json['activo'],
      creadorId: json['creadorId'],
      formularioTipoId: formularioTipoIdExtraido,
    );
  }
}

