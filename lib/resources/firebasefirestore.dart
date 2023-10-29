import 'dart:math';
import 'dart:typed_data';

import 'package:amazon/models/product_model.dart';
import 'package:amazon/models/user_details_models.dart';
import 'package:amazon/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseFirestoreClass {
  FirebaseFirestore firebaserfirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  Future uploadNameandAdrress(UserDetailsModels user) async {
    await firebaserfirestore
        .collection('users')
        .doc(firebaseauth.currentUser!.uid)
        .set(user.getjson());
  }

  Future getNameandAdress() async {
    DocumentSnapshot snp = await firebaserfirestore
        .collection('users')
        .doc(firebaseauth.currentUser!.uid)
        .get();

    UserDetailsModels userModel =
        UserDetailsModels.getModelFromJson(snp.data() as dynamic);
    return userModel;
  }

  Future<String> UploadProductToDataBase({
    required Uint8List image,
    required String productName,
    required String Rowcost,
    required int discount,
    required String selerName,
    required String selerUId,
  }) async {
    productName.trim();
    Rowcost.trim();

    String output = 'Some thing went wrong';

    if (image != null && productName != "" && Rowcost != "") {
      try {
        String uid = Utils().getUid();
        String imageUrl =
            await uploadImageToDataBase(image: image, uid: Utils().getUid());
        double cost = double.parse(Rowcost);
        cost = cost - (cost * discount / 100);
        ProductModel product = ProductModel(
            url: imageUrl,
            productName: productName,
            cost: cost,
            discount: discount,
            uId: selerUId,
            selerName: selerName,
            selerUId: selerUId,
            rating: 5,
            numOfRating: 0);
        firebaserfirestore
            .collection('products')
            .doc(uid)
            .set(product.getJson());
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please fill all the field";
    }
    return output;
  }

  Future<String> uploadImageToDataBase(
      {required Uint8List image, required String uid}) async {
    Reference Storageref =
        FirebaseStorage.instance.ref().child('products').child(uid);
    UploadTask uploadtask = Storageref.putData(image);
    TaskSnapshot task = await uploadtask;

    return task.ref.getDownloadURL();
  }
}
