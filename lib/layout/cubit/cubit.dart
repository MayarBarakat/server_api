import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:server_api/layout/cubit/states.dart';
import 'package:server_api/models/card_quota_model.dart';
import 'package:server_api/models/login_model.dart';
import 'package:server_api/models/ping_model.dart';
import 'package:server_api/module/login/login_screen.dart';
import 'package:server_api/module/menu/menu.dart';
import 'package:server_api/module/products/products_screen.dart';
import 'package:server_api/shared/components/components.dart';
import 'package:server_api/shared/native_helper/native_helper.dart';

import '../../models/proffer_sale_log_model.dart' as pre;
import '../../module/setting/settings_screen.dart';
import '../../shared/consts.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/remote/dio_helper.dart';



class ServerAPICubit extends Cubit<ServerAPIStates>{
  ServerAPICubit():super(ServerAPIInitialState());

  static ServerAPICubit get(context)=>BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> screens = [
    MenuScreen(),
    MenuScreen(),
    SettingsScreen(),

  ];
  List<String> titles = [
    'Menu',
    'Menu',
    'Settings',

  ];

  void changeBottomNav(int index){
    currentIndex = index;
    emit(ServerAPIChangeBottomNavState());
  }
  late PingModel pingModel;
  bool loadPing= true;
  bool startInit= false;

