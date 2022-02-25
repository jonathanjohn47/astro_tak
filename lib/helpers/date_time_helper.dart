extension DateTimeHelper on DateTime {
  String dateTimeToString() {
    //convert to 'yyyy-MM-dd HH:mm:ss'
    return year.toString() +
        '-' +
        month.toString().padLeft(2, '0') +
        '-' +
        day.toString().padLeft(2, '0') +
        ' ' +
        hour.toString().padLeft(2, '0') +
        ':' +
        minute.toString().padLeft(2, '0');
  }

  String getDateString() {
    //convert to 'yyyy-MM-dd'
    return year.toString() +
        '-' +
        month.toString().padLeft(2, '0') +
        '-' +
        day.toString().padLeft(2, '0');
  }

  String getTimeString() {
    //convert to 'HH:mm:ss'
    return hour.toString().padLeft(2, '0') +
        ':' +
        minute.toString().padLeft(2, '0');
  }

  String getMeridiem() {
    if (hour < 12) {
      return "AM";
    } else {
      return "PM";
    }
  }
}

extension StringDateTimeHelper on String {
  //getHour from "2000-01-01T13:01:00"
  int getHour() {
    return int.parse(substring(11, 13));
  }

  int getMinute() {
    return int.parse(substring(14, 16));
  }

  int getDay() {
    return int.parse(substring(8, 10));
  }

  int getMonth() {
    return int.parse(substring(5, 7));
  }

  int getYear() {
    return int.parse(substring(0, 4));
  }

  DateTime getDateTime() {
    return DateTime(getYear(), getMonth(), getDay(), getHour(), getMinute());
  }
}
