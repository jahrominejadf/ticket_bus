import 'class bus.dart';

class ClassicBus extends Bus {
 ClassicBus(
     {required String busModel,
      required String name,
      required List<String> seater})
     : super(
  busModel: busModel,
  name: name,
  seater: seater,
 );
}