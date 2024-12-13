//Create a Product class
class Product {
  //with attributes name and price.
  String name;
  double price;
  Product(this.name, this.price);

//to  show the user’s name and invoke printCart() on their cart.
  void printInfo() {
    print('==> $name: \$${price.toStringAsFixed(2)}');
  }
}

//Create a Cart class that holds a List<Product> and methods to manage items.
class Cart {
  List<Product> products;

  Cart() : products = [];
  // Allow the User to addaddItem(Product p)
  void addItem(Product p) {
    products.add(p);
    print('Added ${p.name} to the cart.');
  }

//  remove Product objects from the Cart  ==>  removeItem(String productName)
  void removeItem(String productName) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].name == productName) {
        products.removeAt(i);
        print('Removed $productName from the cart.');
        return;
      }
    }
    print('$productName not found in the cart.');
  }

//printCart(),
  void printCart() {
    print('\nCart Contents:');
    if (products.isEmpty) {
      print('The cart is empty.');
    } else {
      for (var product in products) {
        product.printInfo();
      }
    }
  }

//  totalPrice().
  double totalPrice() {
    return products.fold(0.0, (total, product) => total + product.price);
  }
}

//Create a User class with name and a Cart.
class User {
  String name;
  Cart cart;

  User(this.name) : cart = Cart();

  void printUserInfo() {
    print('\nUser: $name');
    cart.printCart();
    print('Total Price: \$${cart.totalPrice().toStringAsFixed(2)}');
  }
}

// Main function
void main() {
  // Creating products
  Product phone = Product('Smartphone', 499.99);
  Product earphones = Product('Earphones', 29.99);

  // Creating a user
  User john = User('John Doe');

  // Adding items to the user's cart
  john.cart.addItem(phone);
  john.cart.addItem(earphones);

  // Printing user info and cart contents
  john.printUserInfo();

  // Removing an item and printing cart again
  john.cart.removeItem('Earphones');
  john.printUserInfo();
}
