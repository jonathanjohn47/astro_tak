extension DateTimeHelper on DateTime {
  String dateTimeToString() {
    //convert to 'dd-MM-yyyy HH:mm:ss'
    return day.toString().padLeft(2, '0') +
        '-' +
        month.toString().padLeft(2, '0') +
        '-' +
        year.toString() +
        ' ' +
        hour.toString().padLeft(2, '0') +
        ':' +
        minute.toString().padLeft(2, '0');
  }

  String getDateString() {
    //convert to 'yyyy-MM-dd'
    return day.toString().padLeft(2, '0') +
        '-' +
        month.toString().padLeft(2, '0') +
        '-' +
        year.toString();
  }

  String getTimeString() {
    //convert to 'HH:mm:ss'
    return hour.toString().padLeft(2, '0') +
        ':' +
        minute.toString().padLeft(2, '0');
  }

  String getTwelveHourTime() {
    String hour = this.hour.toString();
    String minute = this.minute.toString();
    String ampm = 'AM';
    if (this.hour > 12) {
      hour = (this.hour - 12).toString();
      ampm = 'PM';
    }
    if (this.hour == 0) {
      hour = '12';
    }
    return hour.padLeft(2, '0') + ':' + minute.padLeft(2, '0') + ' ' + ampm;
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
