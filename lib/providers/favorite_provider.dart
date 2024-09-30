import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:groceries_app/models/favorite.dart';
import 'package:groceries_app/models/product.dart';

class FavoriteProvider extends ChangeNotifier {
  final CollectionReference favoritesCollection = FirebaseFirestore.instance.collection('favorites');

  User? user = FirebaseAuth.instance.currentUser;

  List<String> favoriteProducts = [];

  void loadUser() {
    user = FirebaseAuth.instance.currentUser;
  }
  Future<void> toggleFavorite(String productId) async {
    loadUser();
    if (user != null) {
      // Tìm xem sản phẩm đã có trong danh sách yêu thích chưa
      QuerySnapshot query = await favoritesCollection
          .where('uid', isEqualTo: user!.uid)
          .where('productId', isEqualTo: productId)
          .get();

      if (query.docs.isNotEmpty) {
        // Nếu đã có sản phẩm trong danh sách yêu thích thì xóa
        await favoritesCollection.doc(query.docs.first.id).delete();
      } else {
        // Nếu chưa có thì thêm sản phẩm vào danh sách yêu thích
        await favoritesCollection.add({
          'uid': user!.uid,
          'productId': productId,
        });
      }
      // Gọi notifyListeners để cập nhật UI nếu cần
      notifyListeners();
    } else {
      throw Exception('User is not logged in');
    }
  }

  Future<bool> isFavorite(String productId) async {
    loadUser();
    if (user != null) {
      QuerySnapshot query = await favoritesCollection
          .where('uid', isEqualTo: user!.uid)
          .where('productId', isEqualTo: productId)
          .get();

      return query.docs.isNotEmpty;
    }
    notifyListeners();
    return false;
  }



  // Future<DocumentReference> addFavorite(String productId) async {
  //   loadUser();
  //   if (user != null) {
  //     return await favoritesCollection.add({
  //       'uid': user!.uid,
  //       'productId': productId,
  //     });
  //   }
  //   throw Exception('User is not logged in');
  // }

  Stream<List<Favorite>> get favorite {
    loadUser();
    if (user != null) {
      return favoritesCollection
          .where('uid', isEqualTo: user!.uid)
          .snapshots()
          .map(favoriteListFromSnapshot);
    } else {
      return Stream.value([]);
    }
  }

  List<Favorite> favoriteListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Favorite(id: doc.id, productId: doc['productId'] ?? '1');
    }).toList();
  }

}
