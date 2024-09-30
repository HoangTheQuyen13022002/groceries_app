import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/models/cart.dart';

class CartProvider extends ChangeNotifier {
  final CollectionReference cartCollection =
  FirebaseFirestore.instance.collection('carts');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  List<Cart> cartProducts = [];

  void loadUser() {
    user = FirebaseAuth.instance.currentUser;
  }

  // Phương thức thêm sản phẩm vào giỏ hàng
  Future<void> addToCart(Cart cart) async {
    loadUser();
    try {
      QuerySnapshot existingCartItems = await _firestore
          .collection('carts')
          .where('uid', isEqualTo: user!.uid)
          .where('productId', isEqualTo: cart.productId)
          .get();

      if (existingCartItems.docs.isEmpty) {
        await _firestore.collection('carts').add(cart.toMap());
        print('Product added to cart');
      } else {
        var docId = existingCartItems.docs.first.id;
        int currentQuantity = existingCartItems.docs.first['quantity'];

        await _firestore.collection('carts').doc(docId).update({
          'quantity': currentQuantity + cart.quantity,
        });
        print('Cart quantity updated');
      }
    } catch (e) {
      print('Error adding to cart: $e');
    }
    notifyListeners();
  }

  // Stream để lấy danh sách giỏ hàng từ Firestore
  Stream<List<Cart>> get carts {
    loadUser();
    if (user != null) {
      return cartCollection
          .where('uid', isEqualTo: user!.uid)
          .snapshots()
          .map(cartListSnapshot);
    }
    return Stream.value([]);
  }

  List<Cart> cartListSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Cart(
          id: doc.id,
          productId: doc['productId'],
          quantity: doc["quantity"],
          dateCreated: doc["dateCreated"],
          uid: doc['uid']);
    }).toList();
  }

  Future<void> increaseQuantity(String productId) async {
    loadUser();
    try {
      QuerySnapshot existingCartItems = await _firestore
          .collection('carts')
          .where('uid', isEqualTo: user!.uid)
          .where('productId', isEqualTo: productId)
          .get();

      if (existingCartItems.docs.isNotEmpty) {
        var docId = existingCartItems.docs.first.id;
        int currentQuantity = existingCartItems.docs.first['quantity'];

        await _firestore.collection('carts').doc(docId).update({
          'quantity': currentQuantity + 1,
        });
        print('Quantity increased');
      }
    } catch (e) {
      print('Error increasing quantity: $e');
    }
  }

  Future<void> decreaseQuantity(String productId) async {
    loadUser();
    try {
      QuerySnapshot existingCartItems = await _firestore
          .collection('carts')
          .where('uid', isEqualTo: user!.uid)
          .where('productId', isEqualTo: productId)
          .get();

      if (existingCartItems.docs.isNotEmpty) {
        var docId = existingCartItems.docs.first.id;
        int currentQuantity = existingCartItems.docs.first['quantity'];

        if (currentQuantity > 1) {
          await _firestore.collection('carts').doc(docId).update({
            'quantity': currentQuantity - 1,
          });
          print('Quantity decreased');
        } else {
          // Nếu số lượng là 1, xóa sản phẩm khỏi giỏ hàng
          await _firestore.collection('carts').doc(docId).delete();
          print('Product removed from cart');
        }
      }
    } catch (e) {
      print('Error decreasing quantity: $e');
    }
  }

  Future<void> deleteCart(String productId) async{
    loadUser();
    try {
      QuerySnapshot existingCartItems = await _firestore
          .collection('carts')
          .where('uid', isEqualTo: user!.uid)
          .where('productId', isEqualTo: productId)
          .get();
      var docId = existingCartItems.docs.first.id;
      await _firestore.collection('carts').doc(docId).delete();
      print('Delete cart items success');
    } catch (e) {
      print('Error deleted cart: $e');
    }
  }
}
