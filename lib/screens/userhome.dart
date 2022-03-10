import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/fireservices/stror.dart';
import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/screens/productinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class userhome extends StatefulWidget {
  @override
  _userhomeState createState() => _userhomeState();
}
store _store=store();
late int index_bottomnavigetor=0;
List<String> cats=[elctroniccato,jacketcato,trousers,shoes];
class _userhomeState extends State<userhome> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          DefaultTabController(length: 4,
        child:  Scaffold(
          backgroundColor: Colors.black26,
            appBar: AppBar(
              actions: [Icon(Icons.shopping_cart_rounded,color: Colors.deepOrange,)],
              automaticallyImplyLeading: false,
              title: Text("discovered".toUpperCase(),style: TextStyle(color:Colors.deepOrange,fontSize:18,fontWeight: FontWeight.w600,fontFamily: "Pacifico" ),),
              backgroundColor: Colors.white,
              bottom: TabBar(
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.deepOrange,
                labelColor: Colors.deepOrange,
                labelStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,) ,
                indicatorWeight: 5,
                unselectedLabelStyle: TextStyle(fontSize: 14,),
                onTap: (value){
                 if(value==0){
                 }
                 else if(value==1){
                 }
                 else if(value==2){
                 }else if(value==3){
                 }
                },
                tabs: [
                  Text("Electroinec"),
                  Text("Clothes"),
                  Text("trousers"),
                  Text("shoes"),
                ],
              ),
            ),
          body: TabBarView(
            children: [
              GRID_VEIW(cats[0]),
              GRID_VEIW(cats[1]),
              GRID_VEIW(cats[2]),
              GRID_VEIW(cats[3]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
             showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "Pacifico"),
            unselectedLabelStyle:TextStyle(color: Colors.black,),
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            currentIndex: index_bottomnavigetor,
            onTap: (value){
              setState(() {
                index_bottomnavigetor=value;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("home")),
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("home")),
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("home")),
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("home")),
            ],
          ),
          ),
          ),
        ],
    ),
    );
  }
  Widget GRID_VEIW(String ss){
    return StreamBuilder<QuerySnapshot>(
      stream:_store.loaddata(ss) ,
      builder: (context,snapshot){
        if(snapshot.hasData){
          List<product> products=[];
          for(var doc in snapshot.data!.docs){
            var _data=doc;
            products.add(product(_data.id,_data[productname], _data[productprice], _data[producrdescribtion], _data[productcatogrey], _data[productpath]));
          }
         return GridView.builder(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
         crossAxisCount: 3,
         childAspectRatio: 0.8,
         ),
         itemBuilder: (context,index){
            return Padding(padding: EdgeInsets.all(2),child:_card_in_grid(products[index]));
              },
              itemCount: products.length,
          );
          }
        else{
          return Center(child:Text("LOADING........."),);
        }
      },
    );

  }

  Widget _card_in_grid(product product) {
     return InkWell(
       onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return proinfo(product);
        }));
       },
       child:Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.33,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width:2,color: Colors.orange ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(image: AssetImage(product.pimage),fit: BoxFit.fill),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Opacity(
            opacity: .6,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(product.pname,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('\$ ${product.pprice}')
                  ],
                ),
              ),
            ),
          ),
        )
      ],
     ),);
  }
}
