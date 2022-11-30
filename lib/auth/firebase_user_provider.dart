import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RoverLinkFirebaseUser {
  RoverLinkFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

RoverLinkFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RoverLinkFirebaseUser> roverLinkFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RoverLinkFirebaseUser>(
      (user) {
        currentUser = RoverLinkFirebaseUser(user);
        return currentUser!;
      },
    );
