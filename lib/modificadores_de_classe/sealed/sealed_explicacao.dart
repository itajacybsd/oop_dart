/*
Se a final class é o fim da linha, a sealed class é uma "família fechada e enumerada".
 É um dos recursos mais poderosos introduzidos no Dart 3.0 para garantir a segurança 
 do fluxo de controle.

Imagine que você está em um aeroporto. O status de um voo só pode ser um de quatro: 
No Horário, Atrasado, Embarcando ou Cancelado. Não existe uma quinta opção mágica 
que surja do nada. Uma sealed class permite que você modele exatamente essa estrutura.

O que é uma sealed class?
Uma classe marcada como sealed possui três características fundamentais:

Abstração Implícita: Ela é automaticamente abstract. Você não pode criar um objeto direto dela.

Herança Restrita: Todas as subclasses devem ser declaradas no mesmo arquivo. 
Ninguém fora desse arquivo pode criar uma nova subclasse.

Exaustividade (Exhaustiveness): O compilador do Dart sabe exatamente quais 
são todas as subclasses possíveis. Isso permite que ele te avise se você esqueceu 
de tratar algum caso em um switch.


Aplicação Prática: O Padrão de Estado
A aplicação mais comum (e onde ela realmente brilha) é no gerenciamento de estados
 da interface (como no BLoC ou Cubit) ou no tratamento de respostas de API.

*/

// Arquivo: estado_pedido.dart

sealed class EstadoPedido {}

class Carregando extends EstadoPedido {}

class Sucesso extends EstadoPedido {
  final String protocolo;
  Sucesso(this.protocolo);
}

class Erro extends EstadoPedido {
  final String mensagem;
  Erro(this.mensagem);
}

// O compilador agora "conhece" todos os filhos de EstadoPedido
void verificarStatus(EstadoPedido estado) {
  // O switch em Dart 3 é exaustivo para classes sealed!
  final mensagem = switch (estado) {
    Carregando() => "Aguarde...",
    Sucesso(protocolo: var p) => "Pedido finalizado: $p",
    Erro(mensagem: var m) => "Ops: $m",
    // Se você comentar qualquer uma das linhas acima, o Dart dará ERRO de compilação.
    // Você não precisa mais do "default:".
  };
  
  print(mensagem);
}



/*
Por que usar sealed em vez de enum?
Você pode pensar: "Mas o enum já não faz isso?".
A diferença é que as subclasses de uma sealed class podem carregar dados diferentes.

Um enum é apenas um rótulo constante.

Uma sealed class permite que o estado Sucesso tenha um String protocolo, 
enquanto o estado Carregando não tem nada. É o que chamamos de 
Tipos de Dados Algébricos (ADTs).

Quando aplicar?
Resultados de Operações: Quando uma função pode retornar Sucesso(dados) ou Falha(erro).

Eventos e Estados: No Flutter, para definir os eventos que um usuário pode disparar
 em uma tela.

Regras de Negócio Estritas: Quando você quer garantir que nenhum desenvolvedor futuro
 adicione um novo tipo de "Desconto" sem atualizar todos os locais onde o desconto é calculado.

Resumo de Comportamento:

Modificador  | Pode Instanciar? |	Pode Herdar Fora do Arquivo? |	Exaustivo no Switch? |
class	       |      Sim         |            	Sim              |	        Não          |
final	       |      Sim         |            	Não              |	        Não          |
sealed	     |      Não         |            	Não              |	        Sim          |

Como você já tem experiência com BLoC e Cubit, as sealed classes são perfeitas para
 definir seus States. Elas eliminam a necessidade de verificar tipos manualmente com is
  e tornam o código muito mais seguro contra erros de lógica.
 */



/*

Excelente pergunta. Ao incluir a base class, a tabela ganha uma nuance importante 
sobre a diferença entre Herança (extends) e Implementação (implements).

Aqui está a tabela atualizada para o Dart 3.11, focando nas restrições de uso 
fora da biblioteca (arquivo) onde a classe foi definida:

Resumo de Modificadores (Uso Externo)

Modificador  | Pode Instanciar? |  	Pode extender (extends)    |	Pode Implementar (implements) |
class(padrão)|      Sim         |            	Sim              |	        Sim                   |
base         |      Sim         |            	Sim              |	        Não                   |
interface    |      Sim         |            	Não              |	        Sim                   |
final	       |      Sim         |            	Não              |	        Não                   |
sealed	     |      Não         |            	Não              |	        Não                   |


 */