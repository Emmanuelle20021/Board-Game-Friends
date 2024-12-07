import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:board_game_friends/models/user.dart';
import 'package:board_game_friends/services/user_service.dart';

void main() {
  late FakeFirebaseFirestore fakeFirestore;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    UserService.userRef = fakeFirestore.collection('Users').withConverter<User>(
          fromFirestore: (snapshots, __) => User.fromMap(
            data: snapshots.data()!,
            uid: snapshots.id,
          ),
          toFirestore: (user, _) => user.toMap(),
        );
  });

  group('UserService tests', () {
    final sampleUser = User(
      uid: '1',
      email: 'john@example.com',
      username: 'john123',
      name: 'John',
      lastName: 'Doe',
      birthDate: DateTime(1990, 5, 20),
      country: 'USA',
      city: 'New York',
      state: 'NY',
      rank: 4.5,
      favGames: ['Catan', 'Carcassonne'],
      description: 'Loves board games!',
      bggUser: 'johnbgg',
    );

    test('createUser adds a user to Firestore', () async {
      await UserService.createUser(sampleUser);

      final snapshot = await fakeFirestore.collection('Users').get();
      expect(snapshot.docs.length, 1);
      expect(snapshot.docs.first.data(), sampleUser.toMap());
    });

    test('getUserById retrieves a specific user by ID', () async {
      await UserService.createUser(sampleUser);

      final retrievedUser = await UserService.getUserById('1');
      expect(retrievedUser, sampleUser);
    });

    test('updateUser updates the user data in Firestore', () async {
      await UserService.createUser(sampleUser);

      final updatedUser = sampleUser.copyWith(name: 'John Updated');
      await UserService.updateUser(updatedUser);

      final retrievedUser = await UserService.getUserById('1');
      expect(retrievedUser?.name, 'John Updated');
    });

    test('deleteUser removes a user from Firestore', () async {
      await UserService.createUser(sampleUser);

      await UserService.deleteUser(sampleUser);

      final snapshot = await fakeFirestore.collection('Users').get();
      expect(snapshot.docs.isEmpty, true);
    });

    test('getUsers retrieves all users as a stream', () async {
      final user1 = sampleUser.copyWith(uid: '1');
      final user2 = sampleUser.copyWith(uid: '2', email: 'jane@example.com');

      await UserService.createUser(user1);
      await UserService.createUser(user2);

      final usersStream = UserService.getUsers();
      final users = await usersStream.first;

      expect(users.length, 2);
      expect(users.any((user) => user?.uid == '1'), true);
      expect(users.any((user) => user?.uid == '2'), true);
    });

    test('getUserByEmail retrieves a user by email', () async {
      await UserService.createUser(sampleUser);

      final retrievedUser =
          await UserService.getUserByEmail('john@example.com');
      expect(retrievedUser, sampleUser);
    });

    test('getUserByEmail throws an error if no user is found', () async {
      expect(
        () async => await UserService.getUserByEmail('notfound@example.com'),
        throwsA(isA<Exception>()),
      );
    });

    test('getUser retrieves a specific user as a stream', () async {
      await UserService.createUser(sampleUser);

      final userStream = UserService.getUser('1');
      final retrievedUser = await userStream.first;

      expect(retrievedUser, sampleUser);
    });
  });
}
