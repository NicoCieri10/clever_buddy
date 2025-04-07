/// {@template user}
/// Class for User model
/// {@endtemplate}
class User {
  /// {@macro user}
  const User({
    required this.id,
    required this.name,
    required this.lastname,
  });

  /// Method used to get a User object from a Map
  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'] as String? ?? '',
        name: map['name'] as String? ?? '',
        lastname: map['lastname'] as String? ?? '',
      );

  /// User identification key
  final String id;

  /// User name
  final String name;

  /// User lastname
  final String lastname;

  /// Method used to get a map of the user
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'lastname': lastname,
      };
}