  var pingJson = {
    "err_msg": "",
    "err_code": "200",
    "sv_tm": "2022-09-19 11:53:02",
    "data": {
      "admin_pass": "C9979FCC9107662DB6895EABBDBFB218",
      "dev_sn": "0W320668",
      "fac_name": "سمير عيسى",
      "fac_type": 0,
      "users": [
        {
          "id": 995,
          "username": "إختبار.سـ",
          "pin": "B59C67BF196A4758191E42F76670CEBA",
          "perm": null,
          "session_number": 1,
          "session_status": 1
        }
      ],
      "cities": [
        {
          "id": 1,
          "name": "دمشق"
        },
        {
          "id": 2,
          "name": "السويداء"
        },
        {
          "id": 3,
          "name": "ريف دمشق"
        },
        {
          "id": 4,
          "name": "القنيطرة"
        },
        {
          "id": 5,
          "name": "حلب"
        },
        {
          "id": 6,
          "name": "اللاذقية"
        },
        {
          "id": 7,
          "name": "درعا"
        },
        {
          "id": 8,
          "name": "طرطوس"
        },
        {
          "id": 9,
          "name": "حمص"
        },
        {
          "id": 10,
          "name": "حماه"
        },
        {
          "id": 11,
          "name": "دير الزور"
        },
        {
          "id": 12,
          "name": "ادلب"
        },
        {
          "id": 13,
          "name": "الرقة"
        },
        {
          "id": 14,
          "name": "الحسكة"
        },
        {
          "id": 15,
          "name": "مكيانيك مؤقت"
        },
        {
          "id": 16,
          "name": "دفاع وطني"
        },
        {
          "id": 17,
          "name": "leb"
        },
        {
          "id": 18,
          "name": "njwoaqsk"
        },
        {
          "id": 21,
          "name": "test"
        },
        {
          "id": 22,
          "name": "test1"
        },
        {
          "id": 23,
          "name": "test11"
        },
        {
          "id": 24,
          "name": "T-test"
        },
        {
          "id": 25,
          "name": "test2018-07-11"
        },
        {
          "id": 26,
          "name": "test2018-07-15"
        },
        {
          "id": 27,
          "name": "test2018-07-28"
        },
        {
          "id": 28,
          "name": "Test2018-08-19"
        },
        {
          "id": 29,
          "name": "test"
        },
        {
          "id": 30,
          "name": "test2018-09-27"
        },
        {
          "id": 31,
          "name": "testtest"
        },
        {
          "id": 32,
          "name": "testtesttest"
        },
        {
          "id": 33,
          "name": "test 111 4"
        },
        {
          "id": 34,
          "name": "test 11-7"
        },
        {
          "id": 35,
          "name": "testtest 11_25"
        },
        {
          "id": 36,
          "name": "test 30-12-2018"
        },
        {
          "id": 37,
          "name": "test 30-12-2018"
        },
        {
          "id": 38,
          "name": "داماسكوس"
        },
        {
          "id": 39,
          "name": "حمص"
        },
        {
          "id": 40,
          "name": "DDDamascus"
        },
        {
          "id": 41,
          "name": "test - test -test"
        },
        {
          "id": 42,
          "name": "Operation"
        },
        {
          "id": 43,
          "name": "aaaaaaaa"
        },
        {
          "id": 44,
          "name": "user106_666"
        },
        {
          "id": 45,
          "name": "jablah"
        },
        {
          "id": 46,
          "name": "."
        },
        {
          "id": 50,
          "name": "swaida"
        },
        {
          "id": 51,
          "name": "swaida"
        },
        {
          "id": 52,
          "name": "دمشق"
        },
        {
          "id": 53,
          "name": "هاواي"
        },
        {
          "id": 55,
          "name": "1دمشق"
        },
        {
          "id": 56,
          "name": "طرطوس 1"
        },
        {
          "id": 57,
          "name": "damas"
        },
        {
          "id": 59,
          "name": "دمشق1"
        },
        {
          "id": 60,
          "name": "سيتي"
        },
        {
          "id": 61,
          "name": "مكيانيك مؤقت"
        },
        {
          "id": 62,
          "name": "جبلة"
        }
      ],
      "products": [
        {
          "id": 1,
          "name": "Benzine",
          "unit": "Liter",
          "amount_precision": 2,
          "device_quota": 19981.55
        },
        {
          "id": 2,
          "name": "Diesel",
          "unit": "Liter",
          "amount_precision": 2,
          "device_quota": 0
        }
      ],
      "devices_quota": [],
      "ping_id": 73,
      "setting": {
        "print_twice": 1,
        "pin_code": 0,
        "offline_mode": 0,
        "open_ticket": 0,
        "exceed_balance": 0,
        "print_remaining_balance": 0,
        "printer_font_size": 0,
        "plate_number": 0,
        "only_mobile": 0,
        "epayment": 0,
        "batch": 0,
        "Master_card": 0,
        "print_voucher": 0,
        "enable_deliver": 0,
        "card_master_required": 0,
        "is_garage": 0
      }
    }
  };
  var loginJson = {
    "err_msg": "",
    "err_code": "200",
    "sv_tm": "2022-09-19 11:54:14",
    "data": {
      "session_id": "2657",
      "session_number": "1"
    }
  };
  var cardQuotaJson = {
    "err_msg": "",
    "err_code": "200",
    "sv_tm": "2019-04-30 14:45:35",
    "data": {
      "type": 2,
      "slices": [
        {
          "shortcut": "بنزين0",
          "shortcut_ar": "بنزين0",
          "slice_order": 1,
          "quota": 20.50,
          "price": 225
        },
        {
          "shortcut": "بنزين1",
          "shortcut_ar": "بنزين1",
          "slice_order": 2,
          "quota": 10.89,
          "price": 300
        },
        {
          "shortcut": "بنزين2",
          "shortcut_ar": "بنزين2",
          "slice_order": 3,
          "quota": 999999.99,
          "price": 350
        }
      ],
      "max_quantity": 40
    }
  };
  var prooferSaleJson = {
    "err_msg": "",
    "err_code": "200",
    "sv_tm": "2019-04-30 08:38:57",
    "data": {
      "card_sell_id": "S788",
      "sell_date": "2019-04-30 08:38:56",
      "card_id": "53489",
      "plate_number": "469388",
      "invoice_number": "32",
      "slices": [
        {
          "shortcut": "بنزين0",
          "shortcut_ar": "بنزين0",
          "remaining": 0
        },
        {
          "shortcut": "بنزين1",
          "shortcut_ar": "بنزين1",
          "remaining": 151.89
        },
        {
          "shortcut": "بنزين2",
          "shortcut_ar": "بنزين2",
          "remaining": 999999.99
        }
      ]
    }
  };
  Future<void> ping(context)async{
    startInit = true;
    emit(ServerAPIPingLoadingState());
    DioHelper.getData(
        url:PING,
      query:{
          'dev_sn':dev_sn,
        'app_version':'NewProffer6.0.2.2'
      }
    ).then((value){
      pingModel = PingModel.fromJson(value.data);
      loadPing = false;
      startInit = false;
     pingModel.data!.users?.forEach((element) {
       dropDownItems.add(element.username);
     });
      pingModel.data!.products?.forEach((element) {
        dropDownProductItems.add(element.name);
      });
      emit(ServerAPIPingState());
      navigateAndFinish(context, LoginScreen());
    }).catchError((onError){
      print(onError.toString());
      emit(ServerAPIPingErrorState());
    });
  }
  String dropDownSelectedValue = 'Choose user';
  List<String?> dropDownItems = ['Choose user',];
  void chooseDropDownItem(value){
    dropDownSelectedValue = value;
    emit(ServerAPISelectUserStateState());

  }
  String generateMd5(String input) {

    return md5.convert(utf8.encode(input)).toString().toUpperCase();
  }
  bool loginLoading = false;
  late LoginModel loginModel;
  late Users currentUser;
  Future<void> login(context,pin)async{
    loginLoading = true;
    emit(ServerAPILoginLoadingState());


    DioHelper.getData(
        url: LOGIN,
      query: {
        'dev_sn':dev_sn,
        'app_version':'NewProffer6.0.2.1',
        'user_id':pingModel.data!.users!.firstWhere((element) => element.username ==dropDownSelectedValue ).id,
        'pass':pin,
      }
    ).then((value){
      loginModel = LoginModel.fromJson(value.data);
      loginLoading = false;
      emit(ServerAPILoginSuccessState());
      navigateAndFinish(context,ProductsScreen());
    }).catchError((error){
      print(error.toString());
      emit(ServerAPILoginErrorState());
    });
  }
  String dropDownSelectedProduct = 'Choose Product';
  List<String?> dropDownProductItems = ['Choose Product',];
  void chooseDropDownProductItem(value){
    dropDownSelectedProduct = value;
    emit(ServerAPISelectProductStateState());

  }

