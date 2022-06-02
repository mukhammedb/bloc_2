import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/internet_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
           if (state is InternetGainetdState){
             return Text('Connected');

           } else if(state is InternetLoastState){
             return Text('Not Connected');
           }
           else {
             return Text('Loading..');
           }
          },
        ),
      ),
    ));
  }
}
