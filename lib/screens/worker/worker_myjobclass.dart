class Myjobs {
  String? name;
  String? subject;
  String? description;
  String? price;

  Myjobs({this.description, this.name, this.subject, this.price});

  static List<Myjobs> jobsList = [
    Myjobs(
        description:
            "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
        name: "Lilla",
        price: "30.0",
        subject: "Paster Required"),
  ];
}
