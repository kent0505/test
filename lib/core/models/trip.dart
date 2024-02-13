class Trip {
  String? driver1;
  Bus? bus;
  String? passengerFareCost;
  DateTime? departureTime;
  DateTime? arrivalTime;
  Departure? departure;
  Destination? destination;

  Trip({
    this.driver1,
    this.bus,
    this.passengerFareCost,
    this.departureTime,
    this.arrivalTime,
    this.departure,
    this.destination,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      driver1: json['Driver1'],
      bus: Bus.fromJson(json['Bus']),
      passengerFareCost: json['PassengerFareCost'],
      departureTime: DateTime.parse(json['DepartureTime']),
      arrivalTime: DateTime.parse(json['ArrivalTime']),
      departure: Departure.fromJson(json['Departure']),
      destination: Destination.fromJson(json['Destination']),
    );
  }
}

class Bus {
  String? model;

  Bus({this.model});

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(model: json['Model']);
  }
}

class Departure {
  String? locality;
  String? stoppingPlace;

  Departure({
    this.locality,
    this.stoppingPlace,
  });

  factory Departure.fromJson(Map<String, dynamic> json) {
    return Departure(
      locality: json['Locality'],
      stoppingPlace: json['StoppingPlace'],
    );
  }
}

class Destination {
  String? locality;
  String? stoppingPlace;

  Destination({
    this.locality,
    this.stoppingPlace,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      locality: json['Locality'],
      stoppingPlace: json['StoppingPlace'],
    );
  }
}
