import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_buddy_flutter/providers/auth_provider.dart';
import 'package:task_buddy_flutter/view/auth_wrapper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => AuthProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Task Buddy",
      home: AuthWrapper()
    );
  }
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       margin: EdgeInsets.all(20),
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             const Text(
  //               'Task Management & \n To-Do List',
  //               style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
  //               textAlign: TextAlign.center,
  //             ),
  //             const Text(
  //               'This productive tool is designed to help \n you better manage your task \n project-wise conveniently!',
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 color: Colors.grey,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             Container(
  //               margin: EdgeInsets.only(top: 15),
  //               width: 300,
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     child: ElevatedButton(
  //                       style: ElevatedButton.styleFrom(
  //                         backgroundColor: const Color.fromARGB(
  //                           255,
  //                           122,
  //                           73,
  //                           207,
  //                         ),
  //                         foregroundColor: Colors.white,
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 40,
  //                           vertical: 15,
  //                         ),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                       ),
  //                       onPressed: () {
  //                         Navigator.push(
  //                           context,
  //                           MaterialPageRoute(
  //                             builder: (context) => const LoginScreen(),
  //                           ),
  //                         );
  //                       },
  //                       child: Text(
  //                         'Get Started',
  //                         style: TextStyle(
  //                           fontSize: 18,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ), // This trailing comma makes auto-formatting nicer for build methods.
  //     ),
  //   );
  // }
}
