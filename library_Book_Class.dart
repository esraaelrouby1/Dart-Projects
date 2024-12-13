//Class and Objects: Define a Book class.
class Book {
  //Define a Book class with title, author, and a bool isAvailable property (default to true).

  String title;
  String author;
  bool isAvailable;
  //Implement a constructor that sets title and author
  Book({required this.title, required this.author}) : isAvailable = true;

  //Implement methods:

  //checkOut() sets isAvailable to false.
  void checkOut() {
    if (isAvailable) {
      isAvailable = false;
      print('The book "$title" has been checked out.');
    } else {
      print('The book "$title" is already checked out.');
    }
  }

  //returnBook() sets isAvailable to true.
  void returnBook() {
    if (isAvailable) {
      print('The book "$title" was not checked out.');
    } else {
      isAvailable = true;
      print('The book "$title" has been returned.');
    }
  }

//printInfo() prints book details including availability.
  void printInfo() {
    print(
        'Title: $title\nAuthor: $author\nAvailable: ${isAvailable ? "Yes" : "No"}\n');
  }
}

// Main function
void main() {
  // Create several Book objects
  Book book1 = Book(title: 'hh', author: 'ahmed');
  Book book2 = Book(title: 'eee', author: 'esraa');
  Book book3 = Book(title: 'mm', author: 'mahmoud');
  // Print information for all books
  book1.printInfo();
  book2.printInfo();
  book3.printInfo();

  // Simulate checking out and returning books
  book1.checkOut();
  book1.printInfo();
  book1.returnBook();
  book1.printInfo();

  book2.checkOut();
  book2.printInfo();

  book3.returnBook(); // Attempt to return a book not checked out
  book3.checkOut();
  book3.printInfo();
}
