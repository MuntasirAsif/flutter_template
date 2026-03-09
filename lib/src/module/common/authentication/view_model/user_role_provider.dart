import 'dart:developer';

import 'package:flutter_riverpod/legacy.dart';

import '../../../../../core/service/cache/cache_service.dart';
import '../../bottom_nav_bar/view/bottom_nav_bar.dart';

final userRoleProvider = StateNotifierProvider<UserRoleNotifier, UserRole?>((
  ref,
) {
  final cacheService = ref.watch(cacheServiceProvider);
  return UserRoleNotifier(cacheService);
});

class UserRoleNotifier extends StateNotifier<UserRole?> {
  final CacheService _cacheService;

  UserRoleNotifier(this._cacheService) : super(null) {
    loadUserRole();
  }

  Future<void> loadUserRole() async {
    state = null;
    log("Loading role...");

    final fetchedRole = await getRoleFromStorage();
    state = fetchedRole;
    log("Role loaded: $state");
  }

  Future<UserRole> getRoleFromStorage() async {
    final roleString = _cacheService.get<String>(CacheKey.role);
    log("$roleString");
    if (roleString == "provider") {
      return UserRole.provider;
    }
    return UserRole.user;
  }

  Future<void> switchToUser() async {
    await saveRoleToStorage(UserRole.user);
    log("switchToUser");
    state = UserRole.user;
  }

  Future<void> switchToProvider() async {
    await saveRoleToStorage(UserRole.provider);
    log("switchToProvider");
    state = UserRole.provider;
  }

  Future<void> toggleRole() async {
    if (state == UserRole.user) {
      await switchToProvider();
    } else {
      await switchToUser();
    }
  }

  Future<void> saveRoleToStorage(UserRole role) async {
    await _cacheService.save(CacheKey.role, role.name);
  }
}
