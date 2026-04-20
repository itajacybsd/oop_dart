// modificador de segurança
// pode ter metodos implementados
// INTERFACE CLASS PODE SER INSTANCIADA
// Interface class é uma classe que não pode ser extendida for do seu arquivo.
// Garatindo que os metodos implementados não serão alterados!!!

interface class Notificador {

  // Não pode ser alterado, mas precisa ser publico
  void enviarNotificacao(String message) {
    print('Notificação Padrão');
  }


}

class N extends Notificador{}

class N2 implements Notificador{
  @override
  void enviarNotificacao(String message) {
    print(message);
  }
}

void processarNotificacao(Notificador notificador) {
  notificador.enviarNotificacao('eita pega!');
}

void main() {
final n = Notificador();
// final n = N2();
  n.enviarNotificacao('teste de notificao'); // imprime Notificação Padrao
}