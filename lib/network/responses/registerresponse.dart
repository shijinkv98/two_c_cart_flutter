class RegisterResponse {
  String message;
  String success;
  int otp;

  RegisterResponse({this.message, this.success, this.otp});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['otp'] = this.otp;
    return data;
  }
}
