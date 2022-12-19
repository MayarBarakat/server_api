class ProoferSaleLogModel {
  Settings? settings;
  String? sessionId;
  String? adminPass;
  String? salesIndex;

  ProoferSaleLogModel(
      {this.settings, this.sessionId, this.adminPass, this.salesIndex});

  ProoferSaleLogModel.fromJson(Map<String, dynamic> json) {
    settings = json['setting'] != null
        ? new Settings.fromJson(json['setting'])
        : null;
    sessionId = json['sessionId'];
    adminPass = json['adminPass'];
    salesIndex = json['salesIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settings != null) {
      data['setting'] = this.settings!.toJson();
    }
    data['sessionId'] = this.sessionId;
    data['adminPass'] = this.adminPass;
    data['salesIndex'] = this.salesIndex;
    return data;
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

  Settings(
      {this.printTwice,
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
        this.isGarage});

  Settings.fromJson(Map<String, dynamic> json) {
    printTwice = json['print_twice'];
    pinCode = json['pin_code'];
    offlineMode = json['offline_mode'];
    openTicket = json['open_ticket'];
    exceedBalance = json['exceed_balance'];
    printRemainingBalance = json['print_remaining_balance'];
    printerFontSize = json['printer_font_size'];
    plateNumber = json['plate_number'];
    onlyMobile = json['only_mobile'];
    epayment = json['epayment'];
    batch = json['batch'];
    masterCard = json['Master_card'];
    printVoucher = json['print_voucher'];
    enableDeliver = json['enable_deliver'];
    cardMasterRequired = json['card_master_required'];
    isGarage = json['is_garage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['print_twice'] = this.printTwice;
    data['pin_code'] = this.pinCode;
    data['offline_mode'] = this.offlineMode;
    data['open_ticket'] = this.openTicket;
    data['exceed_balance'] = this.exceedBalance;
    data['print_remaining_balance'] = this.printRemainingBalance;
    data['printer_font_size'] = this.printerFontSize;
    data['plate_number'] = this.plateNumber;
    data['only_mobile'] = this.onlyMobile;
    data['epayment'] = this.epayment;
    data['batch'] = this.batch;
    data['Master_card'] = this.masterCard;
    data['print_voucher'] = this.printVoucher;
    data['enable_deliver'] = this.enableDeliver;
    data['card_master_required'] = this.cardMasterRequired;
    data['is_garage'] = this.isGarage;
    return data;
  }
}
