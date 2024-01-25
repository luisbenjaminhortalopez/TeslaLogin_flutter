import 'package:flutter/material.dart';
import 'package:teslalogin/widgets/loginForm.dart';

class LoginWeb extends StatelessWidget {
  const LoginWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(70),
      alignment: Alignment.center,
      height: currentHeight - 90 ,
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
                padding: const EdgeInsets.only(right: 20, top: 0, bottom: 10, left: 20),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/teslalogo.png'),
                      width: 200,
                      height: 100,
                      alignment: AlignmentDirectional.centerStart,
                    ),
                    const SizedBox(height: 50),
                    LoginForm(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
