import 'package:board_game_friends/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  UserService();

  static CollectionReference<User> userRef =
      FirebaseFirestore.instance.collection('Users').withConverter(
          fromFirestore: (snapshots, __) => User.fromMap(
                data: snapshots.data()!,
                uid: snapshots.id,
              ),
          toFirestore: (user, _) => user.toMap());

  static Future<void> createUser(User user) async {
    try {
      await userRef.doc(user.uid).set(user);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateUser(User user) async {
    try {
      await userRef.doc(user.uid).set(user);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> deleteUser(User user) async {
    try {
      await userRef.doc(user.uid).delete();
    } catch (e) {
      rethrow;
    }
  }

  static Stream<List<User?>> getUsers() {
    return userRef.snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  static Stream<User?> getUser(String uid) {
    return userRef.doc(uid).snapshots().map((snapshot) => snapshot.data()!);
  }

  static Future<User?> getUserById(String uid) async {
    try {
      final user = await userRef.doc(uid).get();
      return user.data()!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<User?> getUserByEmail(String email) async {
    try {
      final querySnapshot =
          await userRef.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isEmpty) {
        throw Exception('User not found');
      }
      return querySnapshot.docs.first.data();
    } catch (e) {
      rethrow;
    }
  }
}
