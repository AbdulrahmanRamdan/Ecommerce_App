import 'package:flutter/material.dart';
import 'package:ecommerceapp/constants.dart';
import 'Signup.dart';
import 'package:ecommerceapp/fireservices/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'adminhome.dart';
import 'userhome.dart';
class Login_Screen extends StatefulWidget {
  String id="Login_Screen";
  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  String txt="Iam a admin";
  bool pass=true;
  bool is_admin=false;
  Auth _auth=Auth(FirebaseAuth.instance);
  final GlobalKey<FormState>_globalkey=GlobalKey<FormState>();
   TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  late String emaill,passwordd;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalkey,
      child:Scaffold(
      backgroundColor: backlogin,
      body:ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.12,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(child:Image(image: AssetImage("assests/icons/buy.png")),height: MediaQuery.of(context).size.height*0.15,width: MediaQuery.of(context).size.width*0.25,),
              Text("Buy It",style:TextStyle(fontFamily: "Pacifico",fontSize:18,fontWeight: FontWeight.bold ),),
              SizedBox(height: 30,),
              Padding(padding: EdgeInsets.only(left: 30,right: 30),
                child:Column(
                  children: [
                  _custextfeild("Enter your Email", Icons.email,"enter your email"),
                  SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                  _custextfeildpass("Enter your Password", Icons.password,"enter your password"),
                    Row(children: [
                     IconButton(onPressed: (){setState(() {
                       pass=!pass;
                     });}, icon: Icon(Icons.remove_red_eye),),
                      Text("Show/hide password"),
                    ],),
                ],),
              ),
              SizedBox(height: 30,),
              Builder(builder: (context)=>FlatButton(onPressed: () async {
                if( _globalkey.currentState!.validate()){
                emaill=email.text;
                passwordd=password.text;
                   if(await _auth.signin(emaill,passwordd)!="Sign-in"){
                     Scaffold.of(context).showSnackBar(
                     SnackBar(content: Text("Make sure of your data please"),));
                   print(is_admin);}
                   else {
                    if (is_admin&& passwordd=="admin1234"){print(is_admin);
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                     return adminhome();
                   }));
                  }
                        if(!is_admin&&passwordd!="admin1234"){print(is_admin);Navigator.push(context, MaterialPageRoute(builder: (context){
                        return userhome();
                       }));}
                       else{
                         Scaffold.of(context).showSnackBar(SnackBar(content: Text("Make sure of your data please"),));}
                }
                }
              },color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: "pacifico",letterSpacing: 1.2),)),),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have a Acount?",style: TextStyle(color: Colors.white,fontSize: 16),),
                  GestureDetector(child:Text("SIGNUP",style: TextStyle(color: Colors.black,fontSize: 16),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return signup();
                    }));
                  },)
                ],
              ),
              SizedBox(height: 10,),
              GestureDetector(child:SizedBox(width: 100,height: 15,
              child:Text(txt,style: TextStyle(color: Colors.black,fontSize: 16),),),
                     onTap: (){
                        txt="Iam a admin";
                        setState(() {
                          is_admin=!is_admin;
                        });
                       if(is_admin==true) {
                         txt="Iam a user";
                       }

                 },),

            ],
          ),

        ],
      ),
    ),);
  }
  Widget _custextfeild(String hint,IconData icon,String mass){
    return TextFormField(
      controller: email,
      validator: (value){
        if(value!.isEmpty){return mass;}
      },
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
  Widget _custextfeildpass(String hint,IconData icon,String mass){
    return TextFormField(
      controller: password,
      validator: (value){
        if(value!.isEmpty){return mass;}
        else if(value.length<6){return "pass word should be > 6 sells";}
      },
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
