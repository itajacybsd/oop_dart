class PaiProduto extends Object {
  // Toda classe extends dA CLASSE OBJECT
  @override
  String toString() {
    return 'Classe PaiProduto';
  }
}

class Produto extends PaiProduto {
  String nome;

  Produto(this.nome);

  @override
  String toString() {
    return '${super.toString()}: Classe produto';
  }

  @override
  bool operator ==(Object other) {
    // implementacao da sobreescrita do '=='
    if (identical(this, other)) {
      return true;
    }
    if (other is! Produto) {
      // other não é um produto
      return false;
    }
    return this.nome == other.nome; //verificando se os nomes são os mesmos
  }

  @override
  //  o hashcode é um numero unico dessa classe
  int get hashCode => nome.hashCode; // só comparo o hash do nome pq só tem ele como elemento,
  // se tivesse mais, deveriam constar aqui também
}

void main(List<String> args) {
  final p = Produto('ADF');
  final p1 = Produto('ADF');

  // p.           <--  ambos possuem os metodos de Object
  // Object().    <--
  print(p.hashCode);
  print(p == p1); //false  comparando referencias de memoria
  print(p1.hashCode);
  // print(p);
  print(p.toString()); // mesma coisa, pq executou o toString do Object
}
