import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'services/services.dart';
import 'landsight.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var services = await Services.initialize();

  setPreferredOrientation();

  initializeDateFormatting('it_IT', '').then((_) => runApp(ServicesProvider(services: services, child: const Landsight())));
}

void setPreferredOrientation() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}