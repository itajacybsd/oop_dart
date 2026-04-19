abstract class RelatorioFinanceiro {
    // em uma classe abstrata você pode ter métodos que não foram implementados
    // nesse caso as subclasses serão obrigadas a implementá-las
    // no caso abaixo teremos que implmentar nas classes filhas o método gerar()
  String gerar();  // <-- ESTE METODO deverá ser implementada nas classes filhas

  void enviar(String path) {
    print('Relatorio enviado $path');
  }
}

class RelatorioFinanceiroMensal extends RelatorioFinanceiro{
  @override
  String gerar() {
    print('gerando relatorio mensal');
    return './relatorioMensal.pdf';
  }
}
class RelatorioFinanceiroAnual extends RelatorioFinanceiro{
  @override
  String gerar() {
     print('gerando relatorio anual');
    return './relatorioAnual.pdf';
  }
}

void processarRelatorio(RelatorioFinanceiro relatorio ){
    final path = relatorio.gerar();
    relatorio.enviar(path);
}



void main(List<String> args) {
  // CLASSES ABSTRATAS NAO PODEM SER INSTANCIADAS

  final relatorioFinanceiroMensal = RelatorioFinanceiroMensal();
  final relatorioFinanceiroAnual = RelatorioFinanceiroAnual();

  processarRelatorio(relatorioFinanceiroMensal);
  processarRelatorio(relatorioFinanceiroAnual);
}