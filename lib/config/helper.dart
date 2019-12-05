

import 'package:intl/intl.dart';

class Helper {

  static String localNumber(var number) {
    return NumberFormat("###,000",'id').format(number);
  }

}