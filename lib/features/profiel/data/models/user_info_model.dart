class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String whatsapp;
  final String address;
  final String country;
  final String city;
  final String street;
  final String building;
  final String apartment;
  final String floor;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.whatsapp,
    required this.address,
    required this.country,
    required this.city,
    required this.street,
    required this.building,
    required this.apartment,
    required this.floor,
  });

  Map<String, String> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'whatsapp': whatsapp,
      'address': address,
      'country': country,
      'city': city,
      'street': street,
      'building': building,
      'apartment': apartment,
      'floor': floor,
    };
  }

  factory UserModel.fromMap(Map<String, String> map) {
    return UserModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      address: map['address'] ?? '',
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      street: map['street'] ?? '',
      building: map['building'] ?? '',
      apartment: map['apartment'] ?? '',
      floor: map['floor'] ?? '',
    );
  }
}
