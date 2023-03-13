import 'package:authentication/controller.dart';
import 'package:authentication/loginpage.dart';
import 'package:authentication/registerpage.dart';
import 'package:authentication/waweclipper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<HomeScreen> {
  AuthController? authController;

  @override
  void initState() {
    authController = Get.put(AuthController(), tag: 'auth');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: const Color.fromARGB(255, 234, 171, 209),
                height: 270,
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: const Color.fromARGB(255, 236, 71, 162),
              height: 250,
              alignment: Alignment.center,
              child: const Text(
                "Hoşgeldiniz",
                style: TextStyle(
                  fontSize: 55,
                  fontFamily: "Aboreto",
                  color: Color.fromARGB(255, 235, 221, 221),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 180, 50, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const LoginPage());
                    },
                    child: Text("Giriş"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 236, 71, 162),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(const RegisterPage());
                    },
                    child: Text("Kayıt Ol"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 236, 71, 162),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 65, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}














//  GestureDetector(
//       child: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: const Color.fromARGB(255, 237, 167, 190),
//             title: const Center(
//                 child: Text(
//               'Zehra Güzellik Merkezi',
//               style: TextStyle(
//                   fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
//             )),
//             bottom: const TabBar(
//               indicatorColor: Color.fromARGB(255, 243, 245, 228),
//               tabs: <Widget>[
//                 Tab(
//                   text: "Log In",
//                 ),
//                 Tab(
//                   text: "Register",
//                 ),
//               ],
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               const LoginPage(),
//               RegisterPage(),
//             ],
//           ),
//         ),
//       ),
//     );

