class PriceConverstion{
  String price(double num) {
      if (num > 999 && num < 99999) {
        return "${(num / 1000).toStringAsFixed(1)} Thousand";
      } else if (num > 99999 && num < 9999999) {
        return "${(num / 100000).toStringAsFixed(0)} Lakh";
      } else if (num > 9999999 && num < 999999999) {
        return "${(num / 10000000).toStringAsFixed(1)} Crore";
      } else if (num > 999999999) {
        return "${(num / 1000000000).toStringAsFixed(1)} B";
      } else {
        return num.toString();
      }
    }
}