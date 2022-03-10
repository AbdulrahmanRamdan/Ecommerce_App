import 'package:ecommerceapp/screens/showproducts.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/constants.dart';
import 'package:ecommerceapp/fireservices/stror.dart';
import 'package:ecommerceapp/models/product.dart';
class adminhome extends StatefulWidget {
  @override
  _adminhomeState createState() => _adminhomeState();
}

class _adminhomeState extends State<adminhome> {
  TextEditingController _name=TextEditingController();
  TextEditingController _price=TextEditingController();
  TextEditingController _describtion=TextEditingController();
  TextEditingController _path=TextEditingController();
  late String _categry="electronic";
   List<String>_items=[jacketcato,elctroniccato,shoes,trousers];
  @override
  Widget build(BuildContext context) {
    store _store=store();
    return Scaffold(
      backgroundColor:backlogin ,
      body:Center(
       child: Padding(padding:EdgeInsets.only(left: 15,right: 15) ,
      child:ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.12,),
          Column(
        children: [
          Text("ADMIN PAGE",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),),
          SizedBox(height: 20,),
          _custextfeild("Product name","enter the Product name",_name),
          SizedBox(height: 20,),
          _custextfeild("Product price","enter the Product price",_price),
          SizedBox(height: 20,),
          _custextfeild("Product describtion","enter the Product describtion",_describtion),
          SizedBox(height: 20,),
          _custextfeild("Product image","enter the Product image",_path),
          SizedBox(height: 20,),
          DropdownButton(items: _items.map((e) {return DropdownMenuItem(value: e,child: Text(e),);} ).toList(),
            hint: Text(_categry!=""?_categry:"Product catogrey"),
            dropdownColor: Colors.grey,
            icon: Icon(Icons.arrow_drop_down,),
            iconSize: 36,
            isExpanded: true,
            style: TextStyle(color: Colors.black,fontSize: 22),
            onChanged: (item){
              setState(() {
                _categry=item.toString();
              });
            },
          ),
          SizedBox(height: 20,),
          RaisedButton(onPressed: (){
                _store.addproduct(product(" ",_name.text,_price.text,_describtion.text,_categry,_path.text),_categry);
             },
                color: Colors.green,
                child:Text("Add Items",style: TextStyle(color:Colors.white,fontFamily: "Pacifico",letterSpacing: 1.25,wordSpacing: 1.25,height: 1.25,fontSize: 16),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
          SizedBox(height: 20,),
          RaisedButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){return veiwproducts(_categry);}) );
          },
            color: Colors.teal,
            child:Text("Show Items",style: TextStyle(fontFamily: "Pacifico",letterSpacing: 1.25,wordSpacing: 1.25,height: 1.25,fontSize: 16,color:Colors.white ,),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),],),),),
    );
  }
  Widget _custextfeild(String hint,String mass,TextEditingController _con){
    return TextFormField(
      controller: _con,
      validator: (value){
        if(value!.isEmpty){return mass;}
      },
      cursorColor:Colors.red,
      decoration: InputDecoration(
        filled: true,
        fillColor:filltextfeild ,
        hintText: hint,
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
