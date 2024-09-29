import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceries_app/constants/colors.dart';

class FormText extends StatefulWidget {
  const FormText({
    super.key,
    required this.nameFormText,
    this.isPasswordField = false,
    required this.textEditingController,
  });

  final String nameFormText;
  final bool isPasswordField;
  final TextEditingController textEditingController;

  @override
  _FormTextState createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 81,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.nameFormText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.subtextColor,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: widget.textEditingController,
            obscureText: widget.isPasswordField ? _obscureText : false,
            obscuringCharacter: "●",
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.textColor,
            ),
            decoration: InputDecoration(
              suffixIcon: widget.isPasswordField
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: SvgPicture.asset(
                  _obscureText
                      ? 'assets/icons/un_eye.svg' // Icon hiển thị mật khẩu
                      : 'assets/icons/eye.svg', // Icon ẩn mật khẩu
                ),
              )
                  : null,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.subtextColor,
                  width: 1,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.subtextColor,
                  width: 1,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.subtextColor,
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
