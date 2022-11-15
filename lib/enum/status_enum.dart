enum StatusEnum<String> {
  pending('pending'),

  completed('completed'),
  cancel('cancel');

  const StatusEnum(this.value);
  final String value;
}

class StatusConvetion {
  StatusEnum<String> stringToEnum(String value) {
    switch (value) {
      case 'pending':
        return StatusEnum.pending;

      case 'completed':
        return StatusEnum.completed;
      default:
        return StatusEnum.cancel;
    }
  }
}
