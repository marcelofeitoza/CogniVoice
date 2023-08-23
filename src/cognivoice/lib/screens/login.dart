import 'package:cognivoice/providers/user.provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:loggerw/loggerw.dart';

class Login extends ConsumerStatefulWidget {
  const Login({
    Key? key,
    required this.context,
    required this.ref,
    required this.logger,
  }) : super(key: key);

  final BuildContext context;
  final WidgetRef ref;
  final Logger logger;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "admin");
  final passwordController = TextEditingController(text: "admin");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 64),
              // Logo
              Image.asset(
                'assets/logo.png',
                width: 200.0,
                height: 100.0,
              ),
              const SizedBox(height: 128),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        widget.logger.e('Login: Email field validation error');
                        return "Please enter your email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    controller: passwordController,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        widget.logger
                            .e('Login: Password field validation error');
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      widget.logger.i('Login: Forgot password button pressed');
                      // ...
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodySmall!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.bodySmall!.fontWeight,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),

              // Login button
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF277AFF),
                      Color(0xFF12307C),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _submitHandler();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _submitHandler() {
    widget.logger.i('Login: Login button pressed');

    if (_formKey.currentState!.validate()) {
      widget.logger.i('Login: Form validated');

      if (passwordController.text == 'admin') {
        widget.logger.i('Login: Login successful');

        ref.read(userProvider).email = emailController.text;
        ref.read(userProvider).password = passwordController.text;

        Navigator.pushNamed(context, "/select-mode");
      } else {
        widget.logger.e('Login: Login failed');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Email or password incorrect',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    widget.logger.i('Login: Disposed');

    super.dispose();
  }
}
