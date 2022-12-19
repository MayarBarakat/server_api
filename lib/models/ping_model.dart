class PingModel {
  String? errMsg;
  String? errCode;
  String? svTm;
  Data? data;

  PingModel({
    this.errMsg,
    this.errCode,
    this.svTm,
    this.data,
  });

  PingModel.fromJson(Map<String, dynamic> json) {
    errMsg = json['err_msg'] as String?;
    errCode = json['err_code'] as String?;
    svTm = json['sv_tm'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['err_msg'] = errMsg;
    json['err_code'] = errCode;
    json['sv_tm'] = svTm;
    json['data'] = data?.toJson();
    return json;
  }
}

class Data {
  String? adminPass;
  String? devSn;
  String? facName;
  int? facType;
  List<Users>? users;
  List<Cities>? cities;
  List<Products>? products;
  List<dynamic>? devicesQuota;
  int? pingId;
  Settings? settings;

  Data({
    this.adminPass,
    this.devSn,
    this.facName,
    this.facType,
    this.users,
    this.cities,
    this.products,
    this.devicesQuota,
    this.pingId,
    this.settings,
  });

  Data.fromJson(Map<String, dynamic> json) {
    adminPass = json['admin_pass'] as String?;
    devSn = json['dev_sn'] as String?;
    facName = json['fac_name'] as String?;
    facType = json['fac_type'] as int?;
    users = (json['users'] as List?)?.map((dynamic e) => Users.fromJson(e as Map<String,dynamic>)).toList();
    cities = (json['cities'] as List?)?.map((dynamic e) => Cities.fromJson(e as Map<String,dynamic>)).toList();
    products = (json['products'] as List?)?.map((dynamic e) => Products.fromJson(e as Map<String,dynamic>)).toList();
    devicesQuota = json['devices_quota'] as List?;
    pingId = json['ping_id'] as int?;
    settings = (json['setting'] as Map<String,dynamic>?) != null ? Settings.fromJson(json['setting'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['admin_pass'] = adminPass;
    json['dev_sn'] = devSn;
    json['fac_name'] = facName;
    json['fac_type'] = facType;
    json['users'] = users?.map((e) => e.toJson()).toList();
    json['cities'] = cities?.map((e) => e.toJson()).toList();
    json['products'] = products?.map((e) => e.toJson()).toList();
    json['devices_quota'] = devicesQuota;
    json['ping_id'] = pingId;
    json['setting'] = settings?.toJson();
    return json;
  }
}

class Users {
  int? id;
  String? username;
  String? pin;
  dynamic perm;
  int? sessionNumber;
  int? sessionStatus;

  Users({
    this.id,
    this.username,
    this.pin,
    this.perm,
    this.sessionNumber,
    this.sessionStatus,
  });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    username = json['username'] as String?;
    pin = json['pin'] as String?;
    perm = json['perm'];
    sessionNumber = json['session_number'] as int?;
    sessionStatus = json['session_status'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['username'] = username;
    json['pin'] = pin;
    json['perm'] = perm;
    json['session_number'] = sessionNumber;
    json['session_status'] = sessionStatus;
    return json;
  }
}

class Cities {
  int? id;
  String? name;

  Cities({
    this.id,
    this.name,
  });

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}

class Products {
  int? id;
  String? name;
  String? unit;
  int? amountPrecision;
  dynamic deviceQuota;

  Products({
    this.id,
    this.name,
    this.unit,
    this.amountPrecision,
    this.deviceQuota,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    unit = json['unit'] as String?;
    amountPrecision = json['amount_precision'] as int?;
    deviceQuota = json['device_quota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['unit'] = unit;
    json['amount_precision'] = amountPrecision;
    json['device_quota'] = deviceQuota;
    return json;
  }
}

class Settings {
  int? printTwice;
  int? pinCode;
  int? offlineMode;
  int? openTicket;
  int? exceedBalance;
  int? printRemainingBalance;
  int? printerFontSize;
  int? plateNumber;
  int? onlyMobile;
  int? epayment;
  int? batch;
  int? masterCard;
  int? printVoucher;
  int? enableDeliver;
  int? cardMasterRequired;
  int? isGarage;

  Settings({
    this.printTwice,
    this.pinCode,
    this.offlineMode,
    this.openTicket,
    this.exceedBalance,
    this.printRemainingBalance,
    this.printerFontSize,
    this.plateNumber,
    this.onlyMobile,
    this.epayment,
    this.batch,
    this.masterCard,
    this.printVoucher,
    this.enableDeliver,
    this.cardMasterRequired,
    this.isGarage,
  });

  Settings.fromJson(Map<String, dynamic> json) {
    printTwice = json['print_twice'] as int?;
    pinCode = json['pin_code'] as int?;
    offlineMode = json['offline_mode'] as int?;
    openTicket = json['open_ticket'] as int?;
    exceedBalance = json['exceed_balance'] as int?;
    printRemainingBalance = json['print_remaining_balance'] as int?;
    printerFontSize = json['printer_font_size'] as int?;
    plateNumber = json['plate_number'] as int?;
    onlyMobile = json['only_mobile'] as int?;
    epayment = json['epayment'] as int?;
    batch = json['batch'] as int?;
    masterCard = json['Master_card'] as int?;
    printVoucher = json['print_voucher'] as int?;
    enableDeliver = json['enable_deliver'] as int?;
    cardMasterRequired = json['card_master_required'] as int?;
    isGarage = json['is_garage'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['print_twice'] = printTwice;
    json['pin_code'] = pinCode;
    json['offline_mode'] = offlineMode;
    json['open_ticket'] = openTicket;
    json['exceed_balance'] = exceedBalance;
    json['print_remaining_balance'] = printRemainingBalance;
    json['printer_font_size'] = printerFontSize;
    json['plate_number'] = plateNumber;
    json['only_mobile'] = onlyMobile;
    json['epayment'] = epayment;
    json['batch'] = batch;
    json['Master_card'] = masterCard;
    json['print_voucher'] = printVoucher;
    json['enable_deliver'] = enableDeliver;
    json['card_master_required'] = cardMasterRequired;
    json['is_garage'] = isGarage;
    return json;
  }
}