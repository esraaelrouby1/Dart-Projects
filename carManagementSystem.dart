class Car {
  // Private attributes
  String _model;
  int _year;
  double _speed;

  // Add a constructor to initialize the car's model and year
  Car(this._model, this._year) : _speed = 0.0;

  // Getter for model

  String get model => _model;

  // Getter for year
  int get year => _year;

  // Getter for speed
  double get speed => _speed;

  // Setter for speed..."ensure speed cannot be negative"
  set speed(double value) {
    if (value < 0) {
      throw ArgumentError("Speed cannot be negative.");
    }
    _speed = value;
  }

  // Method to accelerate...(double increment) to increase speed
  void accelerate(double increment) {
    if (increment < 0) {
      throw ArgumentError("Increment must be positive.");
    }
    _speed += increment;
  }

  // Method to decelerate... to decrease speed ===>(ensure it doesn't go below zero).

  void decelerate(double decrement) {
    if (decrement < 0) {
      throw ArgumentError("Decrement must be positive.");
    }
    _speed = (_speed - decrement).clamp(0.0, double.infinity);
  }

  // Method to print car details and current speed
  void printCarInfo() {
    print("Car Model: $_model");
    print("Year: $_year");
    print("Current Speed: ${_speed.toStringAsFixed(2)} km/h");
  }
}

void main() {
  // Create car objects
  Car car1 = Car('Toyota Corolla', 2020);
  Car car2 = Car('Honda Civic', 2018);

  // Display initial car information
  car1.printCarInfo();
  car2.printCarInfo();

  // Accelerate and decelerate cars
  car1.accelerate(50);
  car1.printCarInfo();

  car1.decelerate(20);
  car1.printCarInfo();

  car2.accelerate(30);
  car2.printCarInfo();

  car2.decelerate(40); // Test  case where speed goes to ==> zero
  car2.printCarInfo();
}
