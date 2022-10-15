import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/screens/authorization_screens/register_screen/bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  late RegisterBloc _registerBloc;
  late Box deviceToken;

  @override
  void initState() {
    _registerBloc = RegisterBloc();
    deviceToken = Hive.box('deviceTokenBox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UniversalRegisterTextFormField(
              controller: nameController,
              hinText: 'Введите имя',
            ),
            UniversalRegisterTextFormField(
              controller: surNameController,
              hinText: 'surname',
            ),
            UniversalRegisterTextFormField(
              controller: loginController,
              hinText: 'login',
            ),
            UniversalRegisterTextFormField(
              controller: phoneController,
              hinText: 'phone',
              textInputType: TextInputType.phone,
            ),
            UniversalRegisterTextFormField(
              controller: emailController,
              hinText: 'email',
              textInputType: TextInputType.emailAddress,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              bloc: _registerBloc,
              listener: (context, state) {
                if (state is ErrorRegisterState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message.toString(),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingRegisterState) {
                  return const LoadingIndicatorWidget();
                }
                return ElevatedButton(
                  onPressed: () {
                    // Box tokenBox = Hive.box('tokenBox');
                    // log(tokenBox.get('token').toString());
                    log(deviceToken.get('deviceId').toString());
                    _registerBloc.add(
                      PostRegisterEvent(
                        name: nameController.text,
                        surName: surNameController.text,
                        login: loginController.text,
                        phone: phoneController.text,
                        email: emailController.text,
                        deviceId: deviceToken.get('deviceId').toString(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300.w, 28.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Подтвердить',
                    style: TextStyleHelper.f16w500
                        .copyWith(color: ThemeHelper.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UniversalRegisterTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final TextInputType textInputType;

  const UniversalRegisterTextFormField({
    Key? key,
    required this.controller,
    required this.hinText,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      height: 44.h,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle:
              TextStyleHelper.f14w400.copyWith(color: ThemeHelper.greyDial),
          filled: true,
          fillColor: ThemeHelper.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: ThemeHelper.lightGrey),
          ),
        ),
      ),
    );
  }
}
