import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 51,
      child: TextFormField(
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.subtextColor,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          hintText: 'Search ...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: const Color(0xFFF2F3F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent
            )
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent
              )
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent
              )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Colors.transparent
              )
          ),
        ),
      ),
    );
  }
}
