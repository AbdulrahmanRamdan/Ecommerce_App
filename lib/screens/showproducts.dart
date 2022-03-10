import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/fireservices/stror.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/screens/Editproduct.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/constants.dart';

import '../constants.dart';

class veiwproducts extends StatefulWidget {
 String cat;
veiwproducts(this.cat);
  @override
  _veiwproductsState createState() => _veiwproductsState();
}

class _veiwproductsState extends State<veiwproducts> {
  store _stor=new store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream:_stor.loaddata(widget.cat) ,
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<product> products=[];
            for(var doc in snapshot.data!.docs){
              var _data=doc;
              products.add(product(_data.id,_data[productname], _data[productprice], _data[producrdescribtion], _data[productcatogrey], _data[productpath]));
            }
          return ListView.builder(itemBuilder: (context,index){
            return _drawcard(products[index]);
          },
          itemCount: products.length,);}
          else{
            return Center(child:Text("LOADING........."),);
          }
        },
      ),
    );
  }
  Widget _drawcard( product _data){
    return GestureDetector(
      onTapUp:(details){
        double dx=details.globalPosition.dx;
        double dx2=MediaQuery.of(context).size.width-dx;
        double dy=details.globalPosition.dy;
        double dy2=MediaQuery.of(context).size.height-dy;
        showMenu(context: context, position:RelativeRect.fromLTRB(dx, dy, dx2, dy2) , items: [
          PopupMenuItem(child:InkWell( onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return editproduct(_data);}));
          },
            child:Text("Edit",style: TextStyle(color: Colors.orange,fontSize: 18,fontWeight: FontWeight.bold),),),),
          PopupMenuItem(child: InkWell(onTap: (){
          _stor.delete(_data.pid,widget.cat);
          Navigator.pop(context);
          },
          child:Text("Delete",style: TextStyle(color: Colors.red.shade500,fontSize: 18,fontWeight: FontWeight.bold),),),),
        ]);
      } ,
      child:Padding(padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child:Column(children: [
        Row(
          children: [
            Container(
              height: 110,
              width: 110,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage(_data.pimage),fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 20,),
            Column(children: [
              Text(_data.pcatogrey,style: TextStyle(color: Colors.orange,fontSize: 26,),textAlign: TextAlign.center,),
              Row(children: [
                Text(_data.pname,style: TextStyle(color: Colors.red.shade500,fontFamily: "Pacifico",fontSize: 26),),
                SizedBox(width: 40,),
                Text(_data.pprice,style: TextStyle(color: Colors.orangeAccent.shade700,fontFamily: "Pacifico",fontSize: 26),),
                Icon(Icons.monetization_on_sharp,size: 35,),
              ],),
              SizedBox(child:Text(_data.pdescribe,style: TextStyle(color: Colors.blueGrey,fontSize: 26,),textAlign: TextAlign.center,),width: 200 ,)

            ],),
          ],
        ),
        Container(color: Colors.grey,height: 4,width: MediaQuery.of(context).size.width,),],),
    ),);
  }
}