class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstname: json['first_name'] ?? 'First Name',
      lastname: json['last_name'] ?? 'Last Name',
      avatar:
          json['avatar'] ??
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.avatar.com%2Fpandorapedia%2Fneytiri&psig=AOvVaw3F3ZU0ZgZaSYi5KHwgXOnI&ust=1755498878840000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCMjA7oqdkY8DFQAAAAAdAAAAABAE',
    );
  }
}
