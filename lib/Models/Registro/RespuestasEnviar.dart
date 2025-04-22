class ValorCampoFormulario {
  final int campoFormularioId;
  final dynamic valor;

  ValorCampoFormulario({
    required this.campoFormularioId,
    required this.valor,
  });

  Map<String, dynamic> toJson() {
    return {
      'campoFormularioId': campoFormularioId,
      'valor': valor is DateTime
          ? valor.toIso8601String()
          : valor,
    };
  }
}

class RespuestaFormulario {
  final int formularioTipoId;
  final String titulo;
  final String descripcion;
  final int creadorId;
  final List<ValorCampoFormulario> valores;

  RespuestaFormulario({
    required this.formularioTipoId,
    required this.titulo,
    required this.descripcion,
    this.creadorId = 4, //valor por defecto mientras defino el del token
    required this.valores,
  });

  Map<String, dynamic> toJson() {
    return {
      'formularioTipoId': formularioTipoId,
      'titulo': titulo,
      'descripcion': descripcion,
      'creadorId': creadorId,
      'valores': valores.map((v) => v.toJson()).toList(),
    };
  }
}
