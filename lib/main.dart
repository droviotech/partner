import 'package:flutter/widgets.dart';
import 'app/bootstrap.dart';
import 'app/partner_app.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const PartnerApp());
}
