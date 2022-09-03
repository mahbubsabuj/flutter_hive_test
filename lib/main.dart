// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hive_examples/models/person.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(CoordinatesAdapter());
  await Hive.openBox<Person>('person_database');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _userBox;
  int count = 0;

  String generateRandomString() {
    int randomRange = Random().nextInt(100);
    List<int> randomIntegers =
        List<int>.generate(randomRange, (int _) => Random().nextInt(26) + 65);
    String randomString = String.fromCharCodes(randomIntegers);
    return randomString;
  }

  Person getRandomFakePersonData() {
    final Address address = Address(
      personId: generateRandomString(),
      city: generateRandomString(),
      streetName: generateRandomString(),
      streetAddress: generateRandomString(),
      zipCode: generateRandomString(),
      country: generateRandomString(),
    );
    final Coordinates coordinates = Coordinates(
      lat: Random().nextDouble().toString(),
      lng: Random().nextDouble().toString(),
    );
    final Person person = Person(
        id: address.personId,
        uid: generateRandomString(),
        firstName: generateRandomString(),
        lastName: generateRandomString(),
        userName: generateRandomString(),
        email: '${generateRandomString()}@gmail.com',
        password: generateRandomString(),
        avater: generateRandomString(),
        gender: Random().nextBool() ? 'Male' : 'Female',
        phoneNumber: Random().nextInt(100000).toString(),
        dateOfBirth: DateTime.now().toString(),
        address: address,
        coordinates: coordinates);
    return person;
  }

  void insert() {
    DateTime start = DateTime.now();
    for (int i = 1; i <= 300000; ++i) {
      final Person person = getRandomFakePersonData();
      _userBox.add(person);
      if (i % 1000 == 0) {
        debugPrint('count : $i');
      }
    }
    DateTime end = DateTime.now();
    debugPrint("Time Taken : ${end.difference(start).inSeconds}");
    // debugPrint(_userBox.getAt(100).firstName);
  }

  @override
  void initState() {
    debugPrint("Called Initstate");
    _userBox = Hive.box<Person>('person_database');
    insert();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hive Test"),
        ),
        body: Center(
          child: Text("inserted $count"),
        ),
      ),
    );
  }
}
