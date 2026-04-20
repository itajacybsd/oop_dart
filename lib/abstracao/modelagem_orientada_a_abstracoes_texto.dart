/*
  Imagine que você foi contratado para projetar o painel de controle de uma Estação Espacial. Se você começar o projeto pensando no parafuso de titânio do botão "Ejetar", você está em apuros. Se o fornecedor mudar o parafuso, seu projeto quebra.

A Modelagem Orientada a Abstração é a arte de projetar o sistema focando no "o que deve ser feito" (comportamento) em vez de "como é feito" (detalhe técnico). É construir o software em camadas, onde as partes mais importantes (as regras de negócio) não dependem das partes frágeis (banco de dados, frameworks, UI).

Aqui estão os pilares para você dominar essa mentalidade:

1. O "O Quê" precede o "Como"
Na modelagem tradicional, você pensa: "Vou criar uma função que salva no Firebase".
Na modelagem orientada a abstração, você pensa: "Eu preciso de algo que persista dados. Vou chamar isso de RepositorioDeDados".

Você cria uma interface. O código que usa esse repositório não faz a menor ideia se o dado vai para o Firebase, para um arquivo TXT ou para a memória. Isso torna seu sistema testável e flexível.

2. O Princípio da Inversão de Dependência (D de SOLID)
Este é o coração da ideia.

Sem abstração: O módulo A depende diretamente do módulo B (Rígido).

Com abstração: O módulo A e o módulo B dependem de uma Abstração (Interface).

Exemplo Clássico: Sua lâmpada não é soldada diretamente nos fios da parede. Existe uma interface (o bocal). A lâmpada depende do bocal e a fiação depende do bocal. Isso permite que você troque uma lâmpada LED por uma Incandescente sem refazer a fiação da casa.

3. Redução da Carga Cognitiva
Abstrair é "esconder detalhes irrelevantes". Quando você modela bem, você cria caixas pretas. Você não precisa entender como o motor de combustão interna funciona para dirigir um carro; você só precisa entender a interface (volante, pedais).

No código, isso significa que quem chama o seu método não precisa ler as 200 linhas de lógica interna para saber o que ele faz.

Exemplo Prático em Dart 3.11
Vamos modelar um sistema de Notificações. O sistema não deve se importar se é SMS ou E-mail.
 
 */

// 1. A Abstração (O Contrato)
abstract interface class Notificador {
  void enviar(String mensagem);
}

// 2. As Implementações (Os Detalhes - O "Como")
class NotificadorEmail implements Notificador {
  @override
  void enviar(String mensagem) => print("Enviando E-mail: $mensagem");
}

class NotificadorSMS implements Notificador {
  @override
  void enviar(String mensagem) => print("Enviando SMS: $mensagem");
}

// 3. O Usuário da Abstração (A Lógica de Negócio)
// Note que esta classe NÃO conhece 'Email' ou 'SMS'. Ela conhece apenas 'Notificador'.
class ServicoDeAlerta {
  final Notificador _notificador;

  ServicoDeAlerta(this._notificador); // Injeção de Dependência

  void dispararAlerta() {
    _notificador.enviar("O sistema detectou uma falha!");
  }
}

void main() {
  // Hoje quero e-mail
  var alerta = ServicoDeAlerta(NotificadorEmail());
  alerta.dispararAlerta();
  
  // Amanhã mudo para SMS sem alterar uma linha da classe ServicoDeAlerta
  alerta = ServicoDeAlerta(NotificadorSMS());
  alerta.dispararAlerta();
}
