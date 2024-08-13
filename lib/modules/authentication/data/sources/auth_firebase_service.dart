import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_sign_in_request.dart';
import '../../domain/entities/user_signup_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserSignUpRequest user);
  Future<Either> signIn(UserSignInRequest user);
  Future<Either> resetPassword(String email);
  Future<Either> getAges();
  Future<Either> isLogin();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either<String, dynamic>> signup(UserSignUpRequest user) async {
    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      FirebaseFirestore.instance
          .collection('Users')
          .doc(
            userCredential.user!.uid,
          )
          .set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'gender': user.gender,
        'age': user.age,
      });

      return const Right('Signup was successful');
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return const Left('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return const Left('The email address is already in use.');
      } else if (e.code == 'invalid-email') {
        return const Left('The email address is not in a valid format.');
      } else {
        return const Left('An error occurred during signup.');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> signIn(UserSignInRequest user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return const Right('Login was successful');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return const Left('Wrong password provided for that user.');
      } else {
        return const Left('An error occurred during the login.');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      final ageResponse = await FirebaseFirestore.instance.collection('Ages').get();

      return Right(ageResponse.docs);
    } on FirebaseException catch (e) {
      return Left('FirebaseException: ${e.message}');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Please check your email');
    } on FirebaseException catch (e) {
      return Left('FirebaseException: ${e.message}');
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> isLogin() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return const Right(true);
    } else {
      return const Right(false);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return const Left('No user is currently signed in');
      }

      final userData =
          await FirebaseFirestore.instance.collection('Users').doc(user.uid).get().then((value) => value.data());

      return Right(userData);
    } on FirebaseException catch (e) {
      return Left('FirebaseException: ${e.message}');
    } catch (e) {
      return const Left('Something is wrong');
    }
  }
}
