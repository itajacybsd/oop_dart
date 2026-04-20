
import 'package:oop_dart/modificadores_de_classe/base/base_exemplo.dart';


// PODEMOS EXTENDER DE VEICULO, MAS NÃO PODEMOS IMPLEMENTAR DE VEICULO
base class Barco extends Veiculo{
  Barco({required super.marca, required super.modelo});
  
}


// base class Barco extends Veiculo{
//   @override
//   String get marca => throw UnimplementedError();

//   @override
//   String get modelo => throw UnimplementedError();
  
//   @override
//   void exibirDados() {
//     // TODO: implement exibirDados
//   }
// }
