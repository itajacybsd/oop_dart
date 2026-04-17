class Paciente {
  String nome;
  int idade;
  String telefone;

  Paciente(this.nome, this.idade, this.telefone);

  void atualizarTelefone(String novoTelefone) {
    telefone = novoTelefone;
  }

  void exibirDados() {
    // print('Paciente: $nome, idade: $idade, telefone: $telefone');
    print(Paciente(nome, idade, telefone).toString());
  }

  @override
  String toString() {
    return 'Paciente: $nome, idade: $idade, telefone: $telefone';
  }
}

class Consulta {
  Paciente paciente;
  DateTime data;
  String especialidade;

  Consulta(this.paciente, this.data, this.especialidade);

  void remarcarConsulta(DateTime novaData) {
    data = DateTime.now();
  }

  void exibirDetalhes() {
    print('Dados do Paciente: \n');
    print('nome: $paciente\n'); //irá imprimir como o toString() do Paciente
    print('Data da consulta: $data\n');
    print('Especialidade: $especialidade\n');
  }



}

void main(List<String> args) {
  Paciente paciente1 = Paciente('Maria Oliveira', 45, '5555-1234');
  paciente1.exibirDados();
  paciente1.atualizarTelefone('7890-4561');
  paciente1.exibirDados();

  Consulta consulta1 = Consulta(paciente1, DateTime.now(), 'Dermatologista');

  consulta1.exibirDetalhes();
  consulta1.remarcarConsulta(DateTime.now());
  consulta1.exibirDetalhes();


}
