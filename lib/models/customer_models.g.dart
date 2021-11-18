// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CTSiteProfile _$CTSiteProfileFromJson(Map<String, dynamic> json) =>
    CTSiteProfile(
      name: json['name'] as String,
      profiles: json['profiles'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$CTSiteProfileToJson(CTSiteProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profiles': instance.profiles,
    };

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      companyId: json['companyId'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      serviceAddress:
          AddressModel.fromJson(json['serviceAddress'] as Map<String, dynamic>),
      billingAddress:
          AddressModel.fromJson(json['billingAddress'] as Map<String, dynamic>),
    )
      ..parentId = json['parentId'] as String?
      ..customerContacts = (json['customerContacts'] as List<dynamic>?)
              ?.map((e) => CustomerContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..latitude = (json['latitude'] as num?)?.toDouble() ?? 0.0
      ..longitude = (json['longitude'] as num?)?.toDouble() ?? 0.0;

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'parentId': instance.parentId,
      'companyId': instance.companyId,
      'serviceAddress': instance.serviceAddress,
      'billingAddress': instance.billingAddress,
      'customerContacts': instance.customerContacts,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      country: json['country'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zip: json['zip'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'zip': instance.zip,
    };

CustomerContact _$CustomerContactFromJson(Map<String, dynamic> json) =>
    CustomerContact(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$CTContactTypeEnumMap, e))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CustomerContactToJson(CustomerContact instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'types': instance.types.map((e) => _$CTContactTypeEnumMap[e]).toList(),
    };

const _$CTContactTypeEnumMap = {
  CTContactType.primary: 'primary',
  CTContactType.billing: 'billing',
  CTContactType.schedule: 'schedule',
  CTContactType.other: 'other',
};

SearchAddressModel _$SearchAddressModelFromJson(Map<String, dynamic> json) =>
    SearchAddressModel()
      ..placeId = json['placeId'] as String? ?? ''
      ..name = json['main_text'] as String? ?? ''
      ..description = json['secondary_text'] as String? ?? ''
      ..state = json['state'] as String? ?? ''
      ..latitude = (json['latitude'] as num?)?.toDouble() ?? 0.0
      ..longitude = (json['longitude'] as num?)?.toDouble() ?? 0.0;

Map<String, dynamic> _$SearchAddressModelToJson(SearchAddressModel instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'main_text': instance.name,
      'secondary_text': instance.description,
      'state': instance.state,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
