//  ccascade_notation, usado em design pattern Builder
// api's fluentes -> qual é o proximo passo que será executado

class Carro {
  final String? modelo;
  final String? cor;
  final int? ano;
  final bool? temArCondicionado;
  Carro({this.modelo, this.cor, this.ano, this.temArCondicionado});

  void exibirDetalhes() {
    print(
      'Modelo: $modelo, Cor:  $cor, Ano: $ano, Ar Condicionado: $temArCondicionado',
    );
  }
}

class CarroBuilder {
  String? _modelo;
  String? _cor;
  int? _ano;
  bool? _temArCondicionado;

  CarroBuilder modelo(final String modelo) {
    _modelo = modelo;
    return this;
  }

  CarroBuilder cor(final String cor) {
    _cor = cor;
    return this;
  }

  CarroBuilder ano(final int ano) {
    _ano = ano;
    return this;
  }

  CarroBuilder temArCondicionado(final bool temArCondicionado) {
    _temArCondicionado = temArCondicionado;
    return this;
  }

  Carro build() { // nome do método build para construir o carro por partes
    return Carro(
      modelo: _modelo,
      ano: _ano,
      cor: _cor,
      temArCondicionado: _temArCondicionado,
    );
  }
}


void main(List<String> args) {
  final carro = CarroBuilder()
  ..modelo('Sedan')
  ..cor('Preto')
  ..ano(2025)
  ..temArCondicionado(true);


  carro.build().exibirDetalhes();

  // ou pode fazer direto

  CarroBuilder()
  ..modelo('Sedan')
  ..cor('Preto')
  ..ano(2025)
  ..temArCondicionado(true)
  ..build().exibirDetalhes();
}