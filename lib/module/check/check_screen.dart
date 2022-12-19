import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:server_api/layout/cubit/cubit.dart';
import 'package:server_api/layout/cubit/states.dart';
import 'package:server_api/module/login/login_screen.dart';
import 'package:server_api/shared/components/components.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;
  late StreamSubscription subscription;
  late StreamSubscription internetSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription =  Connectivity().onConnectivityChanged.listen((event) {
      setState(() {
        this.result = event;
      });
    });
    internetSubscription =  InternetConnectionChecker().onStatusChange.listen((event) {
      final hasInternet = event == InternetConnectionStatus.connected;
      setState(() {
        this.hasInternet = hasInternet;
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
    internetSubscription.cancel();
  }
  @override
  Widget build(BuildContext context) {

    var cubit  = ServerAPICubit.get(context);

    return BlocConsumer<ServerAPICubit,ServerAPIStates>(
       listener: (context,state){
         if(state is ServerAPIPingLoadingState){

         }
       },
        builder: (context,state){
         return Scaffold(
           appBar: AppBar(
             title: Text('Check'),
             centerTitle: true,
           ),
           body: Center(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(13.0),
                   child: MaterialButton(
                     onPressed: () async {
                       hasInternet =  await InternetConnectionChecker().hasConnection;
                      result = await Connectivity().checkConnectivity();
                       final color = hasInternet?Colors.green:Colors.red;
                       final text = hasInternet?'Internet':'No Internet';
                       await cubit.ping(context);
                       // if(result == ConnectivityResult.mobile){
                       //
                       //   showSimpleNotification(
                       //     Text(
                       //       '$text : Mobile Network',
                       //       style: TextStyle(color: Colors.white,fontSize: 20),
                       //     ),
                       //     background: color,
                       //
                       //   );
                       // }
                       // else if(result == ConnectivityResult.wifi){
                       //
                       //   showSimpleNotification(
                       //     Text(
                       //       '$text : WIFI Network',
                       //       style: TextStyle(color: Colors.white,fontSize: 20),
                       //     ),
                       //     background: color,
                       //
                       //   );
                       //
                       //
                       //
                       // }
                       // else{
                       //   showSimpleNotification(
                       //     Text(
                       //       '$text : WIFI Network',
                       //       style: TextStyle(color: Colors.white,fontSize: 20),
                       //     ),
                       //     background: color,
                       //
                       //   );
                       // }
                     },
                     color: Colors.blue,
                     height: 40,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(15)),
                     elevation: 10,
                     minWidth: double.infinity,
                     splashColor: Colors.amber,
                     child: const Text(
                       'start Init',
                       style: TextStyle(
                           color: Colors.white, fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
                 SizedBox(height: 12,),
                 if(cubit.startInit)
                 cubit.loadPing?Center(child: CircularProgressIndicator(),):Text('Data From Ping has been init${cubit.pingModel.errCode}')
               ],
             ),
           ),

         );
        },

    );
  }
}
