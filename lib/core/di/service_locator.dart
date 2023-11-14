import 'package:eden_work_sample/app/data/repositories/auth_repository_impl.dart';
import 'package:eden_work_sample/app/domain/auth_repository.dart';
import 'package:eden_work_sample/app/presentation/provider/auth_provider.dart';
import 'package:eden_work_sample/app/presentation/provider/order_provider.dart';
import 'package:eden_work_sample/app/presentation/provider/socket_provider.dart';
import 'package:eden_work_sample/app/presentation/provider/theme_provider.dart';
import 'package:eden_work_sample/core/services/dialog_service/dialog_service.dart';
import 'package:eden_work_sample/core/services/dialog_service/dialog_service_impl.dart';
import 'package:eden_work_sample/env/env.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:ably_flutter/ably_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  final preference = await SharedPreferences.getInstance();
  // Auth Provider
  sl.registerFactory(() => AuthProvider(
        authRepository: sl(),
        dialogService: sl(),
      ));
  // Auth Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        firebaseAuth: sl(),
      ));

  // Order Provider
  sl.registerFactory(() => OrderProvider());

  // Order Provider
  sl.registerFactory(() => SocketProvider(
        realtime: sl(),
        dialogService: sl(),
      ));

  // Theme Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));

  // Externals
  sl.registerLazySingleton<SharedPreferences>(() => preference);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<Realtime>(
      () => Realtime(options: ClientOptions(key: Env.ablyKey)));

  // Services
  sl.registerLazySingleton<DialogService>(() => DialogServiceImpl());
}
