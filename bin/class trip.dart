import 'class bus.dart';
class Trip {
  String origin;
  String destination;
  double price;
  final Bus bus;
  Trip(
      {required this.origin,
        required this.destination,
        required this.price,
        required this.bus});
}
