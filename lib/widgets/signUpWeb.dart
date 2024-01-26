// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teslalogin/screens/homeScreen.dart';
import 'package:teslalogin/screens/loginScreen.dart';
import 'package:teslalogin/user_auth/firebase_auth_services.dart';
import 'package:teslalogin/widgets/loginForm.dart';

class SignUpWeb extends StatefulWidget {
  const SignUpWeb({Key? key}) : super(key: key);

  @override
  State<SignUpWeb> createState() => _SignUpWebState();
}

class _SignUpWebState extends State<SignUpWeb> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    //Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(70),
      alignment: Alignment.center,
      height: currentHeight - 90,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 30,
        child: Row(
          children: [
            currentWidth > 600
                ? Expanded(
                    flex: 7,
                    child: Container(
                      alignment: AlignmentDirectional.topStart,
                      width: 800,
                      height: 750,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 207, 12, 12),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                      ),
                      child: const Expanded(
                        child: Image(
                          alignment: AlignmentDirectional.topStart,
                          image: AssetImage('assets/teslabenner02.jpg'),
                          width: 1400,
                          height: 750,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              flex: currentWidth > 600 ? 3 : 12,
              child: Container(
                alignment: AlignmentDirectional.bottomStart,
                padding: const EdgeInsets.only(
                    right: 20, top: 0, bottom: 10, left: 20),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/teslalogo.png'),
                      width: 200,
                      height: 100,
                      alignment: AlignmentDirectional.centerStart,
                    ),
                    const SizedBox(height: 50),
                    FormContainerWidget(
                      controller: _usernameController,
                      hintText: "username",
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 20),
                    FormContainerWidget(
                      controller: _emailController,
                      hintText: "Email",
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 20),
                    FormContainerWidget(
                      controller: _passwordController,
                      hintText: "Password",
                      isPasswordField: true,
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: _signUp,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("¿Ya tienes cuenta?"),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text(
                            "Iniciar Sesion",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    // ignore: unused_local_variable
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user == null) {
      print("Ha ocurrido un error");
    } else {
      print("Usuario creado correctamente");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
