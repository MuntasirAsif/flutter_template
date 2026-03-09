import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';
import 'package:vezy/core/service/network/api_handler.dart';
import 'package:vezy/data/auth/data/model/send_otp_forget_model.dart';
import 'package:vezy/data/auth/domain/repository/auth_repository.dart';
import 'package:vezy/data/auth/provider/auth_repository_provider.dart';

class VerifyOtpViewModel extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;

  VerifyOtpViewModel(this._authRepository) : super(const AsyncValue.data(null));

  Future<void> sendOtpForget(SendOtpForgetModel model) async {
    state = const AsyncValue.loading();
    await Api.call(
      action: _authRepository.forgotPassword(model.toJson()),
      onSuccess: (responseData) async {
        state = const AsyncValue.data(null);
      },
      onError: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}

final sendOtpForgetViewModelProvider =
    StateNotifierProvider<VerifyOtpViewModel, AsyncValue<void>>((ref) {
      final authRepository = ref.watch(authRepositoryProvider);
      return VerifyOtpViewModel(authRepository);
    });
