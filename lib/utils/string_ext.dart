extension StringExt on String {
  String toTimeConvention() {
    String greetings = '';
    int hours = int.parse(this);

    if (hours >= 5 && hours <= 11) {
      greetings = "Good Morning";
    } else if (hours >= 12 && hours <= 16) {
      greetings = "Good Afternoon";
    } else if (hours >= 17 && hours <= 4) {
      greetings = "Good Evening";
    } else {
      greetings = "Good Evening";
    }
    return greetings;
  }
}
