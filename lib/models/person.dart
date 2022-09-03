import 'package:hive/hive.dart';
part 'person.g.dart';

@HiveType(typeId: 0)
class Person {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String uid;
  @HiveField(2)
  final String firstName;
  @HiveField(3)
  final String lastName;
  @HiveField(4)
  final String userName;
  @HiveField(5)
  final String email;
  @HiveField(6)
  final String password;
  @HiveField(7)
  final String avater;
  @HiveField(8)
  final String gender;
  @HiveField(9)
  final String phoneNumber;
  @HiveField(10)
  final String dateOfBirth;
  @HiveField(11)
  final Address address;
  @HiveField(12)
  final Coordinates coordinates;
  Person({
    required this.id,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.password,
    required this.avater,
    required this.gender,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.address,
    required this.coordinates,
  });
}

@HiveType(typeId: 1)
class Address {
  @HiveField(0)
  final String personId;
  @HiveField(1)
  final String city;
  @HiveField(2)
  final String streetName;
  @HiveField(3)
  final String streetAddress;
  @HiveField(4)
  final String zipCode;
  @HiveField(5)
  final String country;
  Address({
    required this.personId,
    required this.city,
    required this.streetName,
    required this.streetAddress,
    required this.zipCode,
    required this.country,
  });
}

@HiveType(typeId: 2)
class Coordinates {
  @HiveField(0)
  final String lat;
  @HiveField(1)
  final String lng;
  Coordinates({
    required this.lat,
    required this.lng,
  });
}
