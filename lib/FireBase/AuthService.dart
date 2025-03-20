import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthService {
  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  /// creat sign up User
  /// creat sign up Rented
  ///

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////


  //////////////////////////////////////////////////////////////////////////////
  //

  // creat sign up User

  //
  //////////////////////////////////////////////////////////////////////////////
  static Future<Authprocess> registerUser(String email, String pass) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      // FirebaseFirestore.instance.collection('userCollection').
      // doc(credential.user!.uid).
      // set({
      //   'Emai': credential.user!.email,
      //   'age': age,
      // });
      return Authprocess(isValid: true);
    } on FirebaseAuthException catch (e) {
      String msg = "error";
      if (e.code == 'weak-password') {
        msg = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        msg = "The account already exists for that email.";
      } else if (e.code == 'invalid-email') {
        msg = "Invalid email address";
      }

      return Authprocess(isValid: false, errorMsg: msg);
    } catch (e) {
      print(e);
    }
    return Authprocess(isValid: false, errorMsg: "error default");
  }

  //////////////////////////////////////////////////////////////////////////////
  //

  // creat sign up Rented

  //
  //////////////////////////////////////////////////////////////////////////////
  static Future<Authprocess> registerRented(String email, String pass,
      String business_Name, int phone) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,

      );
      FirebaseFirestore.instance.collection('Rented').
      doc(credential.user!.uid).
      set({
        'Email': credential.user!.email,
        'BusinessName': business_Name,
        'Phone': phone,
      });

      return Authprocess(isValid: true);
    } on FirebaseAuthException catch (e) {
      String msg = "error";
      if (e.code == 'weak-password') {
        msg = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        msg = "The account already exists for that email.";
      } else if (e.code == 'invalid-email') {
        msg = "Invalid email address";
      }

      return Authprocess(isValid: false, errorMsg: msg);
    } catch (e) {
      print(e);
    }
    return Authprocess(isValid: false, errorMsg: "error default");
  }

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
////
  ///
//Singin()
  static Future<Authprocess> Login(String email, String pass) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return Authprocess(
        isValid: true,
      );
    } on FirebaseAuthException catch (e) {
      String msg = "error";
      if (e.code == 'user-not-found') {
        msg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        msg = 'Wrong password provided for that user.';
      }
      return Authprocess(isValid: false, errorMsg: msg);
    } catch (e) {
      print(e);
    }
    return Authprocess(isValid: false, errorMsg: "error default");
  }


///////////////////////////////////////////////////////////////////////////////
  ///
  ///  Google
  ///
///////////////////////////////////////////////////////////////////////////////
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
  ///
  ///  Facebook
  ///
///////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////
  ///
  ///  Twitter
  ///
///////////////////////////////////////////////////////////////////////////////

  Future<UserCredential> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = new TwitterLogin(
        apiKey: '<your consumer key>',
        apiSecretKey:' <your consumer secret>',
        redirectURI: '<your_scheme>://'
    );

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
  }
}







class Authprocess {
  bool isValid;
  String errorMsg;

  Authprocess({required this.isValid, this.errorMsg = ""});
}
