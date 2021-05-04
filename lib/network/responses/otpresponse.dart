class OTPResponse {
  String success;
  String message;
  String usertoken;
  String username;
  String mobile;

  OTPResponse(
      {this.success, this.message, this.usertoken, this.username, this.mobile});

  OTPResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    usertoken = json['usertoken'];
    username = json['username'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['usertoken'] = this.usertoken;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    return data;
  }
}
