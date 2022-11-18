class PaymentMethodModel {
  final int? id;
  final String? name;
  final String? code;
 
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  // constructor
  PaymentMethodModel({
    this.id,
    this.name,
    this.code,
    
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
       
        status: json['status'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
}
