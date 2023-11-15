import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailcontroller = useTextEditingController();
    final passwordController = useTextEditingController();

    return Column(
      children: [
        TextField(
          controller: emailcontroller,
        ),
        TextField(
          controller: passwordController,
        )
      ],
    );
  }
}

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailcontroller = useTextEditingController();
    final passwordController = useTextEditingController();

    return Column(
      children: [
        TextField(
          controller: nameController,
        ),
        TextField(
          controller: emailcontroller,
        ),
        TextField(
          controller: passwordController,
        )
      ],
    );
  }
}
