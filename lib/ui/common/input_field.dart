import 'package:base_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputField extends StatefulWidget {
  InputField(
      {Key? key,
      required this.onTextChange,
      required this.labelText,
      this.isPassword = false,
      this.isEmail = false,
      this.isPhone = false,
      this.inputText = "",
      this.isEnabled = true,
      this.maxLength = 30,
      this.size = 20,
      required this.validator,
      this.isNumber = false,
      this.animated = false,
      this.fillColor = Colors.grey})
      : super(key: key);

  final Function onTextChange;
  final String labelText;
  bool isPassword;
  bool isEmail;
  bool isPhone;
  bool isEnabled;
  String? inputText;
  int maxLength;
  double size;
  String? Function(String?)? validator;
  bool isNumber = false;
  bool animated = false;
  Color fillColor;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPassword = false;
  bool isEmail = false;
  bool isPhone = false;
  bool isEnabled = true;
  bool isNumber = false;
  bool animated = false;
  double size = 20;
  Color fillColor = Colors.black;

  String? Function(String?)? validator;
  TextEditingController? controller;

  @override
  void initState() {
    isPassword = widget.isPassword;
    isEmail = widget.isEmail;
    isPhone = widget.isPhone;
    validator = widget.validator;
    size = widget.size;
    controller = TextEditingController();
    isNumber = widget.isNumber;
    animated = widget.animated;
    fillColor = widget.fillColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.inputText != null && widget.inputText!.isNotEmpty) {
      controller?.text = widget.inputText ?? "";
      isEnabled = widget.isEnabled;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        //key: key,
        obscuringCharacter: "*",
        controller: controller,
        enabled: isEnabled,
        obscureText: isPassword,
        maxLength: widget.maxLength,
        keyboardType: isNumber ? TextInputType.number : TextInputType.name,
        inputFormatters: [
          isNumber
              ? FilteringTextInputFormatter.digitsOnly
              : FilteringTextInputFormatter.singleLineFormatter
        ],
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        style: TextStyle(
            fontFamily: "Poppins_Regular",
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: size),
        validator: validator,
        onChanged: (value) => widget.onTextChange(value),
        decoration: InputDecoration(
            prefixIcon: isPhone ? const NumberFieldPrefix() : null,
            suffixIcon: (widget.isPassword)
                ? IconButton(
                    icon: isPassword
                        ? const Icon(Icons.remove_red_eye_outlined)
                        : const Icon(Icons.remove_red_eye_rounded),
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  )
                : null,
            counterText: "",
            floatingLabelBehavior: animated
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.never,
            label: Text(widget.labelText),
            filled: true,
            fillColor: fillColor,
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: textFieldBorderColor)),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: textFieldBorderColor)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: textFieldBorderColor)),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                borderSide: BorderSide(color: textFieldBorderColor))),
      ),
    );
  }
}

class NumberFieldPrefix extends StatelessWidget {
  const NumberFieldPrefix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/images/ic_flag.svg",
            fit: BoxFit.none,
          ),
          const SizedBox(
            width: 8,
          ),
          const Text(
            "+91",
            style: TextStyle(color: Colors.black, fontSize: 14),
          )
        ],
      ),
    );
  }
}
