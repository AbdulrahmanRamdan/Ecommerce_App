import 'package:ecommerceapp/fireservices/stror.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
class editproduct extends StatefulWidget {
  late product _product;
  editproduct(this._product);
  @override
  _editproductState createState() => _editproductState();
}
class _editproductState extends State<editproduct> { TextEditingController _name=TextEditingController();
TextEditingController _price=TextEditingController();
TextEditingController _describtion=TextEditingController();
TextEditingController _path=TextEditingController();
late String _cat;
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
                _custextfeild(widget._product.pname,"enter the Product name",_name),
                SizedBox(height: 20,),
                _custextfeild(widget._product.pprice,"enter the Product price",_price),
                SizedBox(height: 20,),
                _custextfeild(widget._product.pdescribe,"enter the Product describtion",_describtion),
                SizedBox(height: 20,),
                _custextfeild(widget._product.pimage,"enter the Product image",_path),
                SizedBox(height: 20,),
                DropdownButton(items: _items.map((e) {return DropdownMenuItem(value: e,child: Text(e),);} ).toList(),
                  hint: Text(widget._product.pcatogrey),
                  dropdownColor: Colors.grey,
                  icon: Icon(Icons.arrow_drop_down,),
                  iconSize: 36,
                  isExpanded: true,
                  style: TextStyle(color: Colors.black,fontSize: 22),
                  onChanged: (item){
                    setState(() {
                      _cat=item.toString();
                    });
                  },
                ),
                SizedBox(height: 20,),
                RaisedButton(onPressed: (){
                _store.update(widget._product.pid,({  productname: _name.text,
                  productprice:_price.text,
                  producrdescribtion:_describtion.text,
                  productcatogrey:_cat,
                  productpath:_path.text,}),widget._product.pcatogrey);
                },
                  color: Colors.green,
                  child:Text("Update Item",style: TextStyle(color:Colors.white,fontFamily: "Pacifico",letterSpacing: 1.25,wordSpacing: 1.25,height: 1.25,fontSize: 16),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(height: 20,),
                RaisedButton(onPressed: (){
                  _store.delete(widget._product.pid,widget._product.pcatogrey);
                  Navigator.pop(context);
                },
                  color: Colors.teal,
                  child:Text("Delete Item",style: TextStyle(fontFamily: "Pacifico",letterSpacing: 1.25,wordSpacing: 1.25,height: 1.25,fontSize: 16,color:Colors.white ,),),
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
