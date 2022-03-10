import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/Login_Screen.dart';
import 'package:ecommerceapp/screens/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:ecommerceapp/fireservices/auth.dart';
main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(app());
}
class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers:[
      Provider<Auth>(create: (_)=>Auth(FirebaseAuth.instance)),
      //StreamProvider(create: (_)=>context.read<Auth>().authStateChanges),
    ] ,
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login_Screen().id,
      routes: {
        Login_Screen().id:(context)=>Login_Screen(),
        signup().id:(context)=>signup(),
      },

    ),);
  }
}
