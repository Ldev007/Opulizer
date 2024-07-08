import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ip_address_provider.g.dart';

@riverpod
class IpAddress extends _$IpAddress {
  set ip(String ip) => state = ip;

  @override
  String build() {
    return '';
  }
}
