import 'class bus.dart';
import 'dart:io';
import 'classicBus.dart';
import 'VIPbus.dart';
import 'class trip.dart';

class Operation {
  List<Bus> listOfBus = [];
  List<Trip> listOfTrip = [];

  void allocateBus() {
    print('Please input bus name:');
    String? name = stdin.readLineSync();
    print('Bus model:');
    print("""Press 1 for a classic bus
Press 2 for a VIP bus""");
    String? model = stdin.readLineSync();
    if (model == '1') {
      listOfBus.add(ClassicBus(
          busModel: 'classic',
          name: name!,
          seater: List.generate(
              44, (index) => (index < 10) ? '0${index + 1}' : '${index + 1}')));
    } else if (model == '2') {
      listOfBus.add(VipBus(
          busModel: 'vip',
          name: name!,
          seater: List.generate(
              30, (index) => (index < 9) ? '0${index + 1}' : '${index + 1}')));
    }
    print('Successfully allocated bus ticket.');
  }

  void allocateTrip() {
    print("""Press 1 for a classic trip
Press 2 for a VIP trip""");
    String? model = stdin.readLineSync();
    if (model == '1') {
      List<Bus> classicBus =
      listOfBus.where((bus) => bus.busModel == 'classic').toList();
      for (int i = 0; i < classicBus.length; i++) {
        print('${i + 1}) ${classicBus[i].name} ${classicBus[i].busModel}');
      }
      print('Please enter your bus:');
      String? inputRow = stdin.readLineSync();
      int input = int.parse(inputRow!);
      print(' select origin---> ');
      String? origin = stdin.readLineSync();
      print('select destination --->');
      String? destination = stdin.readLineSync();
      print('please input ticket price ');
      String? price = stdin.readLineSync();
      double inputPrice = double.parse(price!);
      listOfTrip.add(Trip(
          origin: origin!,
          destination: destination!,
          price: inputPrice,
          bus: classicBus[input - 1]));
    } else if (model == '2') {
      List<Bus> vipBus =
      listOfBus.where((bus) => bus.busModel == 'vip').toList();
      for (int i = 0; i < vipBus.length; i++) {
        print('${i + 1}) ${vipBus[i].name} ${vipBus[i].busModel}');
      }
      print('Please enter your bus:');
      String? inputRow = stdin.readLineSync();
      int input = int.parse(inputRow!);
      print(' select origin---> ');
      String? origin = stdin.readLineSync();
      print('select destination --->');
      String? destination = stdin.readLineSync();
      print('please input ticket price ');
      String? price = stdin.readLineSync();
      double inputPrice = double.parse(price!);
      listOfTrip.add(Trip(
          origin: origin!,
          destination: destination!,
          price: inputPrice,
          bus: vipBus[input - 1]));
    }
    print('successfully creat trip');
  }

  void showTrip() {
    for (int i = 0; i < listOfTrip.length; i++) {
      print('${i + 1}: ${listOfTrip[i].destination} ${listOfTrip[i].price}'
          ' ${listOfTrip[i].bus.name} ${listOfTrip[i].bus.busModel}');
    }
  }

