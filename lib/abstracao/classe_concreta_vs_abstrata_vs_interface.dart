// possui metodos que foram implementados e metodos que NÃO foram implementados
// quem estende dela que especialize um dos metodos
// NAO PODE SER INSTANCIADA
abstract class MeioDePagamento {
  void emitirComprovante() {
    print('comprovante emitido');
  }


  void realizarPagamento();
}


// CLASSE CONCRETA
// Implementa todos os metodos, completando a sua instancia
class PagamentoBoleto extends MeioDePagamento {
  @override
  void realizarPagamento() {
    // TODO: implement realizarPagamento
  }

}
// INTERFACE
// SE QUISER SÓ DEFINIR CONTRATOS
// NAO DEVE TER NENHUM METODO IMPLEMENTADO
abstract interface class GatewayPagamento {
  void processarPagamento();
  bool pagamentoConfirmado();
}

// Posso ter classes abstgratas que implementam parte de uma interface
abstract class GatewayPagamentoADF implements GatewayPagamento {
    @override
  bool pagamentoConfirmado() {
    // TODO: implement pagamentoConfirmado
    throw UnimplementedError();
  }
}

// quando for gerar a classe concreta vc implementa o restante que faltou
// extendendo da classe abstrata que por sua vez está implementando o GatewayPagamento/Interface
class GatewayHotmart extends GatewayPagamentoADF{
  @override
  void processarPagamento() {
    // TODO: implement processarPagamento
  }

  void qualquer(){}
 

}

void main(List<String> args) {

  final GatewayPagamento hotmart = GatewayHotmart();
  final GatewayPagamentoADF hotmart2 = GatewayHotmart();
}

/*
Para entender essas três peças fundamentais da engenharia de software,
 vamos imaginar que estamos em uma oficina de marcenaria. Cada uma dessas "classes"
  tem uma função específica no projeto de construção.
  1. Classe Concreta (O Objeto Real)A classe concreta é o projeto finalizado,
   pronto para sair da linha de produção. Ela contém todos os detalhes: o que o objeto faz e como ele faz.
   Pode ser instanciada: Você pode dar um new (ou apenas chamar o construtor em Dart)
    e criar um objeto real na memória.Tem implementação: Todos os seus métodos
     possuem corpo (o código entre { }).Exemplo: Se "Carro" for uma classe concreta, 
     você pode ligá-lo, acelerar e dirigir, pois toda a mecânica já foi definida.

  2. Classe Abstrata (O Esboço)A classe abstrata é um conceito incompleto. 
  Ela serve para agrupar comportamentos comuns de uma "família" de objetos, 
  mas ela mesma não é um objeto final.Não pode ser instanciada: Você não pode criar um "Animal" genérico.
   Você cria um "Cachorro" ou um "Gato".Pode ter métodos incompletos: Ela define métodos que as filhas devem ter,
    mas também pode ter métodos prontos que todas as filhas
     vão compartilhar (herança).Uso: É usada para evitar repetição de código.Exemplo:
      Um "InstrumentoMusical" pode ter o método concreto limpar(), mas o método tocar() é abstrato,
       pois cada instrumento se toca de um jeito diferente.
       
  3. Interface (O Contrato)A interface (no Dart 3+, abstract interface class) é o nível mais puro de abstração.
   Ela não carrega "peças" (lógica), apenas uma lista de promessas.Apenas o "O Quê":
    Ela diz quais botões o objeto deve ter, mas não fornece nenhuma engrenagem interna.Múltiplas Implementações:
     Uma classe pode seguir vários contratos ao mesmo tempo (uma classe Smartphone pode implementar Camera,
      Telefone e PlayerDeMusica).Uso: É usada para garantir que diferentes objetos possam conversar entre si,
       mesmo que sejam de famílias totalmente diferentes.Exemplo: Uma tomada é uma interface.
        Não importa se o que você liga nela é uma TV ou uma furadeira;
        esde que o plugue siga o contrato (os pinos), a energia vai passar.
        
Tabela Comparativa (Resumo Rápido)
Característica          | Classe Concreta     | Classe Abstrata   | Interface (abstract interface)  |
Pode criar objeto?      |       Sim           |       Não         |           Não                   | 
Pode ter código pronto? |       Sim           |       Sim         |       Não (geralmente)          |
Pode ser herdada?       |       Sim (extends) |     Sim (extends) |       Não (apenas implements)   |
Objetivo principal      | Criar objetos       | Reutilizar código |         Definir um contrato     |
*/

/* 
EXEMPLO:

! INTERFACE: Apenas o contrato
abstract interface class Voador {
  void voar();
}

!!ABSTRATA: Base para uma família
abstract class Passaro {
  void respirar() => print("Respirando...");
  void bicar(); // Cada pássaro bica de um jeito
}

! CONCRETA: O objeto final que une tudo
class BeijaFlor extends Passaro implements Voador {
  @override
  void bicar() => print("Bicando a flor...");

  @override
  void voar() => print("Voando muito rápido!");
}
*/



