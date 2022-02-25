extension DateTimeHelper on DateTime {
  String dateTimeToString() {
    //convert to 'yyyy-MM-dd HH:mm:ss'
    return this.year.toString() + '-' + "${this.month.toString().padLeft(2, '0')}" + '-' + "${this.day.toString().padLeft(2, '0')}" + ' ' + "${this.hour.toString().padLeft(2, '0')}" + ':' + "${this.minute.toString().padLeft(2, '0')}";
  }

  String getMeridiem() {
    if (this.hour < 12) {
      return "AM";
    } else {
      return "PM";
    }
  }
}

extension StringDateTimeHelper on String {
  //getHour from "2000-01-01T13:01:00"
  int getHour() {
    return int.parse(this.substring(11, 13));
  }

  int getMinute() {
    return int.parse(this.substring(14, 16));
  }

  int getDay() {
    return int.parse(this.substring(8, 10));
  }

  int getMonth() {
    return int.parse(this.substring(5, 7));
  }

  int getYear() {
    return int.parse(this.substring(0, 4));
  }

  DateTime getDateTime() {
    return DateTime(getYear(), getMonth(), getDay(), getHour(), getMinute());
  }
}
