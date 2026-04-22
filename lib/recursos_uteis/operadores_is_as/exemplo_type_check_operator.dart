class Animal {
  void fazerSom() {
    print('som Genérico');
  }
}

class Cachorro extends Animal {
  @override
  void fazerSom() {
    print('Latido');
  }

  void buscarBola() {
    print('Buscar a Bola');
  }
}

class Gato extends Animal {
  @override
  void fazerSom() {
    print('Miado');
  }
}

void main(List<String> args) {
  final animais = [Cachorro(), Gato(), Animal()];

  // final Animal animalCachorro = Cachorro();
  // final cachorro = animalCachorro as Cachorro;
  // cachorro.buscarBola();

  for (var animal in animais) {
    if (animal is! Cachorro) {
      print('Não é um cachorro');
    }
    animal.fazerSom();

    if (animal is Cachorro) {
      animal.buscarBola(); // só imprime aqui quando for um Cachorro, rola uma autopromoção de tipos
      
    }

    // print('é Cachorro?: ${animal is Cachorro}');
    // print('é Gato: ${animal is Gato}');
  }
}
