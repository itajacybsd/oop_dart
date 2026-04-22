// ignore_for_file: public_member_api_docs, sort_constructors_first
class Notificador {
  final String remetente;
  Notificador(this.remetente);

  void call(final String destinatario, final String tipoNotificacao) {
    final String mensagem;

    switch (tipoNotificacao.toLowerCase()) {
      case 'email':
        mensagem = 'Você recebeu um e-mail de $remetente';
        break;
      case 'sms':
        mensagem = 'Você recebeu um SMS de $remetente';
        break;

      case 'push':
        mensagem = 'Você recebeu um push notification de $remetente';
        break;

      default:
        mensagem = 'Tipo notificacao desconhecida!';
        break;
    }
    print('Para: $destinatario');
    print('Mensagem: $mensagem');
  }
}

void main(List<String> args) {
  
  final notificadores = [Notificador('Sistema A'), Notificador('Sistema B')] ;

  for (var notificador in notificadores) {
    notificador('Usuario','email');
    notificador('Usuario','push');
    notificador('Usuario','sms');
  }
}
