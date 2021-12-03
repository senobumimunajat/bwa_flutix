part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo(
      {@required this.title, @required this.subtitle, @required this.discount});

  @override
  List<Object> get props => [title, subtitle, discount];
}

List<Promo> dummyPromos = [
  Promo(
      title: "Student Holiday",
      subtitle: "Maximal only for two people",
      discount: 50),
  Promo(
      title: "Family Club",
      subtitle: "Manimal for three members",
      discount: 70),
  Promo(
      title: "Subscription Promo",
      subtitle: "Min. One Year",
      discount: 40)
];
