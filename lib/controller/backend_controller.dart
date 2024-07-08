import 'package:opulizer/model/providers/ip_address_provider.dart';
import 'package:opulizer/model/services/backend_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backend_controller.g.dart';

@riverpod
class BackendController extends _$BackendController {
  @override
  FutureOr<bool> build() async {
    return true;
  }

  void initiateBackendPopulation() async {
    state = const AsyncValue.loading();
    try {
      final response = await ref
          .read(backendServiceProvider)
          .initiateBackendPopulation(ref.read(ipAddressProvider));
      state = AsyncData(response);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  void terminateBackendPopulation() async {
    state = const AsyncValue.loading();
    try {
      final response =
          await ref.read(backendServiceProvider).terminateBackendPopulation(
                ref.read(ipAddressProvider),
              );
      state = AsyncData(response);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }

  void testServer() async {
    state = const AsyncValue.loading();
    try {
      final response = await ref.read(backendServiceProvider).testServer(
            ref.read(ipAddressProvider),
          );
      state = AsyncData(response == 'hello world');
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
