import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Group<T> with EquatableMixin {
  final String groupName;
  final T object;
  Group({
    required this.groupName,
    required this.object,
  });

  factory Group.fromObject({required T object, required String groupName}) {
    return Group<T>(groupName: groupName, object: object);
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [groupName, object];
}

class BasicCurrency with EquatableMixin {
  String code;
  String name;
  String symbol;

  BasicCurrency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory BasicCurrency.fromJson(Map<String, dynamic> json) {
    return BasicCurrency(
      code: json['code'],
      name: json['name'],
      symbol: json['symbol'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [code, name, symbol];
}
