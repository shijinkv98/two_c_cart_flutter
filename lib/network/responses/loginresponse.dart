class LoginResponse {
  String success;
  String message;
  String userToken;
  String username;
  String mobile;

  LoginResponse(
      {this.success, this.message, this.userToken, this.username, this.mobile});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    userToken = json['user_token'];
    username = json['username'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['user_token'] = this.userToken;
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    return data;
  }
}
