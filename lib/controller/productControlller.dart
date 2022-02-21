import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_flutter_firebase/model/product.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // products
  late CollectionReference collectionReference;
  late CollectionReference achiveCollectionReference;

  //categories
  late CollectionReference dressCollectionReference;
  late CollectionReference shirtCollectionReference;
  late CollectionReference pantCollectionReference;
  late CollectionReference shoesCollectionReference;
  late CollectionReference tieCollectionReference;

  RxList<Product> productList = RxList<Product>([]);
  RxList<Product> achiveList = RxList<Product>([]);
  RxList<Product> dressList = RxList<Product>([]);
  RxList<Product> shirtList = RxList<Product>([]);
  RxList<Product> pantList = RxList<Product>([]);
  RxList<Product> shoeList = RxList<Product>([]);
  RxList<Product> tieList = RxList<Product>([]);
  // List<Product> get productsData => productList.value;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("products").doc('jFDF6AVClLnGFyXNvhM5').collection('featureproduct');
    achiveCollectionReference = firebaseFirestore.collection("products").doc('jFDF6AVClLnGFyXNvhM5').collection('newachives');
    dressCollectionReference = firebaseFirestore.collection("category").doc('qUg8m7xxHEVP6lWiPZV8').collection('dress');
    shirtCollectionReference = firebaseFirestore.collection("category").doc('qUg8m7xxHEVP6lWiPZV8').collection('shirt');
    pantCollectionReference = firebaseFirestore.collection("category").doc('qUg8m7xxHEVP6lWiPZV8').collection('pant');
    shoesCollectionReference = firebaseFirestore.collection("category").doc('qUg8m7xxHEVP6lWiPZV8').collection('shoes');
    tieCollectionReference = firebaseFirestore.collection("category").doc('qUg8m7xxHEVP6lWiPZV8').collection('tie');

    productList.bindStream(getAllProducts());
    achiveList.bindStream(getAchives());
    dressList.bindStream(getDressList());
    shirtList.bindStream(getShirtList());
    pantList.bindStream(getPantList());
    shoeList.bindStream(getShoesList());
    tieList.bindStream(getTieList());
    wait();
  }

  void wait() async {
    await Future.delayed(const Duration(milliseconds: 1000));
  }

  Stream<List<Product>> getAllProducts() =>
    collectionReference.snapshots().map((query) => 
      query.docs.map((item) => Product.fromMap(item)).toList());

  Stream<List<Product>> getAchives() =>
    achiveCollectionReference.snapshots().map((query) => 
      query.docs.map((item) => Product.fromMap(item)).toList());

  // Categories List
  Stream<List<Product>> getDressList() {
    return dressCollectionReference.snapshots().map((query) => 
      query.docs.map((e) => Product.fromMap(e)).toList()
    );
  }

  Stream<List<Product>> getShirtList() {
    return shirtCollectionReference.snapshots().map((event) => 
      event.docs.map((e) => Product.fromMap(e)).toList()
    );
  }

  Stream<List<Product>> getPantList() {
    return pantCollectionReference.snapshots().map((event) => 
      event.docs.map((e) => Product.fromMap(e)).toList()
    );
  }

  Stream<List<Product>> getShoesList() {
    return shoesCollectionReference.snapshots().map((event) => 
      event.docs.map((e) => Product.fromMap(e)).toList()
    );
  }

  Stream<List<Product>> getTieList() {
    return tieCollectionReference.snapshots().map((event) => 
      event.docs.map((e) => Product.fromMap(e)).toList()
    );
  }

  List<String> notificationList = [];
  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }

}

