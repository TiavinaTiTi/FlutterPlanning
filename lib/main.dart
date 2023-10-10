import 'package:app/listPage.dart';
import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Enlever debuger
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "Projet Mobile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange,
      body: Center(
          child: ListView(
          children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 8),
            child: Column(
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 30,
                      color: Colors.orangeAccent),
                ),
                const Text(
                  '" L\'université dans votre poche, partout où vous allez."',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            ),
          ),
          Image.asset(
            'images/university.png',
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Utilisateur',
                      hintText: 'user@gmail.com'
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mot de passe',
                        hintText: 'Votre mot de passe'
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ListPage(),
                          )
                      );
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orangeAccent),
                        shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero)
                            )
                        )
                    ),
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
