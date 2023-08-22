import 'package:clean_architecture_with_bloc/domain/entities/user_entity.dart';

class UserJson {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  UserJson({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  factory UserJson.fromJson(Map<String, dynamic> json) =>
      UserJson(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        website: json['website'],
      );

  UserEntity toDomain() =>
      UserEntity(id: id,
          name: name,
          username: username,
          email: email,
          phone: phone,
          website: website);


}