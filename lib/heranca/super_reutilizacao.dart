class RelatorioFinanceiroBase{
  void gerarRelatorio(){
    print('Gerando relatorio base com cabeçalho e outras formulas basicar');
  }
}

class RelatorioFinanceiroMensal extends RelatorioFinanceiroBase {

  @override
  void gerarRelatorio() {
    // acessando os métodos da classe pai(super)
    super.gerarRelatorio();
    print('Adicionando dados mensais ao relatorio');
  }

  void adicionarAlgo() {
    // chamando o metodo da classe pai, sem exigencia de sobrescrita com @override
    super.gerarRelatorio();
  }
}

void main(List<String> args) {
  final relatorio = RelatorioFinanceiroMensal();
  relatorio.gerarRelatorio();
}