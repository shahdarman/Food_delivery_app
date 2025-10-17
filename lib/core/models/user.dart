class User {
  final String email;
  final String? name;
  final String? phoneNumber;

  const User({
    required this.email,
    this.name,
    this.phoneNumber,
  });
} 