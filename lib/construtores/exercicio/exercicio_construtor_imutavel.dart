class Paciente {
  final String nome;
  final int idade;
  final String telefone;

  Paciente(this.nome, this.idade, this.telefone);

  Paciente atualizarTelefone(String novoTelefone) {
    return copyWith(telefone: novoTelefone);
  }

  void exibirDados() {
    // print('Paciente: $nome, idade: $idade, telefone: $telefone');
    print(Paciente(nome, idade, telefone).toString());
  }

  @override
  String toString() {
    return 'Paciente: $nome, idade: $idade, telefone: $telefone';
  }

//  IMPLEMENTANDO PADRAO PROTOTYPE, usando o copywith
  Paciente copyWith({String? nome, int? idade, String? telefone}) {
    return Paciente(
      nome ?? this.nome,
      idade ?? this.idade,
      telefone ?? this.telefone,
    );
  }
}

class Consulta {
  final Paciente paciente;
  final DateTime data;
  final String especialidade;

  Consulta(this.paciente, this.data, this.especialidade);

  Consulta remarcarConsulta(DateTime novaData) {
    // data = DateTime.now();
    return copyWith(data: novaData);
  }

  void exibirDetalhes() {
    print('Dados do Paciente: \n');
    print('nome: $paciente\n'); //irá imprimir como o toString() do Paciente
    print('Data da consulta: $data\n');
    print('Especialidade: $especialidade\n');
  }

  Consulta copyWith({Paciente? paciente, DateTime? data, String? especialidade}){
    return Consulta(paciente??this.paciente, data??this.data, especialidade??this.especialidade);
  }
}

void main(List<String> args) {
  Paciente paciente1 = Paciente('Maria Oliveira', 45, '5555-1234');
  paciente1.exibirDados();
  final pacienteAlterado = paciente1.atualizarTelefone('7890-4561');
  pacienteAlterado.exibirDados();

  Consulta consulta1 = Consulta(paciente1, DateTime.now(), 'Dermatologista');

  consulta1.exibirDetalhes();
  final consultaAlterada = consulta1.remarcarConsulta(DateTime.now());
  consultaAlterada.exibirDetalhes();
}
