import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:local_notification_flutter/Core/Constants/Database/database_constants.dart';
import 'package:local_notification_flutter/Domain/Repository/LocalAuthRepo/local_auth_repo.dart';
import 'package:local_notification_flutter/Models/ErrorResponse/error_response.dart';
import 'package:local_notification_flutter/Models/UserModel/user_model.dart';

import 'firebase_auth_repo.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final _firebaseAuth = GetIt.I<FirebaseAuth>();
  final _firestore = GetIt.I<FirebaseFirestore>();
  final _localAuth = GetIt.I<LocalAuthRepository>();

  @override
  Future<(bool, ErrorResponse?)> signUpUser({
    required email,
    required password,
    required name,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// uid won't be null while there is FirebaseAuthException catch (e)
      final uid = userCredential.user!.uid;

      await _firestore.collection(DataBaseConstants.users).doc(uid).set({
        DataBaseConstants.name: name,
        DataBaseConstants.email: email,
        DataBaseConstants.createdAt: DateTime.now(),
      });

      ///registering user in the local
      _localAuth.registerUser();

      return (true, null);

      ///
    } on FirebaseAuthException catch (e) {
      return (
        false,
        ErrorResponse(
            statusCode: 404,
            message: switch (e.code) {
              DataBaseConstants.weekPassword => 'The Password is too week',
              DataBaseConstants.emailAlreadyInUse =>
                'The email is already in use',
              _ => 'Sign up failed, try again later'
            }),
      );
    } catch (e) {
      log(e.toString());
      return (false, null);
    }
  }

  @override
  Future<(bool, ErrorResponse?)> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCredential.user!.uid;

      final userDoc =
          await _firestore.collection(DataBaseConstants.users).doc(uid).get();

      if (userDoc.exists) {
        ///registering user in the local
        _localAuth.registerUser();

        ///
        return (true, null);

        ///
      } else {
        return (
          false,
          const ErrorResponse(
              statusCode: 404,
              message: 'No user found on the provided credentials')
        );
      }

      ///
    } on FirebaseAuthException catch (e) {
      return (
        false,
        ErrorResponse(
            statusCode: 404,
            message: switch (e.code) {
              DataBaseConstants.userNotFound =>
                'No user available in the provider credentials',
              DataBaseConstants.wrongPassword => 'Wrong password provided',
              _ =>
                'login failed, please sign up if you did not create an account yet'
            }),
      );
    } catch (e) {
      log(e.toString());
      return (false, null);
    }
  }

  @override
  Future<UserModel?> getUserProfile() async {
    try {
      final userId = _firebaseAuth.currentUser?.uid;
      if (userId != null) {
        final userData = await _firestore
            .collection(DataBaseConstants.users)
            .doc(userId)
            .get();
        final extracted = userData.data() as Map<String, dynamic>;
        return UserModel.fromJson(extracted);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
