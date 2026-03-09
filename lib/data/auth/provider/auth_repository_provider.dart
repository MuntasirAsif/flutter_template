import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vezy/data/auth/data/repository/auth_repository_impl.dart';
import 'package:vezy/data/auth/domain/repository/auth_repository.dart';

import '../../../core/service/network/dio_client.dart';
import '../../../core/service/network/rest_client.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepositoryImpl(RestClient(dio));
});
