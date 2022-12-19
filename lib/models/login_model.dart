class LoginModel {
  String? errMsg;
  String? errCode;
  String? svTm;
  Data? data;

  LoginModel({this.errMsg, this.errCode, this.svTm, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    errMsg = json['err_msg'];
    errCode = json['err_code'];
    svTm = json['sv_tm'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['err_msg'] = this.errMsg;
    data['err_code'] = this.errCode;
    data['sv_tm'] = this.svTm;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sessionId;
  String? sessionNumber;

  Data({this.sessionId, this.sessionNumber});

  Data.fromJson(Map<String, dynamic> json) {
    sessionId = json['session_id'];
    sessionNumber = json['session_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_id'] = this.sessionId;
    data['session_number'] = this.sessionNumber;
    return data;
  }
}
