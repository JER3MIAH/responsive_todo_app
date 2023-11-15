import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_x_dart_practice/presentation/sign_in.dart';

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isSignIn = useState(true);

    // useEffect(
    //   () {
    //     controller.addListener(() {
    //       text.value = controller.text;
    //     });
    //     return null;
    //   },
    //   [controller],
    // );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(isSignIn.value ? 'Sign in page' : 'Sign up page'),
      ),
      body: Column(
        children: [
          isSignIn.value ? const SignInPage() : const SignUpPage(),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              isSignIn.value = !isSignIn.value;
            },
            child: Text(isSignIn.value
                ? 'Don\'t have an account? Sign up'
                : 'Already have an account? sign in'),
          ),
        ],
      ),
    );
  }
}
