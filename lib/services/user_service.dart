import 'package:board_game_friends/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  UserService._();

  static final CollectionReference<User> _userRef =
      FirebaseFirestore.instance.collection('Users').withConverter(
          fromFirestore: (snapshots, __) => User.fromMap(
                data: snapshots.data()!,
                uid: snapshots.id,
              ),
          toFirestore: (user, _) => user.toMap());

  static Future<void> createUser(User user) async {
    try {
      await _userRef.doc().set(user);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> updateUser(User user) async {
    try {
      await _userRef.doc(user.uid).set(user);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> deleteUser(User user) async {
    try {
      await _userRef.doc(user.uid).delete();
    } catch (e) {
      rethrow;
    }
  }

  static Stream<List<User>> getUsers() {
    return _userRef.snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
        );
  }

  static Stream<User> getUser(String uid) {
    return _userRef.doc(uid).snapshots().map((snapshot) => snapshot.data()!);
  }

  static Future<User> getUserById(String uid) async {
    try {
      final user = await _userRef.doc(uid).get();
      return user.data()!;
    } catch (e) {
      rethrow;
    }
  }

  static Future<User> getUserByEmail(String email) async {
    try {
      final user = await _userRef.where('email', isEqualTo: email).get();
      return user.docs.first.data();
    } catch (e) {
      rethrow;
    }
  }
}
