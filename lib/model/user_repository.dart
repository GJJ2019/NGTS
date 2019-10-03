import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository extends Equatable {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInUsingGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
    } else {
      return null;
    }
  }

  // Future<bool> isSignIn() => _googleSignIn.isSignedIn();
  Future<bool> isSignIn() {
    return Future.delayed(
        Duration(seconds: 3), () => _googleSignIn.isSignedIn());
  }

  Future<GoogleSignInAccount> signOut() {
    _firebaseAuth.signOut();
    return _googleSignIn.signOut();
  }

  @override
  List<Object> get props => null;
}
