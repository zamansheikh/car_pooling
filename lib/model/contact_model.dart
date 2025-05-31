class ContactModel {
  final String id;
  final String image;
  final String firstName;
  final String lastName;
  final String cellNumber;
  final String address;
  final String distance;

  ContactModel({
    required this.id,
    this.image = '',
    this.firstName = 'Unknown',
    this.lastName = 'Unknown',
    this.cellNumber = 'Unknown',
    this.address = "Unknown",
    this.distance = "Unknown",
  });
}
