import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task/constant/colors.dart';
import 'package:scube_task/constant/image.dart';
import 'package:scube_task/widget/primary_button.dart';

final passwordObsecure = StateProvider<bool>((Ref ref) {
  return true;
});

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.primaryColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 140),

                    // Logo
                    SizedBox(
                      height: 98,
                      width: 96,
                      child: Image.asset(AppImage.scube),
                    ),

                    const Text(
                      'SCUBE',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),

                    const Text(
                      'Control & Monitoring System',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),

                    const SizedBox(height: 24),


                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Form(
                            key: _globalKey,
                            child: SingleChildScrollView(
                              keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // username
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Username",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // password
                                  Consumer(
                                    builder: (context, ref, _) {
                                      final isObscure =
                                      ref.watch(passwordObsecure);
                                      return TextFormField(
                                        obscureText: isObscure,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              isObscure
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                            ),
                                            onPressed: () {
                                              ref
                                                  .read(passwordObsecure.notifier)
                                                  .state = !isObscure;
                                            },
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          ),
                                        ),
                                      );
                                    },
                                  ),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Forget Password?',
                                        style: TextStyle(
                                          color: AppColors.textButton,
                                          decoration:
                                          TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),

                                  PrimaryButton(
                                    text: 'Login',
                                    onPressed: () {
                                      context.go('/CupertinoSegmanted');
                                    },
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have any account?"),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Register Now',
                                          style: TextStyle(
                                            color:
                                            AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}
