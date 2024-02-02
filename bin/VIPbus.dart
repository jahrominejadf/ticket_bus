import 'class bus.dart';
class VipBus extends Bus {
  VipBus(
      {required String busModel,
        required String name,
        required List<String> seater})
      : super(
    busModel: busModel,
    name: name,
    seater: seater,
  );
}