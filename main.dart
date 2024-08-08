// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  runApp(const MyApp()); //calling class and method
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

bool isSecured = true;

Map<String, User> users = {
  "esraa@gmail.com": User(email: "esraa@gmail.com", password: "123456"),
  "sara@gmail.com": User(email: "sara@gmail.com", password: "123456"),
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 127, 95, 147),
        title: Text(
          "Login Page",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 24,
        ),
        actions: const [
          Icon(Icons.message, color: Colors.white, size: 24),
          SizedBox(width: 20),
          Icon(Icons.search, color: Colors.white, size: 24)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets\images\log.jpg'),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        label: Text("Enter your email"),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: isSecured,
                    decoration: InputDecoration(
                        label: Text("Enter your password"),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecured = !isSecured;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {
                        User user = users[emailController.text]!;

                        if (user.email == emailController.text &&
                            user.password == passwordController.text) {
                          print('logged in');
                        } else {
                          print('email or password is incorrect');
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: const Color.fromARGB(255, 127, 95, 147),
                          ),
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.login,
                                color: Colors.white,
                              )
                            ],
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
