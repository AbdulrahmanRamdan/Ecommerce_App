import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class proinfo extends StatefulWidget {
product _product;
proinfo(this._product);
  @override
  _proinfoState createState() => _proinfoState();
}

class _proinfoState extends State<proinfo> {
  int counter=1;
  @override
  void dispose() {
    // TODO: implement dispose
    counter=1;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget._product.pname.toUpperCase()),
        backgroundColor: Colors.orange.shade900,
        centerTitle: true,
      ),
      body: ListView(
           children: [
             _retrun_image(widget._product.pimage),
             _draw_card(widget._product.pdescribe,widget._product.pcatogrey,widget._product.pprice),
             _draw_countofpeices(),
             _draw_totalprice(counter,widget._product.pprice),
             Padding(padding:EdgeInsets.only(left: 100,right: 100,top: 10,bottom: 50),
                child :RaisedButton(onPressed: (){},
                  child: Text("Buy",style: TextStyle(color: Colors.white,fontSize: 30,wordSpacing: 1.25,height: 1.5,fontWeight: FontWeight.bold,fontFamily: "Pacifico"),),
                  color: Colors.orange.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
             ),
           ],
      ),
    );
  }
  Widget _retrun_image(String _image){
    return Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(_image),fit: BoxFit.fill),
        borderRadius: BorderRadius.all(Radius.circular(25)),
        border: Border.all(color: Colors.orange.shade900,width: 5),
      ),
    );
  }

 Widget _draw_card(String pdescribe, String pcatogrey,String price) {
    return Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        border: Border.all(color: Colors.orange.shade900,width: 5),
      ),
    child:Card(
      child: Column(
        children: [
          Row(
            children: [
              Text("description : ".toUpperCase(),style: TextStyle(color: Colors.orange.shade900,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(
                width:190 ,
                child: Text(pdescribe,style: TextStyle(color:Colors.black,fontSize: 20),),
              ),
               ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
            Text("categroy      : ".toUpperCase(),style: TextStyle(color: Colors.orange.shade900,fontSize: 25,fontWeight: FontWeight.bold),),
             Text(pcatogrey,style: TextStyle(color:Colors.black,fontSize: 20),),
          ],),
          SizedBox(height: 20,),
          Row(
            children: [
              Text("price               : ".toUpperCase(),style: TextStyle(color: Colors.orange.shade900,fontSize: 25,fontWeight: FontWeight.bold),),
              Text(price,style: TextStyle(color:Colors.black,fontSize: 20),),
              Icon(Icons.attach_money_rounded,color: Colors.green,size: 25,),
            ],),
        ],
      ),
    ),
    ),
    );
 }

  Widget _draw_countofpeices() {
    return Padding(
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              setState(() {
                if(counter>1){
                  counter--;
                }
              });
            }, icon: Icon(Icons.remove_circle,size: 20,color: Colors.black,)),
            Text(counter.toString(),style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),),
            IconButton(onPressed: (){
              setState(() {
                if(counter<12){
                  counter++;
                }
              });
            }, icon: Icon(Icons.add_circle,size: 20,color: Colors.black,)),
            SizedBox(width: 30,),
            Text("Pieces",style: TextStyle(color: Colors.orange.shade900,fontSize: 20,fontWeight: FontWeight.w600),),
          ],
        ),
    );
  }

 Widget _draw_totalprice(int counter, String pprice) {
    return Container(
      margin: EdgeInsets.only(left: 60,right: 60),
      decoration: BoxDecoration(
        border: Border.all(color:Colors.orange.shade900,width: 5),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Totalprice :".toUpperCase(),style: TextStyle(color: Colors.orange.shade900,fontSize: 25,fontWeight: FontWeight.bold),),
          Text((int.parse(pprice)*counter).toString(),style: TextStyle(color:Colors.orange.shade900,fontSize: 35,fontWeight: FontWeight.bold,fontFamily: "Pacifico"),),
          Icon(Icons.monetization_on,color: Colors.green,),
        ],),
    );
 }

}