  void reservation() {
    print('List of available trips:');
    for (int i = 0; i < listOfTrip.length; i++) {
      print('${i + 1}: ${listOfTrip[i].destination} ${listOfTrip[i].price}'
          ' ${listOfTrip[i].bus.name} ${listOfTrip[i].bus.busModel}');
    }

    print('Please select a trip by entering its number:');
    String? tripInp = stdin.readLineSync();
    int tripNumber = int.parse(tripInp!);

    if (tripNumber >= 1 && tripNumber <= listOfTrip.length) {
      int numberSeat = listOfTrip[tripNumber - 1].bus.seater.length;

      print(
          'Available seats for the selected trip (${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel}):');
      int seatsPerRow = (numberSeat == 44) ? 4 : 3;
      for (int i = 0; i < numberSeat; i++) {
        if (i % seatsPerRow == 0 && i != 0) {
          print('');
        }
        String seatStatus = (listOfTrip[tripNumber - 1].bus.seater[i] == 'rr')
            ? 'rr'
            : listOfTrip[tripNumber - 1].bus.seater[i];
        stdout.write('$seatStatus\t');
      }
      print('');

      print('Please enter the seat number you want to reserve:');
      String? seatNumberInput = stdin.readLineSync();
      int seatNumber = int.parse(seatNumberInput!);

      if (seatNumber >= 1 && seatNumber <= numberSeat) {
        if (listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] != 'rr') {
          listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] = 'rr';
          print(
              'Seat ${seatNumber} on ${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel} has been successfully reserved.');
        } else {
          print(
              'Error! Seat ${seatNumber} on ${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel} is already reserved.');
        }
      } else {
        print('Error! Invalid seat number.');
      }
    } else {
      print('Error! Invalid trip number.');
    }
  }

  void buy() {
    print('List of available trips:');
    for (int i = 0; i < listOfTrip.length; i++) {
      print('${i + 1}: ${listOfTrip[i].destination} ${listOfTrip[i].price}'
          ' ${listOfTrip[i].bus.name} ${listOfTrip[i].bus.busModel}');
    }

    print('Please select a trip by entering its number:');
    String? tripInp = stdin.readLineSync();
    int tripNumber = int.parse(tripInp!);

    if (tripNumber >= 1 && tripNumber <= listOfTrip.length) {
      int numberSeat = listOfTrip[tripNumber - 1].bus.seater.length;

      print(
          'Available seats for the selected trip (${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel}):');
      int seatsPerRow = (numberSeat == 44) ? 4 : 3;
      for (int i = 0; i < numberSeat; i++) {
        if (i % seatsPerRow == 0 && i != 0) {
          print('');
        }
        String seatStatus = (listOfTrip[tripNumber - 1].bus.seater[i] == 'rr')
            ? 'rr'
            : listOfTrip[tripNumber - 1].bus.seater[i];
        stdout.write('$seatStatus\t');
      }
      print('');

      print('Please enter the seat number you want to buy:');
      String? seatNumberInput = stdin.readLineSync();
      int seatNumber = int.parse(seatNumberInput!);

      if (seatNumber >= 1 && seatNumber <= numberSeat) {
        if (listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] != 'rr' &&
            listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] != 'bb') {
          listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] = 'bb';
          print(
              'Seat ${seatNumber} on ${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel} has been successfully bought.');
        } else {
          print(
              'Error! Seat ${seatNumber} on ${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel} is already reserved or bought.');
        }
      } else {
        print('Error! Invalid seat number.');
      }
    } else {
      print('Error! Invalid trip number.');
    }
  }

  void cancel() {
    print('List of available trips:');
    for (int i = 0; i < listOfTrip.length; i++) {
      print('${i + 1}: ${listOfTrip[i].destination} ${listOfTrip[i].price}'
          ' ${listOfTrip[i].bus.name} ${listOfTrip[i].bus.busModel}');
    }

    print('Please select a trip by entering its number:');
    String? tripInp = stdin.readLineSync();
    int tripNumber = int.parse(tripInp!);

    if (tripNumber >= 1 && tripNumber <= listOfTrip.length) {
      int numberSeat = listOfTrip[tripNumber - 1].bus.seater.length;

      print(
          'Available seats for the selected trip (${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel}):');
      int seatsPerRow = (numberSeat == 44) ? 4 : 3;
      for (int i = 0; i < numberSeat; i++) {
        if (i % seatsPerRow == 0 && i != 0) {
          print('');
        }
        String seatStatus = (listOfTrip[tripNumber - 1].bus.seater[i] == 'rr')
            ? 'rr'
            : listOfTrip[tripNumber - 1].bus.seater[i];
        stdout.write('$seatStatus\t');
      }
      print('');

      print('Please enter the seat number you want to cancel:');
      String? seatNumberInput = stdin.readLineSync();
      int seatNumber = int.parse(seatNumberInput!);

      if (seatNumber >= 1 && seatNumber <= numberSeat) {
        if (listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] == 'rr' ||
            listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] == 'bb') {
          listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] =
          (listOfTrip[tripNumber - 1].bus.seater[seatNumber - 1] == 'rr')
              ? '${seatNumber}'
              : 'bb';
          print(
              'Seat ${seatNumber} on ${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel} has been successfully canceled.');
        } else {
          print(
              'Error! Seat ${seatNumber} on ${listOfTrip[tripNumber - 1].bus.name} - ${listOfTrip[tripNumber - 1].bus.busModel} is not reserved or bought.');
        }
      } else {
        print('Error! Invalid seat number.');
      }
    } else {
      print('Error! Invalid trip number.');
    }
  }

  void report() {}
}