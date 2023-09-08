// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:widget_app/bloc/login/login_bloc.dart';
import 'package:widget_app/bloc/login/login_event.dart';
import 'package:widget_app/bloc/login/login_state.dart';
import 'package:widget_app/components/navigationBar.dart';

import 'screen/splashScreen.dart';
import 'utils/prefs.dart';

void main() async {
  // runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigation Basics',
    home: const MyApp(),
    builder: EasyLoading.init(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginBloc()..add(const LoginEvent()),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return AnimatedContainer(
                duration: const Duration(seconds: 1),
                child: state.loginSuccess
                    ? const MyNavigationBar()
                    : const SplashScreen());
          },
        ),
      ),
    );
  }
}

class SubView extends StatelessWidget {
  const SubView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Push to SubView",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SubView2()));
              },
              icon: const Icon(Icons.chevron_right))
        ]),
      ),
    );
  }
}

class SubView2 extends StatelessWidget {
  const SubView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TTTT"),
        ),
        body: Container(
          color: Colors.blue,
          child: const Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "12312312312312",
                textDirection: TextDirection.ltr,
                style: TextStyle(color: Colors.white, fontSize: 32),
              )
            ]),
          ),
        ));
  }
}
