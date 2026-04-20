abstract interface class Repositorio {
  String buscarDado();
  void salvarDado(String dado);
  void deletarDado(String id);
  List<String> listarDados();
}

class RepositorioImpl implements Repositorio {
  @override
  String buscarDado() {
    return 'dado';
  }

  @override
  void salvarDado(String dado) {
    // Implementação do métodos salvar Dado
  }
  @override
  void deletarDado(String id) {
    // Implementação do métodos deletar Dado
  }

  @override
  List<String> listarDados() {
    // Implementação do métodos listar Dado
    return [];
  }
}

void buscarOsDados(Repositorio repositorio) {
  print(repositorio.buscarDado());
}

// essa classe abaixo com o uso do noSuchMethod é criado implementando Repositorio
// mas sem ter que implementar todos os metodos da interface class Repositorio
// para isso utilizasse o método noSuchMethod e tratamos somente do metodo
// que queremos implementar que no caso é o metodo buscarDado()

class MockRepositorio implements Repositorio {
  @override
  noSuchMethod(Invocation invocation) {
    if (invocation.memberName == #buscarDado) {
      return 'Batata';
    }
    return super.noSuchMethod(invocation);
  }
}

void main(List<String> args) {
  final r = RepositorioImpl();
  final rMock = MockRepositorio();

  buscarOsDados(r); // dado
  buscarOsDados(rMock); // Batata
}
