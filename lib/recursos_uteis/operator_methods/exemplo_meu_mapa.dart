class MeuSet {
  final Map<String, String> _dados = {};

  String operator [](String chave) => _dados[chave] ?? '';

  void operator []=(final String chave, String valor) {
    if (!_dados.containsKey(chave)) { //fazendo um Set
      _dados[chave] = valor;
    }
  }

}

void main(List<String> args) {
  final mapa = MeuSet();
  mapa['nome'] = 'Rodrigo';
  mapa['nome'] = 'Rodrigo';
  mapa['nome2'] = 'Ana';

  print(mapa['nome']);
  print(mapa['nome2']);
}