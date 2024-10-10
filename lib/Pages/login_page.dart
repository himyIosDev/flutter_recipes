import 'package:flutter/material.dart';
import 'package:flutter_recepies/services/auth_service.dart';
import 'package:status_alert/status_alert.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    //
    return _LoginPageState();
  }
//
}

// ***************************************************************************

class _LoginPageState extends State<LoginPage> {
  //
  GlobalKey<FormState> _loginFormKey = GlobalKey();

  String? userName, password;

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      //
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
        ),
      ),

      body: SafeArea(child: _buildUI()),
    );
  }

// ***************************************************************************

  Widget _buildUI() {
    //
    return SizedBox(
      //
      width: MediaQuery.sizeOf(context).width,

      child: Column(
        //
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

// ***************************************************************************

  Widget _title() {
    //
    return const Text(
      //
      "Recip Book",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  // ***************************************************************************

  Widget _loginForm() {
    //
    return SizedBox(
      //
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          //
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              //
              initialValue: "emilys",
              onSaved: (value) {
                //
                setState(() {
                  userName = value;
                });
              },
              validator: (value) {
                //
                if (value == null || value.isEmpty) {
                  //
                  return "Enter a username";
                }
              },
              decoration: const InputDecoration(hintText: "Username"),
            ),
            TextFormField(
              //
              initialValue: "emilyspass",
              obscureText: true,
              onSaved: (value) {
                //
                setState(() {
                  password = value;
                });
              },
              validator: (value) {
                //
                if (value == null || value.length < 5) {
                  //
                  return "Enter a password";
                }
              },
              decoration: const InputDecoration(hintText: "Password"),
            ),

            // login button
            _loginButton(),
          ],
        ),
      ),
    );
  }

  // ***************************************************************************

  Widget _loginButton() {
    //
    return SizedBox(
      //
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
        // button action button
        onPressed: () async {
          //
          if (_loginFormKey.currentState?.validate() ?? false) {
            //
            _loginFormKey.currentState?.save();
            bool result = await AuthService().login(
              userName!,
              password!,
            );

            if (result) {
              //
              Navigator.pushReplacementNamed(context, "/home");
            } else {
              //
              StatusAlert.show(
                context,
                duration: const Duration(seconds: 2),
                title: "Login Failed",
                subtitle: "Please try again",
                configuration: const IconConfiguration(
                  icon: Icons.error,
                ),
                maxWidth: 260,
              );
            }
          }
        },

        // button label
        child: const Text("Login"),
      ),
    );
  }
}
