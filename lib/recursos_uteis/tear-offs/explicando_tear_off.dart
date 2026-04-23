/*
O conceito de tear-off em Dart é um dos recursos mais elegantes para manter o 
código conciso e legível. Essencialmente, ele permite que você trate um método 
ou um construtor como uma função de primeira classe, sem a necessidade de envolvê-lo
 explicitamente em uma função anônima (lambda).

O que é um Tear-off?
Imagine que você tem uma função que recebe outra função como parâmetro. Em vez de 
escrever
 (valor) => MinhaClasse(valor), 
você pode simplesmente passar
 MinhaClasse.new.

O Dart "destaca" (tears off) a lógica do construtor e a entrega 
como um fechamento (closure) que possui a mesma assinatura esperada.

Tipos de Tear-off
1. Constructor Tear-offs
Introduzidos de forma completa no Dart 2.15, eles permitem referenciar construtores diretamente.
 */

class Produto {
  final String nome;
  Produto(this.nome);
}

void main() {
  var nomes = ['Teclado', 'Mouse', 'Monitor'];

  // Sem tear-off (Verboso)
  var produtos1 = nomes.map((n) => Produto(n)).toList();

  // Com constructor tear-off (Conciso)
  var produtos2 = nomes.map(Produto.new).toList(); 
}

/*
. Named Constructor Tear-offs
Funciona da mesma forma para construtores nomeados, o que é extremamente útil
 em serialização de dados (JSON).
 */

// Em vez de: .map((json) => User.fromJson(json))
// Use:
//var users = jsonList.map(User.fromJson).toList();

/*
or que utilizar?
Legibilidade: Remove o "ruído" visual de variáveis temporárias e setas (=>).

Performance: Em muitos casos, o compilador Dart pode otimizar tear-offs melhor
 do que funções anônimas, pois ele não precisa instanciar uma nova closure a 
 cada iteração; ele reutiliza a referência da função.

Manutenibilidade: Se a assinatura do construtor mudar, você só precisa garantir 
que o local onde ele é chamado espera a mesma nova assinatura, sem lidar com o 
mapeamento manual de parâmetros na lambda.

Casos de Uso Comuns
Mapeamento de Listas: Transformar listas de Strings ou Mapas em objetos de domínio.

Widgets no Flutter: Passar referências de construtores de widgets para parâmetros
 que aceitam WidgetBuilder.

Injeção de Dependência: Registrar classes em containers passando apenas a 
referência do construtor.

Diferença Visual entre Lambda e Tear-off

Abordagem               	Sintaxe
Lambda (Anônima)	        names.map((n) => Person(n))
Tear-off	                names.map(Person.new)



Nota Técnica: O sufixo .new é obrigatório para o construtor padrão em tear-offs 
para evitar ambiguidade sintática, enquanto para construtores nomeados, 
basta usar o nome após o ponto.
 */