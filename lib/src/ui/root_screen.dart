import 'package:flutter/material.dart';
import 'package:kwizny/src/blocs/bloc_auth_bloc.dart';
import 'package:kwizny/src/blocs/bloc_base.dart';
import 'package:kwizny/src/ui/widgets/log_out_button.dart';


class RootScreen extends StatefulWidget{
  final String email;

  RootScreen(this.email);

  @override
  RootScreenState createState() {
    return new RootScreenState();
  }
}

class RootScreenState extends State<RootScreen> {

  @override
  Widget build(BuildContext context){
    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      body: LogOutButton(),
    );
  }
}