  late CardQuotaModel cardQuotaModel;
  bool cardQuotaLoading = false;
  bool cardQuotaShowData = false;
  String cardRFID = '';

  Future<void> getCardQuotaData(context)async{
    cardQuotaLoading = true;
    cardQuotaShowData = false;
    emit(ServerAPICardQuotaLoadingState());
    // cardQuotaModel = CardQuotaModel.fromJson(cardQuotaJson);
    cardRFID =  await NativeHelper.readRFID();
    if(cardRFID == 'TimeOut'){
      cardQuotaLoading = false;
      cardQuotaShowData = false;
      emit(ServerAPICardQuotaTimeoutState());
    }else{
      DioHelper.getData(
          url: CARDQUOTA,
          query: {
            'dev_sn':dev_sn,
            'app_version':'NexProffer6.0.2.1',
            'user_id':pingModel.data!.users!.firstWhere((element) => element.username ==dropDownSelectedValue ).id,
            'card_sn':cardRFID,
            'product_id':pingModel.data!.products!.firstWhere((element) => element.name ==dropDownSelectedProduct ).id,

          }
      ).then((value){
        cardQuotaModel = CardQuotaModel.fromJson(value.data);
        print(cardQuotaModel.data!.maxQuantity);
        cardQuotaLoading = false;
        cardQuotaShowData = true;
        emit(ServerAPICardQuotaSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(ServerAPICardQuotaErrorState());
      });
    }



  }
  void changeShowDataInNormalSale(){
    cardQuotaShowData = false;
    cardQuotaLoading = false;
    emit(ServerAPIChangeShowDataInNormalStateState());
  }

  late Products currentProduct;
  void selectCurrentProduct() {
    currentProduct = pingModel.data!.products!.firstWhere((element) => element.name ==dropDownSelectedProduct );
    emit(ServerAPISelectCurrentProductState());
  }

  bool validateTheAmount(double amount,context) {
    if(amount>double.parse(cardQuotaModel.data!.maxQuantity.toString())){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Amount Is More Than Max Quantity'),
            backgroundColor: Colors.red,

          ));
      return false;
    }
    if(amount <= 00.00){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Amount Is Less Than 00.00'),
            backgroundColor: Colors.red,

          ));
      return false;
    }


    return true;
  }
  int saleIndex = 0;
  double quantityRequired = 0;
  String billPrint = '';
  double totalPrice = 0.0; // final price of required quantity
  void calculateBill(double required){
    totalPrice = 0.0;
    billPrint = '';
    quantityRequired = required;
    double remindQuota = required;  // remaining quota, changes along

    List<Slices> slices = cardQuotaModel.data!.slices!;

    slices.forEach((element) {
      if(element.quota >= remindQuota){
        totalPrice += remindQuota * element.price!;
        // ${remindQuota.toStringAsFixed(2)};
        double number = remindQuota * element.price!;
        billPrint += '${element.shortcutAr} : لتر ${remindQuota.toStringAsFixed(2)} × سعر اللتر ${element.price} = ${number.toStringAsFixed(2)}\n';
        remindQuota = 0.0;
      }
      else if(element.quota <= remindQuota && remindQuota != 0.0){
        totalPrice +=  element.quota * element.price!;
       double elementQuota =  element.quota;
        double number = element.quota * element.price;
        billPrint += '${element.shortcutAr} : لتر ${elementQuota.toStringAsFixed(2)} × سعر اللتر ${element.price} = ${number.toStringAsFixed(2)}\n';
        remindQuota -= element.quota;

      }
    });

    // double firstSliceQuota = cardQuotaModel.data!.slices!.elementAt(0).quota;
    // double secondSliceQuota = cardQuotaModel.data!.slices!.elementAt(1).quota;
    // double thirdSliceQuota = cardQuotaModel.data!.slices!.elementAt(2).quota;
    //
    //
    // double? firstSlicePrice = double.parse(cardQuotaModel.data!.slices!.elementAt(0).price.toString());
    // double? secondSlicePrice = double.parse(cardQuotaModel.data!.slices!.elementAt(1).price.toString());
    // double? thirdSlicePrice = double.parse(cardQuotaModel.data!.slices!.elementAt(2).price.toString());
    //
    // if(firstSliceQuota > remindQuota){
    //   finalPrice += remindQuota * firstSlicePrice!;
    //   remindQuota = 0.0;
    // }
    // else if(firstSliceQuota <= remindQuota){
    //  finalPrice +=  firstSliceQuota * firstSlicePrice!;
    //  remindQuota -= firstSliceQuota;
    // }
    // if(secondSliceQuota > remindQuota && remindQuota >= 0.01){
    //   finalPrice += remindQuota * secondSlicePrice!;
    //   remindQuota = 0.0;
    // }
    // else if(remindQuota > 0.00 && secondSliceQuota <= remindQuota){
    //   finalPrice +=  secondSliceQuota * secondSlicePrice!;
    //   remindQuota -= secondSliceQuota;
    // }
    // if(remindQuota > 0.00 ){
    //   finalPrice +=  remindQuota * thirdSlicePrice!;
    //   remindQuota = 0.0;
    // }
    // print(finalPrice);
  }
  late pre.ProoferSaleLogModel prooferSaleLogModel = pre.ProoferSaleLogModel();
  bool hasProoferSaleLogInit = false;
  void initProoferSaleLog(){
    // var test = jsonEncode(pingModel.data!.settings);
    // prooferSaleLogModel.settings =pre.Settings.fromJson(jsonDecode(test));
    // prooferSaleLogModel.sessionId = loginModel.data!.sessionId;
    // prooferSaleLogModel.adminPass = pingModel.data!.adminPass;
    // prooferSaleLogModel.salesIndex = saleIndex.toString();
    hasProoferSaleLogInit = true;
    emit(ServerAPIProoferSaleLogInitState());
  }

  bool sendSaleToServer = false;
  Future<bool> addSaleIndex()async {
    sendSaleToServer = true;
    emit(ServerAPISendToServerLoadingState());

    DateTime now = DateTime.now();
    DioHelper.getData(
        url: DATA_FROM_USER,
        query: {
          'cardId':cardRFID,
          'time':'${now.year.toString()} : ${now.month.toString()} : ${now.day.toString()} : ${now.hour.toString()} : ${now.minute.toString()} : ${now.second.toString()}',
          'totalPrice':totalPrice,
          'quantityRequired':quantityRequired,
          'sensorLevel':sendToHardware,
        },
    ).then ((value){
      sendSaleToServer = false;
      saleIndex ++;
      prooferSaleLogModel.salesIndex = saleIndex.toString();
      emit(ServerAPISendToServerSuccessState());
      return true;
    }).onError((error, stackTrace){
      print(error.toString() + stackTrace.toString());
      sendSaleToServer = false;
      emit(ServerAPISendToServerErrorState());
      return false;
    });
    return true;
  }
  String dataFromHardware = '';
  String sendToHardware = '';
  Future<void> sendCommand()async{
    // sendToHardware = await NativeHelper.sendCommand();
    sendToHardware = '0.00 %';
    emit(ServerAPISendCommandStateState());

  }


}