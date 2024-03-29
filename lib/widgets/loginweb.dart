import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teslalogin/screens/homeScreen.dart';
import 'package:teslalogin/user_auth/firebase_auth_services.dart';
import 'package:teslalogin/widgets/loginForm.dart';
import 'package:teslalogin/widgets/signUpWeb.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({Key? key}) : super(key: key);

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
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
                          image: AssetImage('assets/teslabanner.jpg'),
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
                      controller: _emailController,
                      hintText: "Email",
                      isPasswordField: false,
                    ),
                    const SizedBox(height: 50),
                    FormContainerWidget(
                      controller: _passwordController,
                      hintText: "Password",
                      isPasswordField: true,
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: _signIn,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No tienes cuenta"),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpWeb()));
                          },
                          child: const Text(
                            "Registrate",
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

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user == null) {
      print("Ha ocurrido un error");
    } else {
      print("Inicio de sesi'on exitoso");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
