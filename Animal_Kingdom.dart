// Base class Animal
class Animal {
  String name;
  int age;

  // Constructor to initialize name and age
  Animal(this.name, this.age);

  // Method to make a generic sound
  void makeSound() {
    print("Some generic animal sound");
  }
}

// Subclass: Dog
class Dog extends Animal {
  Dog(String name, int age)
      : super(name, age); // Call the superclass constructor

  // Overriding makeSound method
  @override
  void makeSound() {
    print("Woof!");
  }
}

// Subclass: Cat
class Cat extends Animal {
  Cat(String name, int age)
      : super(name, age); // Call the superclass constructor

  // Overriding makeSound method
  @override
  void makeSound() {
    print("Meow!");
  }
}

// Main function
void main() {
  // Create Dog and Cat objects
  Dog dog1 = Dog('Buddy', 3);
  Cat cat1 = Cat('Whiskers', 2);

  // Call makeSound method
  dog1.makeSound(); // "Woof!"
  cat1.makeSound(); // "Meow!"

  // Print name and age
  print('${dog1.name} is ${dog1.age} years old.');
  print('${cat1.name} is ${cat1.age} years old.');
}
