import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:money/presentation/configure_injection.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: 'configDI')
Future<void> configureDependencies() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerSingletonAsync<SharedPreferences>(() async => prefs);

  await getIt.allReady();

  getIt.configDI();
}
