class Dispositivo {
  String nome;   // <-- com esse campo adicionado, as classes que herdam precisarão implementar
  //  como é o caso da classe ImpressoraFiscal
  // mas a classe ControladorDeDispositivo não precisará
   

  Dispositivo(this.nome);

  void ligar() {
    print('Dispositivo ligado');
  }

  void desligar() {
    print('Dispositivo desligado');
  }
}

// CASO DE HERANÇA
// COM ALTO ACOPLAMENTO, DEPENDE DO DISPOSITIVO
//  a impressora fiscal É UM dispositivo
//ela recebe a instancia daquilo que ela precisa
class ImpressoraFiscal extends Dispositivo {
  ImpressoraFiscal(super.nome);

  void imprimirNotaFiscal() {
    print('Nota fiscal impressa');
  }
}

// vai controlar o dispositivo
// caso de COMPOSIÇÃO
// BAIXO ACOPLAMENTO, pq ele recebe um Dispositivo
// o controlador TEM UM dispositivo
class ControladorDeDispositivo {
  final Dispositivo dispositivo;

  ControladorDeDispositivo(this.dispositivo);

  void ligarDispositivo() {
    dispositivo.ligar();
  }

  void desligarDispositivo() {
    dispositivo.desligar();
  }
}

void main(List<String> args) {
  final impFiscal = ImpressoraFiscal('Fiscal');

  final alexa = ControladorDeDispositivo(impFiscal);

// composição, o controlador está ligado a impressora fiscal
  alexa.ligarDispositivo();

}
