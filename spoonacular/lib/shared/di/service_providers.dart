import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/local/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref){
  return AppDatabase();
});