// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      jobId: json['jobId'] as int,
      status: json['status'] as String,
      description: json['description'] as String,
      jobType: json['jobType'] as String,
      customerId: json['customerId'] as String?,
    )
      ..objectId = json['objectId'] as String?
      ..ownerId = json['ownerId'] as String?
      ..created = json['created'] as int?
      ..updated = json['updated'] as int?
      ..billingLineModels = (json['billingLineModels'] as List<dynamic>?)
              ?.map((e) => BillingLineModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$JobModelToJson(JobModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectId', instance.objectId);
  writeNotNull('ownerId', instance.ownerId);
  writeNotNull('created', instance.created);
  writeNotNull('updated', instance.updated);
  val['jobType'] = instance.jobType;
  val['status'] = instance.status;
  val['jobId'] = instance.jobId;
  val['description'] = instance.description;
  val['customerId'] = instance.customerId;
  val['billingLineModels'] = instance.billingLineModels;
  return val;
}

BillingLineModel _$BillingLineModelFromJson(Map<String, dynamic> json) =>
    BillingLineModel(
      jobId: json['jobId'] as String,
      productName: json['productName'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
    )
      ..objectId = json['objectId'] as String?
      ..comment = json['comment'] as String?
      ..taxable = json['taxable'] as bool? ?? false
      ..addDiscount = json['addDiscount'] as bool? ?? false
      ..discountDescription = json['discountDescription'] as String?
      ..isPercentDiscount = json['isPercentDiscount'] as bool? ?? true
      ..discountAmount = (json['discountAmount'] as num?)?.toDouble() ?? 0.0
      ..note = json['note'] as String?;

Map<String, dynamic> _$BillingLineModelToJson(BillingLineModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectId', instance.objectId);
  val['jobId'] = instance.jobId;
  val['productName'] = instance.productName;
  val['quantity'] = instance.quantity;
  val['price'] = instance.price;
  val['comment'] = instance.comment;
  val['taxable'] = instance.taxable;
  val['addDiscount'] = instance.addDiscount;
  val['discountDescription'] = instance.discountDescription;
  val['isPercentDiscount'] = instance.isPercentDiscount;
  val['discountAmount'] = instance.discountAmount;
  val['note'] = instance.note;
  return val;
}
