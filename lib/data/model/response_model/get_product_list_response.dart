class GetProductListResponseModel {


  GetProductListResponseModel();

  GetProductListResponseModel.fromJson(Map<String, dynamic> json) {

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();


    return data;
  }
}



class Errors {
  String? code;
  String? message;
  String? type;

  Errors({this.code, this.message, this.type});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}
