class Utils {
  static String inverter(String s) => s.split('').reversed.join(); // método estático
  String inverterInstancia(String s) => s.split('').reversed.join(); 
}

void imprimirInverso(
    String nome,
    String Function(String) funcaoInverter,
  ) {
  final nomeInvertido = funcaoInverter(nome);
  print(nomeInvertido);
}

void main(List<String> args) {
  imprimirInverso('Rodrigo Rahman', Utils.inverter);
  

  final utils = Utils();

// destacando um método de uma instancia e passando para dentro de uma função
// isso é tear off
  imprimirInverso('Cururu das Trevas', utils.inverterInstancia );

}
