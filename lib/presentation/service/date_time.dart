import 'package:intl/intl.dart';

class DateTimeService {
  DateTime getDateFromString(
          {required String dateString, required String format}) =>
      DateFormat(format).parse(dateString);

  String getStingFromDate({required DateTime date, required String pattern}) =>
      DateFormat(pattern).format(date);

  DateTime getDateFromMillis({required int millis}) =>
      DateTime.fromMillisecondsSinceEpoch(millis);

  String formatDateStringToUTC(
      {required String dateString,
      required String inputPattern,
      required String outputPattern}) {
    if (outputPattern.isEmpty) {
      outputPattern = inputPattern;
    }
    return DateFormat(outputPattern)
        .format(DateFormat(inputPattern).parse(dateString).toUtc());
  }

  String formatDateStringToLocal(
      {required String dateString,
      required String inputPattern,
      required String? outputPattern}) {
    if (outputPattern == null || outputPattern.isEmpty) {
      outputPattern = inputPattern;
    }
    return DateFormat(outputPattern)
        .format(DateFormat(inputPattern).parse(dateString).toLocal());
  }

  String changeDateStringFormat(
          {required String dateString,
          required String inputPattern,
          required String outputPattern}) =>
      DateFormat(outputPattern)
          .format(DateFormat(inputPattern).parse(dateString));

  String timeAgoString(int millis, {bool numericDates = true}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millis);
    final date2 = DateTime.now();
    final difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} months ago';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} weeks ago';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}

//    ICU Name                   Skeleton
//    --------                   --------
//    DAY                          d
//    ABBR_WEEKDAY                 E
//    WEEKDAY                      EEEE
//    ABBR_STANDALONE_MONTH        LLL
//    STANDALONE_MONTH             LLLL
//    NUM_MONTH                    M
//    NUM_MONTH_DAY                Md
//    NUM_MONTH_WEEKDAY_DAY        MEd
//    ABBR_MONTH                   MMM
//    ABBR_MONTH_DAY               MMMd
//    ABBR_MONTH_WEEKDAY_DAY       MMMEd
//    MONTH                        MMMM
//    MONTH_DAY                    MMMMd
//    MONTH_WEEKDAY_DAY            MMMMEEEEd
//    ABBR_QUARTER                 QQQ
//    QUARTER                      QQQQ
//    YEAR                         y
//    YEAR_NUM_MONTH               yM
//    YEAR_NUM_MONTH_DAY           yMd
//    YEAR_NUM_MONTH_WEEKDAY_DAY   yMEd
//    YEAR_ABBR_MONTH              yMMM
//    YEAR_ABBR_MONTH_DAY          yMMMd
//    YEAR_ABBR_MONTH_WEEKDAY_DAY  yMMMEd
//    YEAR_MONTH                   yMMMM
//    YEAR_MONTH_DAY               yMMMMd
//    YEAR_MONTH_WEEKDAY_DAY       yMMMMEEEEd
//    YEAR_ABBR_QUARTER            yQQQ
//    YEAR_QUARTER                 yQQQQ
//    HOUR24                       H
//    HOUR24_MINUTE                Hm
//    HOUR24_MINUTE_SECOND         Hms
//    HOUR                         j
//    HOUR_MINUTE                  jm
//    HOUR_MINUTE_SECOND           jms
//    HOUR_MINUTE_GENERIC_TZ       jmv
//    HOUR_MINUTE_TZ               jmz
//    HOUR_GENERIC_TZ              jv
//    HOUR_TZ                      jz
//    MINUTE                       m
//    MINUTE_SECOND                ms
//    SECOND                       s
