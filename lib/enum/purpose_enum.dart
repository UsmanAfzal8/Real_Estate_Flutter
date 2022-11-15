enum PurposeEnum<String> {
  rent('rent'),
  sell('sell');
  const PurposeEnum(this.value);
  final String value;
}

class PurposeStatusConvetion {
  PurposeEnum<String> stringToEnum(String value) {
    switch (value) {
      case 'rent':
        return PurposeEnum.rent;
      default:
        return PurposeEnum.sell;
    }
  }
}
