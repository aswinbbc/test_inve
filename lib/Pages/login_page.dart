import 'package:amber_erp/SideBar/side_bar_layout.dart';
import 'package:amber_erp/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amber_erp/models/authentication.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  bool hidePassword = true;
  bool _isChecked = false;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.01,
                    right: screenWidth * 0.01,
                    top: screenHeight * 0.01),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.08,
                          bottom: screenHeight * 0.13),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: const Image(
                            image: AssetImage("assets/amber logo final-01.jpg"),
                            height: 100,
                            width: 300,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, .1),
                              borderRadius: BorderRadius.circular(32)),
                          child: TextFormField(
                            cursorColor: Colors.yellow,
                            style: const TextStyle(color: Colors.white),
                            controller: _userController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(20)),
                            keyboardType: TextInputType.text,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, .1),
                              borderRadius: BorderRadius.circular(32)),
                          child: TextField(
                            cursorColor: Colors.yellow,
                            style: const TextStyle(color: Colors.white),
                            controller: _passController,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    hidePassword = !hidePassword;
                                  },
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.4),
                                  icon: Icon(hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                hintText: "Password",
                                hintStyle: const TextStyle(color: Colors.white),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(20)),
                            keyboardType: TextInputType.text,
                            obscureText: hidePassword,
                          )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Colors.white,
                            checkColor: Colors.black,
                            value: _isChecked,
                            onChanged: (changedvalue) {
                              setState(() {
                                _isChecked = changedvalue!;
                              });
                            }),
                        const Text(
                          "Remember Me",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Rubic'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 50,
                        width: 380,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                            onPressed: handleRememberme,
                            child: const Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 25),
                            ))),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password ?",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                    Container(
                      height: 2,
                      margin: const EdgeInsets.only(bottom: 20),
                      color: Colors.white38,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Have Account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "signup");
                            },
                            child: const Text(
                              "SIGN UP",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleRememberme() {
    if (_isChecked) {
      SharedPreferences.getInstance().then(
        (pref) {
          pref.setString('Username', _userController.text);
          pref.setString('Password', _passController.text);
        },
      );
    }

    var username = "";
    String txtuser = _userController.text;
    String txtPass = _passController.text;
    UserLogin().login(txtuser, txtPass).then((value) async {
      GetUser() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        username = prefs.getString('user_name').toString();
        // final clientId = prefs.getString('client_id').toString();
      }

      if (value == "User Successfully LoggedIn") {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MySidebarLayout()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          content: Text(value),
        ));
        final _sharedPrefs = await SharedPreferences.getInstance();
        await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      } else if (value == "Waiting for Authentication") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.purple,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text("Waiting for Authentication..."),
        ));
      } else if (txtuser != username) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          content: Text("Incorrect Username or Password"),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(10),
          content: Text(value),
        ));
      }
    });
  }
}
