import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:server_api/layout/cubit/cubit.dart';
import 'package:server_api/layout/cubit/states.dart';


class NormalSaleScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var firstNumberController = TextEditingController();
  var secondNumberController = TextEditingController();
  var thirdNumberController = TextEditingController();
  var fourthNumberController = TextEditingController();
  final FocusNode unitCodeCtrlFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServerAPICubit,ServerAPIStates>(
       listener: (context,state){},
        builder: (context,state){
         var cubit = ServerAPICubit.get(context);
         return Scaffold(
           appBar: AppBar(
             title: const Text('Normal Sale'),
             centerTitle: true,
           ),
           body:SingleChildScrollView(
             physics: const BouncingScrollPhysics(),
             child: Form(
               key: _formKey,
               child: Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Container(
                   width: double.infinity,
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(13.0),
                         child: MaterialButton(
                           onPressed: cubit.cardQuotaLoading?null:() {
                             cubit.getCardQuotaData(context);
                           },
                           color: Colors.blue,
                           height: 60,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15)),
                           elevation: 10,
                           minWidth: double.infinity,
                           splashColor: Colors.amber,
                           child: const Text(
                             'Attach Your Card',
                             style: TextStyle(
                                 color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),
                           ),
                         ),
                       ),
                      cubit.cardQuotaLoading? Center(
                         child: Lottie.asset('assets/tap_card.json', ),
                       ):const SizedBox(),
                       cubit.cardQuotaShowData?Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Card RF-ID : ${cubit.cardRFID}',
                               style: const TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold
                               ),
                             ),
                           ),
                           const SizedBox(height: 20,),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text('Time : ${cubit.cardQuotaModel.svTm.toString()}\n'
                                 'type : ${cubit.cardQuotaModel.data!.type.toString()}\n \n'
                                 'Slices :',
                               style: const TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold
                               ),
                             ),
                           ),
                           SizedBox(
                               child: buildSlices(context)
                           ),
                           Container(
                             decoration: BoxDecoration(
                               color: Colors.lightBlueAccent,
                               borderRadius: BorderRadius.circular(15),
                               border: Border.all(),
                             ),
                             width: double.infinity,
                             height: 50,

                             child: Center(
                               child: Text(
                                 'Max Quantity : ${cubit.cardQuotaModel.data!.maxQuantity}',
                                 style: const TextStyle(
                                     color: Colors.white,
                                     fontSize: 18,
                                     fontWeight: FontWeight.bold
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(height: 20,),
                           Container(
                             height: 40,
                             width: double.infinity,
                             child: const Center(
                               child: Text(
                                 'Enter How Much You Want',
                                 style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 30
                                 ),
                               ),
                             ),
                           ),
                           const SizedBox(height: 20,),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               SizedBox(
                                 height: 68,
                                 width: 64,
                                 child: Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(12),
                                     border: Border.all()
                                   ),
                                   child: TextFormField(
                                     controller: firstNumberController,
                                     focusNode: unitCodeCtrlFocusNode,
                                     decoration: const InputDecoration(
                                       border: InputBorder.none,
                                     ),
                                     onChanged: (value){
                                       if(value.length == 1){
                                         FocusScope.of(context).nextFocus();
                                       }
                                       if(value.length == 0){
                                         FocusScope.of(context).previousFocus();
                                       }
                                     },
                                     style: Theme.of(context).textTheme.headline6,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 height: 68,
                                 width: 64,
                                 child: Container(
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(12),
                                       border: Border.all()
                                   ),
                                   child: TextFormField(
                                     controller: secondNumberController,
                                     decoration: const InputDecoration(
                                       border: InputBorder.none
                                     ),
                                     onChanged: (value){
                                       if(value.length == 1){
                                         FocusScope.of(context).nextFocus();
                                       }
                                       if(value.length == 0){
                                         FocusScope.of(context).previousFocus();
                                       }
                                     },
                                     style: Theme.of(context).textTheme.headline6,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                   ),
                                 ),
                               ),
                               const SizedBox(
                                 height: 58,
                                 width: 40,
                                 child: Center(
                                   child: Text('.',style: TextStyle(
                                     fontSize: 60,
                                     fontWeight: FontWeight.bold,

                                   ),),
                                 ),
                               ),
                               SizedBox(
                                 height: 68,
                                 width: 64,
                                 child: Container(
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(12),
                                       border: Border.all()
                                   ),
                                   child: TextFormField(
                                     controller: thirdNumberController,
                                     decoration: const InputDecoration(
                                       border: InputBorder.none
                                     ),
                                     onChanged: (value){
                                       if(value.length == 1){
                                         FocusScope.of(context).nextFocus();
                                       }
                                       if(value.isEmpty){
                                         FocusScope.of(context).previousFocus();
                                       }
                                     },
                                     style: Theme.of(context).textTheme.headline6,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                   ),
                                 ),
                               ),
                               SizedBox(
                                 height: 68,
                                 width: 64,
                                 child: Container(
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(12),
                                       border: Border.all()
                                   ),
                                   child: TextFormField(
                                     controller: fourthNumberController,
                                     onChanged: (value){
                                       if(value.isEmpty){
                                         FocusScope.of(context).previousFocus();
                                       }
                                     },

                                     decoration: const InputDecoration(
                                       border: InputBorder.none
                                     ),
                                     style: Theme.of(context).textTheme.headline6,
                                     keyboardType: TextInputType.number,
                                     textAlign: TextAlign.center,
                                     inputFormatters: [
                                       LengthLimitingTextInputFormatter(1),
                                       FilteringTextInputFormatter.digitsOnly,
                                     ],
                                   ),
                                 ),
                               ),
                             ],
                           ),
                           const SizedBox(height: 40,),
                           Padding(
                             padding: const EdgeInsets.all(13.0),
                             child: MaterialButton(
                               onPressed: () async{
                                 if(firstNumberController.text.isEmpty || secondNumberController.text.isEmpty){
                                   ScaffoldMessenger.of(context).showSnackBar(
                                       const SnackBar(
                                           content: Text('Empty Value'),
                                         backgroundColor: Colors.red,

                                   ));
                                 }
                                 else{
                                   if(thirdNumberController.text.isEmpty){
                                     thirdNumberController.text = '0';
                                   }
                                   if(fourthNumberController.text.isEmpty){
                                     fourthNumberController.text = '0';
                                   }
                                   if(firstNumberController.text.isEmpty){
                                     firstNumberController.text = '0';
                                   }
                                   if(secondNumberController.text.isEmpty){
                                     secondNumberController.text = '0';
                                   }
                                   String allEnteredNumber = firstNumberController.text + secondNumberController.text +'.'+ thirdNumberController.text
                                       + fourthNumberController.text;
                                   double amount = double.parse(allEnteredNumber);
                                   await cubit.sendCommand();
                                   if( cubit.validateTheAmount(amount,context)){
                                     cubit.calculateBill(amount);
                                     showDialog(
                                         context: context,
                                         useSafeArea: true,
                                         builder: (context){
                                       return CupertinoAlertDialog(
                                         actions: [
                                           CupertinoDialogAction(
                                             child: const Text('No'),
                                             onPressed: (){
                                               firstNumberController.text = '';
                                               secondNumberController.text = '';
                                               thirdNumberController.text = '';
                                               fourthNumberController.text = '';
                                               FocusScope.of(context).unfocus();
                                               Navigator.pop(context);

                                             },
                                           ),
                                           CupertinoDialogAction(
                                             child: const Text('yes'),
                                             onPressed: () async {

                                               cubit.changeShowDataInNormalSale();
                                               if(!cubit.hasProoferSaleLogInit){
                                                 cubit.initProoferSaleLog();
                                               }
                                               Navigator.pop(context);
                                              bool successSent = await cubit.addSaleIndex();
                                              if(successSent){
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                      content: Text('Data has been send successfully'),
                                                      backgroundColor: Colors.green,
                                                    )
                                                );
                                              }else{
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    const SnackBar(
                                                      content: Text('Error message'),
                                                      backgroundColor: Colors.red,
                                                    )
                                                );
                                              }
                                             },
                                           ),
                                         ],
                                         title: const Text('Confirm The Operation'),
                                         content:cubit.sendSaleToServer?const Center(child: CircularProgressIndicator(),): SizedBox(
                                           width: double.infinity,
                                           child: Column(
                                             children: [
                                               Lottie.asset('assets/card_found.json'),
                                               Text('${cubit.billPrint}\n'
                                                   'Total Price : ${cubit.totalPrice}\n\n'
                                                   'Command To Hardware : ${cubit.sendToHardware}\n',
                                                 style: const TextStyle(
                                                   fontSize: 20,

                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),

                                       );
                                     },
                                       barrierDismissible: false,
                                     );
                                   }
                                 }
                               },
                               color: Colors.blue,
                               height: 40,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(15)),
                               elevation: 10,
                               minWidth: double.infinity,
                               splashColor: Colors.amber,
                               child: const Text(
                                 'buy',
                                 style: TextStyle(
                                     color: Colors.white, fontWeight: FontWeight.bold),
                               ),
                             ),
                           ),
                           const SizedBox(height: 30,),


                         ],
                       ):const SizedBox(),

                     ],
                   ),
                 ),
               ),
             ),
           ),
         );
        },

    );
  }
  Widget buildSlices(context){
    var cubit = ServerAPICubit.get(context);
    return Container(
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,

          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Text('Slice Number ${index+1} \n'
                'shortcut : ${cubit.cardQuotaModel.data!.slices!.elementAt(index).shortcut}\n'
                'shortcut_ar : ${cubit.cardQuotaModel.data!.slices!.elementAt(index).shortcutAr}\n'
                'slice_order : ${cubit.cardQuotaModel.data!.slices!.elementAt(index).sliceOrder}\n'
                'quota : ${cubit.cardQuotaModel.data!.slices!.elementAt(index).quota}\n'
                'price : ${cubit.cardQuotaModel.data!.slices!.elementAt(index).price}\n',
              style: const TextStyle(fontSize: 16,color: Colors.blue,),
            );
          },
          separatorBuilder: (context,index){
             return const SizedBox(width:10,);
      },
            itemCount: cubit.cardQuotaModel.data!.slices!.length

      ),
    );
  }
}
