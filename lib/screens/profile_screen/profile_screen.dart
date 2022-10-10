import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/examples/offerTheRegister_screen.dart';
import 'package:malina_app/global_blocs/user_authorized/authorized_bloc.dart';
import 'package:malina_app/screens/authorization_screens/auth_screen/auth_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Box _tokenBox;
  late Box _refreshTokenBox;
  late Box _deviceIdBox;

  late AuthorizedBloc _authorizedBloc;

  @override
  void initState() {
    _authorizedBloc = AuthorizedBloc();
    _deviceIdBox = Hive.box('deviceIdBox');
    _tokenBox = Hive.box('tokenBox');
    _refreshTokenBox = Hive.box('refreshTokenBox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              Hive.box('tokenBox').delete('token');
              Hive.box('refreshTokenBox').delete('refreshToken');
              Hive.box('deviceIdBox').delete('deviceId');
              log('${_tokenBox.get('token')}');
              log('${_refreshTokenBox.get('refreshToken')}');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const OfferTheRegisterScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              color: ThemeHelper.crimson,
            ),
          ),
        ],
      ),
      body: BlocBuilder<AuthorizedBloc, AuthorizedState>(
        bloc: _authorizedBloc,
        builder: (context, state) {
          if (state is UserAuthorizedState) {
            return const Center(
              child: Text('Profile Screen'),
            );
          }
          return const AuthScreen();
        },
      ),
    );
  }
}
