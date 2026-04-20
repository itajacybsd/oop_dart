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