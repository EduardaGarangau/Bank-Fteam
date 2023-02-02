abstract class ValueObject<T> {
  final T? value;

  ValueObject(this.value);

  String? validate();
}
