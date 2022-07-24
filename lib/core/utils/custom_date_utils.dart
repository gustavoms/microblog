import 'package:intl/intl.dart';

class MicroblogDateUtils {
  static format({
    required DateTime date,
  }) {
    return DateFormat('dd MMM. HH:mm').format(date);
  }
}
