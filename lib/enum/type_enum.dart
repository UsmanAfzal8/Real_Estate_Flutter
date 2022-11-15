enum TypeEnum<String> {
  house('house'),
  office('office'),
  shop('shop'),
  plot('plot');

  const TypeEnum(this.value);
  final String value;
}

class TypeStatusConvetion {
  TypeEnum<String> stringToEnum(String value) {
    switch (value) {
      case 'house':
        return TypeEnum.house;
      case 'office':
        return TypeEnum.office;
      case 'shop':
        return TypeEnum.shop;
      default:
        return TypeEnum.plot;
    }
  }
}
