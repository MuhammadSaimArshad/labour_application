// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:labour_app/screens/contrecter/contracter_home.dart';

// var loading;
// var update;
// var auth;
// GoogleSignIn googleSignIn = GoogleSignIn();
// User? user;
// Future signInwithgoogle(BuildContext context) async {
//   GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

//   if (googleSignInAccount != null) {
//     GoogleSignInAuthentication googleSignInAuthentication =
//         await googleSignInAccount.authentication;
//     AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken);

//     try {
//       UserCredential userCredential =
//           await auth.signInWithCredential(credential);
//       if (userCredential.user != null) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Contracterhome(),
//             ));

//         loading = false;
//         update();
//       }
//       Fluttertoast.showToast(
//         msg: "Account Created Successfully",
//         backgroundColor: Colors.black,
//         textColor: Colors.white,
//         gravity: ToastGravity.BOTTOM,
//         toastLength: Toast.LENGTH_SHORT,
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'account-exists-with-different-credential') {
//         Fluttertoast.showToast(
//             msg: 'The account already exists with a different credential',
//             backgroundColor: Colors.black,
//             textColor: Colors.white,
//             gravity: ToastGravity.BOTTOM,
//             toastLength: Toast.LENGTH_SHORT);
//       } else if (e.code == 'invalid-credential') {
//         Fluttertoast.showToast(
//             msg: 'Error occurred while accessing credentials. Try again',
//             backgroundColor: Colors.black,
//             textColor: Colors.white,
//             gravity: ToastGravity.BOTTOM,
//             toastLength: Toast.LENGTH_SHORT);
//       }

//       loading = false;
//       update();
//     }
//   }
//   return user;
// }
