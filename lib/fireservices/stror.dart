import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class store{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
   void addproduct(product pro,String cat)  {
     _firestore.collection(cat).add({
           productname:pro.pname,
           productprice:pro.pprice,
           producrdescribtion:pro.pdescribe,
           productcatogrey:pro.pcatogrey,
           productpath:pro.pimage,
     });}
   Stream <QuerySnapshot>loaddata(String cat)  {
    return  _firestore.collection(cat).snapshots();

   }
   delete(documentid,String cat){
     _firestore.collection(cat).doc(documentid).delete();
   }
   update(documentid,data,String cat){
     _firestore.collection(cat).doc(documentid).update(data);
   }
}