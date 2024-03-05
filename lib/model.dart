class Config {
  String business_name;
  String logo;
  String address;
  String phone;
  String email;

  Config({
    required this.business_name,
    required this.logo,
    required this.address,
    required this.phone,
    required this.email,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      business_name: json['business_name'],
      logo: json['logo'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
