class SignUpFormModel {
  // variable
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  // constructor
  SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  // function toJson
  // String, dynamic
  // pada bagian String penamaan field sesuaikan dengan API (karena ambil dari API)
  // pada bagian dynamic bebas penamaannya (karena untuk di flutternya)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  // function copyWith
  // untuk mempertahankan data yang lama / yang telah diupload sebelumnya(pin, profilePicture, ktp)
  SignUpFormModel copyWith({
    String? pin,
    String? profilePicture,
    String? ktp,
  }) =>
      SignUpFormModel(
        name: name,
        email: email,
        password: password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );
}
