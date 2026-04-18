void main(List<String> args) {
  // com o uso do late, ele só será executado na primeira vez em que 
  // ela for utilizada
  //veja o que acontece nos exemplos sem e com no final deste arquivo
  late final temperatura = lerTemperatura();

  print('ola ita');
  print('vou te mostra a tempratura');
  print('a temperatura é $temperatura');
  
}

String lerTemperatura() {
  print('Lendo temperatura');
  return '30 graus';
}

// EXECUTANDO SEM O LATE
// final temperatura = lerTemperatura();
/** RESULTADO:
 * 
Lendo temperatura     <-------
ola ita
vou te mostra a tempratura
a temperatura é 30 graus
 */


// EXECUTANDO COM O LATE
// late final temperatura = lerTemperatura();
/** RESULTADO:
 * 

ola ita
vou te mostra a tempratura
Lendo temperatura        <------
a temperatura é 30 graus
 */



