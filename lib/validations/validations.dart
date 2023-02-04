abstract class Validation<T> {
  final T? value;

  Validation(this.value);

  String? validate();
}
