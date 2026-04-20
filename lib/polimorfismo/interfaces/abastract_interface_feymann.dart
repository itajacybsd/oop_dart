// 'abstract interface' garante que ninguém possa:
// 1. Instanciar (criar um objeto direto desta classe)
// 2. Estender (usar 'extends' para herdar lógica interna)
// Eles são OBRIGADOS a usar 'implements'.
abstract interface class ProcessadorPagamento {
  void processar(double valor);
}

// Implementação específica para Cartão
final class PagamentoCartao implements ProcessadorPagamento {
  @override
  void processar(double valor) {
    print('Processando R\$ $valor via Cartão: Validando chip e PIN.');
  }
}

// Implementação específica para Pix
final class PagamentoPix implements ProcessadorPagamento {
  @override
  void processar(double valor) {
    print('Processando R\$ $valor via Pix: Gerando chave dinâmica.');
  }
}



void main() {
  // O polimorfismo continua funcionando lindamente
  final ProcessadorPagamento meuPgto = PagamentoPix();  // instancia de PagamentoPix
  final ProcessadorPagamento meuPgto2 = PagamentoCartao(); // Instancia de PagamentoCartao

  meuPgto.processar(250.0);
  meuPgto2.processar(450.0);

}

/* 
O que mudou e por que importa?
abstract interface class: Agora o Dart entende explicitamente a intenção. Antes, qualquer abstract class
 poderia ser usada com extends, o que às vezes causava confusão se a classe deveria ser apenas 
 uma interface pura.

final class: Usei final nas implementações. Isso significa que ninguém pode criar 
uma subclasse de PagamentoCartao. Isso fecha a hierarquia e torna o código mais fácil de otimizar
 para o compilador (e para o seu cérebro).

Segurança de Contrato: Se alguém tentar usar extends ProcessadorPagamento, o compilador do Dart 3.11 
vai dar um erro imediato, forçando o desenvolvedor a seguir o contrato da interface corretamente.

É como se o cardápio do restaurante agora estivesse protegido por um vidro: você pode ler e pedir 
o que está lá, mas não pode tentar rabiscar em cima dele ou tentar transformá-lo em um cardápio 
de outro restaurante.
*/

/*
Imagine que você está em um restaurante. Você recebe um cardápio. Aquele cardápio é uma promessa,
 um contrato. Ele diz: "Se você pedir o 'Frango Assado', ele virá em um prato, será quente e comestível".

O cardápio não te diz quem vai cozinhar, se vão usar um forno a gás ou elétrico, 
ou se o chef está de mau humor. Ele apenas define a interface entre você e a cozinha.
 A cozinha é a "implementação".

Na computação, uma Interface Abstrata é exatamente isso. É um jeito de descrever o que um objeto faz,
 sem dizer uma palavra sobre como ele faz. É criar um "molde" de comportamento. Se algo "parece" um rádio
  e "funciona" como um rádio (tem botões de volume e sintonia), eu não preciso saber se dentro dele existem válvulas ou microchips para conseguir ouvir música.

O truque é que, em Dart, não temos uma palavra-chave interface como em Java. 
Toda classe em Dart define implicitamente uma interface. Mas quando queremos ser rigorosos, 
usamos abstract class. Isso impede que alguém tente "instanciar" o cardápio. Você não pode comer o cardápio;
 você só pode comer a comida que segue as regras dele.

O Exemplo no Código
Vamos criar um contrato para algo que "processa pagamentos". Não importa se é cartão, Pix ou dinheiro; todos
 devem seguir a mesma regra: ter um método processar.




Por que isso é genial?
Se amanhã inventarem o pagamento por "Telepatia", eu só preciso criar uma nova classe
 PagamentoTelepatico que implementa ProcessadorPagamento. O resto do meu sistema (o main) 
 nem vai notar a diferença. Ele continua apenas chamando o método .processar().

É a simplicidade da estrutura escondendo a complexidade da execução. Faz sentido?
 */