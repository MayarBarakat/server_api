import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:server_api/layout/cubit/cubit.dart';
import 'package:server_api/layout/cubit/states.dart';
import 'package:server_api/module/normal_sale/normal_sale_screen.dart';
import 'package:server_api/shared/components/components.dart';
import 'package:server_api/shared/styles/icon_broken.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServerAPICubit,ServerAPIStates>(
       listener: (context,state){},
        builder: (context,state){
         var cubit = ServerAPICubit.get(context);
         return  SingleChildScrollView(
           physics: BouncingScrollPhysics(),
             child: Container(
               width: double.infinity,
               child: Column(
                 children: [
                 Padding(
                   padding: const EdgeInsets.all(14.0),
                  child: GridView.count(
                      crossAxisCount:2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 8,
                    padding: EdgeInsets.all(6),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.blueAccent,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.white,

                          child: SizedBox(
                            height: 250,
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: Icon(Icons.add_card,color: Colors.blue,size: 100),
                                ),
                                Container(
                                  width: double.infinity,
                                  height:6,
                                  color: Colors.blue,
                                ),
                                SizedBox(height: 12,),
                                const Center(
                                  child: Text('Normal Sale',style: TextStyle(color: Colors.blue,fontSize: 16),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NormalSaleScreen())).then((_){
                            // This method gets callback after your SecondScreen is popped from the stack or finished.
                            cubit.changeShowDataInNormalSale();
                          });
                        },
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blueAccent,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.white,

                        child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Icon(Icons.add_card,color: Colors.blue,size: 100),
                              ),
                              Container(
                                width: double.infinity,
                                height:6,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 12,),
                              Center(
                                child: Text('Proofer Sell',style: TextStyle(color: Colors.blue,fontSize: 16),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blueAccent,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.white,

                        child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Icon(Icons.add_card,color: Colors.blue,size: 100),
                              ),
                              Container(
                                width: double.infinity,
                                height:6,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 12,),
                              Center(
                                child: Text('Proofer Sell',style: TextStyle(color: Colors.blue,fontSize: 16),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blueAccent,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.white,

                        child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Icon(Icons.add_card,color: Colors.blue,size: 100),
                              ),
                              Container(
                                width: double.infinity,
                                height:6,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 12,),
                              Center(
                                child: Text('Proofer Sell',style: TextStyle(color: Colors.blue,fontSize: 16),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        shadowColor: Colors.blueAccent,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.white,

                        child: SizedBox(
                          height: 250,
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Icon(Icons.add_card,color: Colors.blue,size: 100),
                              ),
                              Container(
                                width: double.infinity,
                                height:6,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 12,),
                              Center(
                                child: Text('Proofer Sell',style: TextStyle(color: Colors.blue,fontSize: 16),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                 ),
                 ],
               ),
             ),
           );

        },

    );
  }
}
