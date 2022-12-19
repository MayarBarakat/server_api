import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:server_api/layout/cubit/cubit.dart';
import 'package:server_api/layout/cubit/states.dart';
import 'package:server_api/module/check/check_screen.dart';
import 'package:server_api/shared/native_helper/native_helper.dart';
import 'package:server_api/shared/network/local/cache_helper.dart';
import 'package:server_api/shared/network/remote/dio_helper.dart';

import 'bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  List<String> ipAndPorts = ['185.134.132.89'];
 await CacheHelper.saveData(key: 'ipAndPorts', value: ipAndPorts);
  await DioHelper.init();
  await NativeHelper.sdkInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context)=>ServerAPICubit()
        ),
      ],
      child: BlocConsumer<ServerAPICubit,ServerAPIStates>(
        listener: (context,state){},
        builder: (context,state){
          return OverlaySupport.global(
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const CheckScreen(),
            ),
          );
        },
      ),
    );
  }
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}



