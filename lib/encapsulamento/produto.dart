class Produto {
  double _preco = 0;

  double getPreco() => _preco;
  void setPreco(double preco) => _preco = preco;

  // double get preco => _preco;
  double get preco {
    print('chamou o Getter preco');
    return _preco;
  }

  // set preco(double preco) => _preco = preco;
  set preco(double preco) {
    print('chamou o SETTER preco');

    _preco = preco;
  }
}
