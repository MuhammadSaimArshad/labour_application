class Application {
  String? name;
  String? subject;
  // String? description;
  String? price;

  Application({this.name, this.subject, this.price});

  static List<Application> jobsList = [
    Application(
        // description:
        //     "Aplaster required for permanent base who should be able to work around a 40 hour week.Atleast 2 years of",
        name: "Google",
        price: "30.0",
        subject: "Gender"),
  ];
}
