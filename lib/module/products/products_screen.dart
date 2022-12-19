import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:server_api/layout/cubit/cubit.dart';
import 'package:server_api/layout/cubit/states.dart';
import 'package:server_api/layout/server_layout.dart';
import 'package:server_api/shared/components/components.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServerAPICubit,ServerAPIStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = ServerAPICubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Products'),
              centerTitle: true,
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SizedBox(

                        width: double.infinity,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(width: 3),
                              )),
                          value: cubit.dropDownSelectedProduct,
                          items: cubit.dropDownProductItems
                              .map((item) => DropdownMenuItem(
                            child: Text(item!),
                            value: item,
                          ))
                              .toList(),
                          onChanged: (value) {
                            cubit.chooseDropDownProductItem(value);
                          },
                        ),
                      ),
                    ),
                  ),
                  cubit.cardQuotaLoading?Center(child: CircularProgressIndicator(),):Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: MaterialButton(
                      onPressed: () {
                        cubit.selectCurrentProduct();
                        navigateAndFinish(context, ServerLayout());
                        // cubit.getCardQuotaData(context);


                      },
                      color: Colors.blue,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                      minWidth: double.infinity,
                      splashColor: Colors.amber,
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
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
