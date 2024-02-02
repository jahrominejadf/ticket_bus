import 'dart:io';
import 'class operation.dart';

void main() {
  print("""
     please select number
     1)allocate bus ticket
     2)allocate Trip
     3)show Trip
     4)reservation
     5)buy ticket
     6)cancel ticket
     7)trip report
     8)exit""");
  Operation inc = Operation();
  while (true) {
    String? inputNumber = stdin.readLineSync();
    int choice = int.parse(inputNumber!);
    switch (choice) {
      case 1:
        inc.allocateBus();
        break;
      case 2:
        inc.allocateTrip();
        break;
      case 3:
        inc.showTrip();
        break;
      case 4:
        inc.reservation();
        break;
      case 5:
        inc.buy();
        break;
      case 6:
        inc.cancel();
        break;
      case 7:
        inc.report();
        break;
      case 8:
        print('end');
        exit(9);
      default:
        print("Error! Invalid number.");
    }
  }
}
