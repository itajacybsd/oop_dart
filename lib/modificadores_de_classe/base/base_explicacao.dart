/*
o caminho entre a flexibilidade total e a restrição rígida.

Se usarmos a analogia de Richard Feynman, imagine que você está projetando
 o chassi de um carro. Você quer que outras pessoas possam construir carros 
 diferentes em cima desse chassi (Sedans, SUVs, Esportivos), 
 mas você quer garantir que ninguém tente tratar o seu chassi apenas
  como um "folheto de instruções" (interface) — eles precisam usar a estrutura real 
  que você construiu.

O que define uma base class?
Quando você marca uma classe com o modificador base, você está impondo
 uma regra de segurança para quem for usar seu código: ela só permite herança (extends),
  não implementação (implements).

Garantia de Estrutura: Ela garante que qualquer subclasse terá a
 implementação base que você escreveu.

Identidade de Família: Você assegura que um objeto daquela família sempre
 terá o comportamento interno que você definiu, impedindo que alguém 
 crie uma "cópia falsa" apenas implementando a interface.

Segurança de Evolução: Se você adicionar um novo método à base class,
 você não quebra as subclasses (porque elas herdam o novo método),
  enquanto em uma interface, você quebraria todo mundo que a implementa.

Aplicação Prática
A base class é ideal para frameworks ou bibliotecas internas onde a continuidade
 do comportamento é vital.

Imagine que você está criando um sistema de logs. Você quer que todos os loggers
 tenham uma lógica básica de formatação que ninguém deve ignorar.
 */

// Definimos como 'base'. 
// Fora deste arquivo, ninguém pode fazer 'implements Gravador'
base class Gravador {
  void preparar() {
    print("--- Iniciando gravação de dados ---");
  }

  void gravar(String dados) {
    preparar();
    print("Salvando: $dados");
  }
}

// PERMITIDO: Estender para especializar o comportamento
final class GravadorDeArquivo extends Gravador {
  @override
  void gravar(String dados) {
    super.gravar(dados);
    print("Log escrito no sistema de arquivos.");
  }
}

// ERRO DE COMPILAÇÃO (em outro arquivo/pacote):
// class GravadorFalso implements Gravador { ... }
// O Dart impede isso porque 'Gravador' exige que você herde sua estrutura base.

/*
Quando usar cada uma?
Para não confundir com os outros modificadores que vimos:

interface class: Use quando você quer que as pessoas implementem o contrato, 
mas não quer que elas herdem seu código interno.

base class: Use quando você quer que as pessoas herdem seu código e sua estrutura, 
proibindo que criem implementações do zero que "finjam" ser sua classe.

abstract base class: É o "molde de família" puro. Não pode ser instanciada,
 mas obriga todos os descendentes a virem da mesma linhagem sanguínea (mesma base de código).

Por que isso é útil para você?
Como você trabalha com Dart e Flutter, as base classes são excelentes para
 criar ViewModels ou Controllers base. Você pode definir métodos 
 de ciclo de vida (como um init()) que você quer garantir que existam em 
 todas as suas telas, impedindo que alguém crie um Controller "pirata"
  que não herde essa lógica essencial.

Ficou clara a diferença entre exigir que alguém use sua "receita" (base) 
versus apenas exigir que entreguem o "prato pronto" (interface)?
 */