import 'package:demo1/Screens/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
   

  @override
  Widget build(BuildContext context) {
   void logoutUser() async{
      await FirebaseAuth.instance.signOut();
       // ignore: use_build_context_synchronously
       Navigator.popUntil(context, (route) => route.isFirst);
       // ignore: use_build_context_synchronously
       Navigator.pushReplacement(
        context,MaterialPageRoute(builder:(context) =>const LoginScreen()));
    }
    return Scaffold(
      appBar: AppBar(
        title:const Text("HomePage"),
        actions: [
          IconButton(
            onPressed:() {
              logoutUser();
            }, 
            icon:const Icon(Icons.logout)
            )
        ],
      ),

      drawer:Drawer(
        child: ListView(
          padding:const EdgeInsets.all(0),
          children: [
          UserAccountsDrawerHeader(
            accountName:const Text("Praveen Tiwari"), 
            accountEmail:const Text("prv@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS?Colors.blue:Colors.white,
              child:const Text("A",style: TextStyle(fontSize: 40.0),),
            ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
    
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                logoutUser();
              },
            ),
        ],),
      ) ,
    );
  }
}