class Address {
  String logradouro;
  String number;
  String? complement;
  String neighborhood;
  String city;
  String state;
  String country;
  String postalCode;

  Address({
    required this.logradouro,
    required this.number,
    this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
  });
}
