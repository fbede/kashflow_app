import 'package:equatable/equatable.dart';

class PopularCurrency with EquatableMixin {
  String code;
  String name;
  String symbol;

  PopularCurrency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory PopularCurrency.fromJson(Map<String, dynamic> json) {
    return PopularCurrency(
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
