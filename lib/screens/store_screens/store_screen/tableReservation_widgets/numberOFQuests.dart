import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class NumberOfQuestsWidget extends StatefulWidget {
  const NumberOfQuestsWidget({super.key});

  @override
  State<NumberOfQuestsWidget> createState() => _NumberOfQuestsWidgetState();
}

class _NumberOfQuestsWidgetState extends State<NumberOfQuestsWidget> {
  late TextEditingController _controller;
  int _quantity = 0;

  @override
  void initState() {
    _controller = TextEditingController(text: _quantity.toString());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _increQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        addButton(
          () => _decreQuantity(),
          Icon(
            Icons.remove,
            color: ThemeHelper.blackDial,
          ),
        ),
        SizedBox(
          width: 35.w,
          height: 35.h,
          child: TextFormField(
            controller: TextEditingController(text: _quantity.toString()),
            style: TextStyleHelper.f18w600.copyWith(
              color: ThemeHelper.blackDial,
              fontWeight: FontWeight.w700,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            cursorColor: ThemeHelper.blackDial,
            cursorHeight: 19.5.h,
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: TextStyleHelper.f18w600.copyWith(
                color: ThemeHelper.blackDial,
                fontWeight: FontWeight.w700,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              _quantity++;
            },
          ),
        ),
        addButton(
          () {
            _increQuantity();
          },
          Icon(
            Icons.add,
            color: ThemeHelper.blackDial,
          ),
        ),
      ],
    );
  }

  Material addButton(Function() onPressed, Icon iconName) {
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        onTap: () => onPressed(),
        onLongPress: () => onPressed(),
        borderRadius: BorderRadius.circular(10.r),
        child: Ink(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: ThemeHelper.bejGray,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: iconName,
          ),
        ),
      ),
    );
  }
}
