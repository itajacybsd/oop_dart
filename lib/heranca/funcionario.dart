class Funcionario {
  String nome;
  double salarioBase;

  Funcionario(this.nome, this.salarioBase);

  double calcularSalario() {
    return salarioBase;
  }
}

class Gerente extends Funcionario {
  double bonus;
  // ignore: use_super_parameters
  // Gerente(String nome, double salarioBase, this.bonus)
  //   : super(nome, salarioBase);

  // ao invés de fazer como na linha acima, podemos escrever como está aqui abaixo
  // fazendo uma atribuição direta, não passando pelo construtor como na linha acima(que 
  // está chamando o construtor Funcionario default)
  Gerente(super.nome, super.salarioBase, this.bonus);

  @override
  double calcularSalario() {
    return salarioBase + bonus;
  }
}

class Desenvolvedor extends Funcionario {
  double horasExtras;
  double valorHoraExtra;
  Desenvolvedor(
    String nome,
    double salarioBase,
    this.horasExtras,
    this.valorHoraExtra,
  ) : super(nome, salarioBase);

  @override
  double calcularSalario() {
    return salarioBase + (horasExtras * valorHoraExtra);
  }
}

void main(List<String> args) {
  final funcionarioComum = Funcionario('paula', 2000);
  print(
    'Salario: ${funcionarioComum.salarioBase}: ${funcionarioComum.calcularSalario()}',
  );

  final gerente = Gerente('Rodrigo', 10000, 2000);
  print('Salario: ${gerente.salarioBase}: ${gerente.calcularSalario()}');
  // gerente.nome;
  // gerente.salarioBase;
  // gerente.bonus;

  final desenvolvedor = Desenvolvedor('Ana', 20000, 200, 200);
  print(
    'Salario: ${desenvolvedor.salarioBase}: ${desenvolvedor.calcularSalario()}',
  );
}
