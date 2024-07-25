import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/models/user_signup_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserSignUpRequest user);
  Future<Either> getAges();
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
}
