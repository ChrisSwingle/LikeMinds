import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:like_minds/main.dart';
import 'package:like_minds/screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserAuthStatus();
  }

  Future<void> _checkUserAuthStatus() async {
    try {
      AuthSession session = await Amplify.Auth.fetchAuthSession();
      if (session.isSignedIn) {
        bool hasProfile = await _checkIfUserHasProfile();
        if (hasProfile) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
        }
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      }
    } catch (e) {
      print('Error checking auth status: $e');
    }
  }

  Future<bool> _checkIfUserHasProfile() async {
    try {
      AuthUser user = await Amplify.Auth.getCurrentUser();
      String userId = user.userId;
      // Query your backend to check if the user has a profile
      String graphQLDocument = '''
      query GetProfile(\$id: ID!) {
        getProfile(id: \$id) {
          id
        }
      }
      ''';

      var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document: graphQLDocument,
          variables: {'id': userId},
        ),
      );

      var response = await operation.response;
      var data = response.data;

      if (data == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print('Error checking if user has profile: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
