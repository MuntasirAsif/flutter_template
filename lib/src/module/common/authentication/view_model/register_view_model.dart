import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:vezy/core/service/cache/cache_service.dart';
import 'package:vezy/data/auth/data/model/register_model.dart';
import 'package:vezy/data/auth/domain/repository/auth_repository.dart';
import 'package:vezy/data/auth/provider/auth_repository_provider.dart';
import 'package:vezy/core/service/network/api_handler.dart';

class SignUpViewModel extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository; 
  final CacheService _cacheService; 

  SignUpViewModel(this._authRepository, this._cacheService) : super(const AsyncValue.data(null));

  Future<void> register(RegisterModel model) async {
    state = const AsyncValue.loading(); 
    
    await Api.call(
      // We pass the Future without `await` here so Api.call can await it internally
      action: _authRepository.register(model.toJson()),
      onSuccess: (responseData) async {
        // Extract and save tokens
        if (responseData != null && responseData is Map<String, dynamic>) {
          final accessToken = responseData['accessToken']?.toString();
          final refreshToken = responseData['refreshToken']?.toString();
          
          if (accessToken != null) {
            await _cacheService.save(CacheKey.accessToken, accessToken);
          }
          if (refreshToken != null) {
            await _cacheService.save(CacheKey.refreshToken, refreshToken);
          }
          
          await _cacheService.save(CacheKey.isLoggedIn, true);
        }

        // Success!
        state = const AsyncValue.data(null); 
      },
      onError: (error) {
        // Automatically populated whether from HTTP 400 or DioException JSON error
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}

// Expose the ViewModel and inject the dependencies
final signUpViewModelProvider = StateNotifierProvider<SignUpViewModel, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final cacheService = ref.watch(cacheServiceProvider);
  return SignUpViewModel(authRepository, cacheService);
});
