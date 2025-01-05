import 'package:alert/core/enum/screen.dart';
import 'package:alert/core/navigation/app_router.dart';

extension StringExtensions on String{
  Screen toScreen() {
    return Screen.values.firstWhere(
          (e) {
        // Comparing lowercase string values without underscores
        return e.toString().split('.').last.replaceAll('_', '').toLowerCase() == replaceAll('_', '').toLowerCase();
      },
      orElse: () => Screen.undefined, // Default to undefined if no match
    );
  }
}