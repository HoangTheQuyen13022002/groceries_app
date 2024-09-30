import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/models/categories.dart';

class CategoryProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Categories> _categories = [];

  List<Categories> get categories => _categories;

  Future<void> fetchCategory() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('categories').get();
      _categories = snapshot.docs
          .map((doc) => Categories.fromMap(doc.data() as Map<String,dynamic>)).toList();
      notifyListeners();
    } catch (e) {
      print("Error fetching category: $e");
    }
  }

}
