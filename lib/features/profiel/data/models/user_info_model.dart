class UserModel {
  final int id;
  final String username;
  final String email;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? avatarUrl;
  final String plan;
  final DateTime? registeredDate;
  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.name,
    this.firstName,
    this.lastName,
    this.role,
    this.avatarUrl,
    required this.plan,
    this.registeredDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      role:
          (json['roles'] != null && json['roles'].isNotEmpty)
              ? json['roles'][0]
              : null,
      avatarUrl: json['avatar_urls'] != null ? json['avatar_urls']['96'] : null,
      plan: json['plan'] ?? 'not subscribed',
      registeredDate:
          json['registered_date'] != null
              ? DateTime.tryParse(json['registered_date'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'name': name,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'avatar_url': avatarUrl,
      'plan': plan,
      'registered_date': registeredDate?.toIso8601String(),
    };
  }
}
