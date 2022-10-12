import 'package:intl/intl.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/models/token/refresh_token_request.dart';
import 'package:sample_app_getx/data/models/token/refresh_token_response.dart';
import 'package:sample_app_getx/data/repository/refresh/refresh_token_repository.dart';

class BaseFunctions {
  static String numberWithZero(String number) {
    if (number.substring(0, 1) == '0') {
      return number;
    } else if (number.length == 1) {
      return "0$number";
    }
    return number;
  }

  static String moneyFormat(num number) {
    String splitter = " ";
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = NumberFormat().format(number).split(",").join(splitter);
    return isNegative ? "-" + result : result;
  }

  static Future<void> refreshToken() async {
    var request = RefreshTokenRequest(
      refreshToken: LocalSource.getInstance().getRefreshToken(),
    );
    final refreshTokenRepository = RefreshTokenRepository();
    final result = await refreshTokenRepository.refreshToken(request: request);
    if (result is RefreshTokenResponse) {
      LocalSource.getInstance().setRefreshedTokens(
        refreshToken: result.refreshToken,
        accessToken: result.accessToken,
      );
    }
  }

  static String formatExpDate(String date) {
    return date == ''
        ? ''
        : (date.length > 2 && !date.contains('/'))
            ? '${date.substring(2, date.length)}/${date.substring(0, 2)}'
            : date;
  }

  static String formatCardNumber(String number) {
    if (number.contains(' ')) return number;

    String result = '';
    if (number.length == 16) {
      number = number.replaceRange(8, 11, '****');
      for (int i = 0; i < number.length; i = i + 4) {
        if ((i + 4) <= number.length)
          result += number.substring(i, i + 4) + " ";
      }
      return result;
    } else
      return number.trim();
  }

// static String getStringByLanguage(Title value) {
//   var lang = GetStorage().read<String>('locale') ?? 'ru';
//   if (lang == 'ru') {
//     return value?.ru ?? '';
//   } else if (lang == 'en') {
//     return value?.en ?? '';
//   } else {
//     return value?.uz ?? '';
//   }
// }
}
