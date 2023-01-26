// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rackathon/common/exception.dart';

class FirebaseService {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future<QuerySnapshot> doesUserExist(String userID) async {
    QuerySnapshot query = await firebase
        .collection('users')
        .where('user_id', isEqualTo: userID)
        .get();
    return query;
  }

  Future authenticateUser(String userId, String password) async {
    bool returnValue = false;
    await firebase
        .collection('users')
        .where('user_id', isEqualTo: userId)
        .get()
        .then((value) {
      if (value.size != 0) {
        if (value.docs[0].data()['password'] == password) {
          returnValue = true;
        } else {
          throw AuthException("The password does not match");
        }
      } else {
        throw AuthException("User does not exist");
      }
    });

    return returnValue;
  }

  Future<bool> resetPassword(String userId, String password) async {
    bool returnValue = false;
    await firebase
        .collection('users')
        .where('user_id', isEqualTo: userId)
        .get()
        .then((value) {
      if (value.size != 0) {
        firebase
            .collection('users')
            .doc(value.docs[0].id)
            .update({'password': password});
        returnValue = true;
      } else {
        throw AuthException("User does not exist");
      }
    });

    return returnValue;
  }
}
