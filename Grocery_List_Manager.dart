import 'dart:io';

void main() {
  //Initialize an empty List<String> for grocery items

  List<String> groceryList = []; //the empty shopping list

  while (true) {
    print('\nGrocery List Manager: ');
    print("1. Add Item");
    print("2. Remove Item");
    print("3. View List");
    print("4. Search for Item");
    print("5. Exit");

    stdout.write("Enter your choice: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Enter item to add: ");
        String? item = stdin.readLineSync();

        if (item == null || item.isEmpty) {
          print("Invalid input!");
        } else {
          if (addItem(groceryList, item)) {
            print("Item added successfully.");
          } else {
            print("Failed to add item.");
          }
        }
        break;

      case '2':
        stdout.write("Enter item to remove: ");

        String? item = stdin.readLineSync();

        if (item == null || item.isEmpty) {
          print("Invalid input!");
        } else {
          if (removeItem(groceryList, item)) {
            print("Item removed successfully.");
          } else {
            print("Item not found.");
          }
        }
        break;

      case '3':
        displayList(groceryList, format: "uppercase");
        break;

      case '4':
        stdout.write("Enter item to search: ");

        String? item = stdin.readLineSync();

        if (item == null || item.isEmpty) {
          print("Invalid input!");
        } else {
          int? index = searchItem(groceryList, item);
          if (index != null) {
            print("Item found at position ${index + 1}.");
          } else {
            print("Item not found.");
          }
        }

        break;

      case '5':
        print("Exiting the program!");
        return;

      default:
        print("Invalid choice. Please try again.");
    }
  }
}

//A function to add items (returns a bool indicating success)
bool addItem(List<String> list, String item) {
  list.add(item);
  return true;
}

//A function to remove items (returns a bool indicating if the item existed)
bool removeItem(List<String> list, String item) {
  return list.remove(item);
}

//A function to search for items (returns the index or a special value if not found).

int? searchItem(List<String> list, String item) {
  int index = list.indexOf(item); // get the index of item by this fun
  //check
  if (index != -1) // If the item exists, return it to its place.
  {
    return index;
  } else //If not available, return null
  {
    return null;
  }
}

// Function to display the list with optional formatting
void displayList(List<String> list, {String format = "as-is"}) {
  if (list.isEmpty) {
    print("The list is empty.");
    return;
  }

  print("\nYour Grocery List:");
  for (int i = 0; i < list.length; i++) {
    String item = list[i];
    switch (format.toLowerCase()) {
      case "uppercase":
        item = item.toUpperCase();
        break;
      case "lowercase":
        item = item.toLowerCase();
        break;
      default:
        break;
    }
    print("${i + 1}. $item");
  }
}
