class CardQuotaModel {
  String? errMsg;
  String? errCode;
  String? svTm;
  Data? data;
  String? cardId;

  CardQuotaModel({this.errMsg, this.errCode, this.svTm, this.data,this.cardId});

  CardQuotaModel.fromJson(Map<String, dynamic> json) {
    errMsg = json['errMsg'];
    errCode = json['errCode'];
    svTm = json['svTm'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    cardId = json['cardId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errMsg'] = errMsg;
    data['errCode'] = errCode;
    data['svTm'] = svTm;
    data['cardId'] = cardId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic type;
  List<Slices>? slices;
  double? maxQuantity;

  Data({this.type, this.slices, this.maxQuantity});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['slices'] != null) {
      slices = <Slices>[];
      json['slices'].forEach((v) {
        slices!.add(new Slices.fromJson(v));
      });
    }
    maxQuantity = json['maxQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.slices != null) {
      data['slices'] = this.slices!.map((v) => v.toJson()).toList();
    }
    data['maxQuantity'] = this.maxQuantity;
    return data;
  }
}

class Slices {
  String? shortcut;
  String? shortcutAr;
  int? sliceOrder;
  dynamic quota;
  dynamic price;

  Slices(
      {this.shortcut,
        this.shortcutAr,
        this.sliceOrder,
        this.quota,
        this.price});

  Slices.fromJson(Map<String, dynamic> json) {
    shortcut = json['shortcut'];
    shortcutAr = json['shortcutAr'];
    sliceOrder = json['sliceOrder'];
    quota = json['quota'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shortcut'] = this.shortcut;
    data['shortcutAr'] = this.shortcutAr;
    data['sliceOrder'] = this.sliceOrder;
    data['quota'] = this.quota;
    data['price'] = this.price;
    return data;
  }
}
