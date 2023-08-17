import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              const SizedBox(height: 70),
              // Logo
              Image.asset(
                'assets/logo.png',
                width: 200.0,
                height: 100.0,
              ),
              const SizedBox(height: 120),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Email textfield
                  TextFormField(
                    autofocus: true,
                    controller: emailController,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
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
                  // Password textfield
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    autocorrect: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
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
                  // Forgot password
                  TextButton(
                    onPressed: () {
                      // Action for "Esqueci minha senha"
                    },
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        color: Colors.blue,
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
                      Color(0xFF277AFF), // #277AFF
                      Color(0xFF12307C), // #12307C
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (emailController.text == 'admin' &&
                          passwordController.text == 'admin') {
                        Navigator.pushReplacementNamed(
                          widget.context,
                          '/work',
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Email ou senha incorretos',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'IBM_Plex_Sans',
                      fontSize: 27,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
