import 'package:authentication/controller.dart';
import 'package:authentication/loginpage.dart';
import 'package:authentication/usermodel.dart';
import 'package:authentication/waweclipper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthController? authController;

  @override
  void initState() {
    authController = Get.find(tag: 'auth');
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 236, 236),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: const Color.fromARGB(255, 234, 171, 209),
                height: 240,
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: const Color.fromARGB(255, 236, 71, 162),
              height: 220,
              alignment: Alignment.center,
              child: const Text(
                "Kayıt Olun",
                style: TextStyle(
                  fontSize: 60,
                  fontFamily: "Aboreto",
                  color: Color.fromARGB(255, 235, 221, 221),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //name
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 300, 20, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lütfen adınızı girin";
                          }
                          return null;
                        },
                        controller: _usernameController,
                        cursorColor: Colors.pink,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.pink,
                          ),
                          labelText: "İsim",
                          hintText: "İsim",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 242, 48, 190),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    //email
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return "Lütfen mail adını girin";
                          }
                          return null;
                        },
                        controller: _emailController,
                        cursorColor: Colors.pink,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.pink,
                          ),
                          hintText: 'Email',
                          labelText: "@mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 242, 48, 190),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    //telefon
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lütfen telefon numaranızı girin";
                          }
                          return null;
                        },
                        controller: _phoneController,
                        cursorColor: Colors.pink,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone,
                            color: Colors.pink,
                          ),
                          labelText: "Telefon",
                          hintText: "+90",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 242, 48, 190),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    //password
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lütfen şifre girin";
                          } else if (value.length < 6) {
                            return "Lütfen en az 6 karakter girin";
                          }
                          return null;
                        },
                        controller: _passwordController,
                        cursorColor: Colors.pink,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Colors.pink,
                          ),
                          labelText: "Şifre",
                          hintText: "Şifre",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color.fromARGB(255, 242, 48, 190),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        UserModel userModel = UserModel();
                        userModel.username = _usernameController.text;
                        userModel.email = _emailController.text;
                        userModel.phone = _phoneController.text;
                        if (_formKey.currentState!.validate()) {
                          authController!
                              .createUser(userModel, _passwordController.text);
                          Get.to(const LoginPage());
                        }
                        // Get.snackbar(
                        //   'Kayıt',
                        //   'Başarıyla kaydedildi',
                        //   colorText: Colors.black,
                        //   snackPosition: SnackPosition.TOP,
                        //   backgroundColor: Colors.pink,
                        //   icon: const Icon(Icons.add_task),
                        // );
                      },
                      child: Text("Kayıt "),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 236, 71, 162),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        textStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
