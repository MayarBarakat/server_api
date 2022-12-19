import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:server_api/layout/cubit/cubit.dart';
import 'package:server_api/layout/cubit/states.dart';
import 'package:server_api/shared/styles/icon_broken.dart';

class ServerLayout extends StatelessWidget {
  const ServerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ServerAPICubit,ServerAPIStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit  = ServerAPICubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            centerTitle: true,
          ),
          body:cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },

            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Profile,
                ),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Edit,
                ),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Settings',
              ),

            ],
          ),
        );
      },
    );
  }
}
