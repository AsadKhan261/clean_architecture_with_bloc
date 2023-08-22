import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  const UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
  });

  const UserEntity.empty()
      : id = 0,
        name = '',
        username = '',
        email = '',
        phone = '',
        website = '';

  @override
  List<Object?> get props => [id, name, username, email, phone, website];
}
