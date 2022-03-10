import 'package:ecommerceapp/constants.dart';
import 'package:ecommerceapp/fireservices/auth.dart';
import 'package:ecommerceapp/screens/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class signup extends StatefulWidget {
  String id="sign_up";
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  bool pass=true;
  Auth _auth=Auth(FirebaseAuth.instance);
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController compassword=TextEditingController();
  late String name,emaill,passwordd;
  final GlobalKey<FormState>_gkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _gkey,
        child: Scaffold(
      backgroundColor: backlogin,
      body:ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child:Image(image: AssetImage("assests/icons/buy.png")),height: MediaQuery.of(context).size.height*0.15,width: MediaQuery.of(context).size.width*0.25,),
              Text("Buy It",style:TextStyle(fontFamily: "Pacifico",fontSize:18,fontWeight: FontWeight.bold ),),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.only(left: 30,right: 30),
                child:Column(
                  children: [
                    _custextfeild("Enter your Name", Icons.person,false,username,"enter your name"),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    _custextfeild("Enter your Email", Icons.email,false,email,"enter your email"),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    _custextfeildpass("Enter your Password", Icons.password,password,"enter the password"),
                    SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                    _custextfeildpass("Confirm your Password", Icons.password,compassword,"enter the confirm password"),
                    Row(children: [
                      IconButton(onPressed: (){setState(() {
                        pass=!pass;
                      });}, icon: Icon(Icons.remove_red_eye),),
                      Text("Show/hide password"),
                    ],),
                  ],),
              ),
              SizedBox(height: 5,),
              Builder(builder: (context)=>FlatButton(onPressed: () async {
                if(_gkey.currentState!.validate()){
                name=username.text;
                emaill=email.text;
                passwordd=password.text;
                if(await _auth.signup(emaill,passwordd)!="Sign up"){
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("Make sure of your data please"),));}

                else {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                         return Login_Screen();}));
                }
                }
              },color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("SIGN UP",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: "pacifico",letterSpacing: 1.2),)),),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do you have a Acount?",style: TextStyle(color: Colors.white,fontSize: 16),),
                  GestureDetector(child:Text("LOGIN",style: TextStyle(color: Colors.black,fontSize: 16),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Login_Screen();
                      }));
                    },)
                ],
              ),
            ],
          ),

        ],
      ),
    ),);
  }
  Widget _custextfeild(String hint,IconData icon,bool boll, TextEditingController con,String mass){
    return TextFormField(
      validator: (value){
        if(value!.isEmpty){return mass;}
      },
      controller: con,
      obscureText: boll,
      cursorColor:Colors.red,
      decoration: InputDecoration(
        filled: true,
        fillColor:filltextfeild ,
        hintText: hint,
        prefixIcon: Icon(icon,color: backlogin,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
  Widget _custextfeildpass(String hint,IconData icon,TextEditingController con,String mass){
    return TextFormField(
      validator: (value){
        if(value!.isEmpty){return mass;}
        else if(value.length<6){return "pass word should be > 6 sells";}
        else if(mass=="enter the confirm password"){
          if(password.text!=compassword.text){
            return "please enter the same password";
          }
        }
      },
      controller: con,
      obscureText: pass,
      cursorColor:Colors.red,
      decoration: InputDecoration(
        filled: true,
        fillColor:filltextfeild ,
        hintText: hint,
        prefixIcon: Icon(icon,color: backlogin,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
