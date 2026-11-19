import 'package:injectable/injectable.dart';
import 'get_it.dart';
import 'injection.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);
