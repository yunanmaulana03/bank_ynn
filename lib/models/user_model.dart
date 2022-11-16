class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  String? username;
  int? verified;
  String? profilePicture;
  String? ktp;
  int? balance;
  String? cardNumber;
  String? pin;
  String? token;

  // constructor
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.username,
    this.verified,
    this.profilePicture,
    this.ktp,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  // constructor baru

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        verified: json['verified'],
        profilePicture: json['profile_picture'],
        ktp: json['ktp'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
      );

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        pin: pin ?? this.pin,
        password: password ?? this.password,
        balance: balance ?? this.balance,
        verified: verified,
        profilePicture: profilePicture,
        cardNumber: cardNumber,
        token: token,
      );
}
