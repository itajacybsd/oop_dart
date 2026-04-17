class Cliente{
  String nome;
  int idade;

  // Cliente(this.nome, this.idade);
  // Cliente.menorIdade(String nome) : this(nome, 17);

  Cliente.padrao(this.nome, this.idade);
  // vamos criar um cliente menorIdade chamando/redirecionando para o construtor padrao Cliente.padrao
  // usando o "this" e passando a idade padrao 17
  Cliente.menorIdade(String nome) : this.padrao(nome, 17);

  // não é muito utilizado
}