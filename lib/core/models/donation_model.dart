class Donation {
  final String? donationID;
  final DateTime donationDate;
  final double donationAmount;
  final String donatedOrganization;

  Donation(
      {this.donationID,
      required this.donationDate,
      required this.donationAmount,
      required this.donatedOrganization});
}
