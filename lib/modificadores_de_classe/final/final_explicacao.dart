/*
No mundo do Dart 3+, a final class é o ponto final de uma linhagem. Se a base class que vimos antes era um chassi que permitia modificações, a final class é o carro saindo da concessionária com o capô lacrado: você pode usá-lo, mas não pode construir nada em cima dele.

O que é uma final class?
Quando você marca uma classe como final, você está fechando a hierarquia de herança.

Sem Subclasses: Ninguém (fora do mesmo arquivo/biblioteca) pode dar um extends ou implements nela.

Segurança Total: Como o compilador sabe exatamente quais são as únicas implementações possíveis daquela classe, ele pode realizar otimizações de performance mais agressivas.

Controle de Comportamento: Você garante que as regras de negócio escritas ali nunca serão sobrescritas ou alteradas por terceiros.

Aplicação Prática
A final class é ideal para Tipos de Dados e Lógica de Domínio Crítica que não deve ser alterada. No ecossistema Flutter/Dart, ela brilha em dois cenários principais:

!1. Modelos de Dados (Data Transfer Objects)
Se você tem uma classe que representa uma resposta da API, você não quer que alguém herde dela e mude como os dados são processados.
 */
final class Usuario {
  final String nome;
  final int id;

  Usuario(this.nome, this.id);
  
  void exibirPerfil() => print("Usuário: $nome (#$id)");
}

// Isso causará um erro em outro arquivo:
// class Administrador extends Usuario { ... }

/*
!2. Fechando uma "Família" (Sealed-like behavior)
Muitas vezes, você quer criar uma classe que seja a implementação final de uma interface.

Dart
abstract interface class Operacao {
  double executar(double a, double b);
}

*Estas são as únicas formas de operação permitidas e elas não podem ser alteradas.
final class Soma implements Operacao {
  @override
  double executar(double a, double b) => a + b;
}

final class Subtracao implements Operacao {
  @override
  double executar(double a, double b) => a - b;
}
Por que usar final em vez de apenas uma classe normal?
Na modelagem orientada a abstração, o excesso de liberdade pode ser um inimigo.

Se você deixa tudo como class (padrão), qualquer desenvolvedor da sua equipe pode
 herdar de uma classe sua para "consertar" algo via override, criando um código 
 altamente acoplado e difícil de manter.

Com final, você força o desenvolvedor a usar a composição (colocar sua classe dentro de outra)
 em vez da herança.

Dica de Especialista: Se você está criando um pacote (package) para outros usarem,
 use final em tudo o que não foi projetado especificamente para ser estendido. 
 Isso evita que usuários quebrem o próprio código quando você atualizar sua biblioteca.

Resumo Visual das Restrições no Dart 3:
base: Pode ser estendida, mas não implementada.

interface: Pode ser implementada, mas não estendida.

final: Não pode ser estendida nem implementada (fora do arquivo original).
 */