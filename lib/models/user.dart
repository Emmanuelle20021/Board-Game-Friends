class User {
  final String? uid;
  final String email;
  final String username;
  final String name;
  final String lastName;
  final DateTime birthDate;
  final String country;
  final String city;
  final String state;
  final double rank;
  final List<String> favGames;
  final String description;
  final String bggUser;

  User({
    required this.email,
    required this.username,
    required this.name,
    required this.lastName,
    required this.birthDate,
    required this.country,
    required this.city,
    required this.state,
    required this.rank,
    required this.favGames,
    required this.description,
    required this.bggUser,
    required this.uid,
  });

  factory User.fromMAP({required Map<String, dynamic> data, String? uid}) {
    return User(
      email: data['email'],
      username: data['username'],
      name: data['name'],
      lastName: data['lastName'],
      birthDate: data['birthDate'],
      country: data['country'],
      city: data['city'],
      state: data['state'],
      rank: data['rank'],
      favGames: data['favGames'],
      description: data['description'],
      bggUser: data['bggUser'],
      uid: uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'name': name,
      'lastName': lastName,
      'birthDate': birthDate,
      'country': country,
      'city': city,
      'state': state,
      'rank': rank,
      'favGames': favGames,
      'description': description,
      'bggUser': bggUser,
    };
  }

  @override
  String toString() {
    return 'User{email: $email, username: $username, name: $name, lastName: $lastName, birthDate: $birthDate, country: $country, city: $city, state: $state, rank: $rank, favGames: $favGames, description: $description, bggUser: $bggUser, uid: $uid}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          username == other.username &&
          name == other.name &&
          lastName == other.lastName &&
          birthDate == other.birthDate &&
          country == other.country &&
          city == other.city &&
          state == other.state &&
          rank == other.rank &&
          favGames == other.favGames &&
          description == other.description &&
          bggUser == other.bggUser &&
          uid == other.uid;

  @override
  int get hashCode => uid.hashCode;

  User copyWith({
    String? email,
    String? username,
    String? name,
    String? lastName,
    DateTime? birthDate,
    String? country,
    String? city,
    String? state,
    double? rank,
    List<String>? favGames,
    String? description,
    String? bggUser,
    String? uid,
  }) {
    return User(
      email: email ?? this.email,
      username: username ?? this.username,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      country: country ?? this.country,
      city: city ?? this.city,
      state: state ?? this.state,
      rank: rank ?? this.rank,
      favGames: favGames ?? this.favGames,
      description: description ?? this.description,
      bggUser: bggUser ?? this.bggUser,
      uid: uid ?? this.uid,
    );
  }

  User copyWithMap(Map<String, dynamic> data) {
    return User(
      email: data['email'] ?? email,
      username: data['username'] ?? username,
      name: data['name'] ?? name,
      lastName: data['lastName'] ?? lastName,
      birthDate: data['birthDate'] ?? birthDate,
      country: data['country'] ?? country,
      city: data['city'] ?? city,
      state: data['state'] ?? state,
      rank: data['rank'] ?? rank,
      favGames: data['favGames'] ?? favGames,
      description: data['description'] ?? description,
      bggUser: data['bggUser'] ?? bggUser,
      uid: data['uid'] ?? uid,
    );
  }

  User copyWithUser(User user) {
    return User(
      email: user.email,
      username: user.username,
      name: user.name,
      lastName: user.lastName,
      birthDate: user.birthDate,
      country: user.country,
      city: user.city,
      state: user.state,
      rank: user.rank,
      favGames: user.favGames,
      description: user.description,
      bggUser: user.bggUser,
      uid: user.uid,
    );
  }

  User copyWithUid(String uid) {
    return User(
      email: email,
      username: username,
      name: name,
      lastName: lastName,
      birthDate: birthDate,
      country: country,
      city: city,
      state: state,
      rank: rank,
      favGames: favGames,
      description: description,
      bggUser: bggUser,
      uid: uid,
    );
  }
}
