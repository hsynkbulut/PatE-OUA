import 'package:get_it/get_it.dart';
import 'package:pat_e/core/services/provider/auth_provider.dart';
import 'package:pat_e/core/services/authentication_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AuthProvider>(AuthProvider());
  locator.registerSingleton<AuthenticationService>(AuthenticationService());
}
