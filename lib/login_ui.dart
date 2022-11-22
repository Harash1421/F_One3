import 'package:flutter/material.dart';
import 'package:login_ui/second_sceen.dart';

class loginUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login UI",
      home: loginHome(),
    );
  }
}

class loginHome extends StatefulWidget {
  const loginHome({super.key});

  @override
  State<loginHome> createState() => _loginHomeState();
}

class _loginHomeState extends State<loginHome> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.black])),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login UI"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  //Method Of Home Page;
  Widget _page() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _inputField("Email", emailController),
            _sizeBox(20),
            _inputField("Password", passwordController, isPassword: true),
            _sizeBox(58),
            _button(),
            _sizeBox(24),
            _textButton()
          ],
        ),
      ),
    );
  }

  //Method Of Input Filed;
  Widget _inputField(String hintText, TextEditingController controller,
      {isPassword = false}) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: Colors.white));

    return TextField(
      style: const TextStyle(fontSize: 24, color: Colors.white),
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: border,
          focusedBorder: border),
      obscureText: isPassword,
    );
  }

  //Method Of Button
  Widget _button() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Colors.white,
            onPrimary: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 17)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => secondScreen()));
        },
        child: const SizedBox(
            width: double.infinity,
            child: Text("Login",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24))));
  }

  ///Method Of TextButton
  Widget _textButton() {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => secondScreen()));
        },
        child: const Text(
          "Create New Account?",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
        ));
  }

  //Method Of Sized Box
  Widget _sizeBox(double size) {
    return SizedBox(
      height: size,
    );
  }
}
