//Define an Ingredient class with attributes name, quantity (double), and unit (String).

class Ingredient {
  //Attributes
  String name;
  double quantity;
  String unit;

  Ingredient(this.name, this.quantity, this.unit);

//Include a printInfo() method to display the ingredient’s details.
  void printInfo() {
    print('$name: $quantity $unit');
  }
}

// Define a Recipe class with a String name and a List<Ingredient>.
class Recipe {
  String name;
  List<Ingredient> ingredients;

  Recipe(this.name) : ingredients = [];

//Implement addIngredient(Ingredient i)
  void addIngredient(Ingredient i) {
    ingredients.add(i);
    print('Added ${i.name} to $name recipe.');
  }

//Implement removeIngredient(String ingredientName)
  void removeIngredient(String ingredientName) {
    for (var i = 0; i < ingredients.length; i++) {
      if (ingredients[i].name == ingredientName) {
        ingredients.removeAt(i);
        print('Removed $ingredientName from $name recipe.');
        return;
      }
    }
    print('$ingredientName not found in $name recipe.');
  }

//Implement  printRecipe() method.
  void printRecipe() {
    print('\nRecipe: $name');
    if (ingredients.isEmpty) {
      print('No ingredients added yet.');
    } else {
      print('Ingredients:');
      for (var ingredient in ingredients) {
        ingredient.printInfo();
      }
    }
  }
}

// Main function
void main() {
  // create multiple Ingredient objects
  Ingredient flour = Ingredient('Flour', 200.0, 'grams');
  Ingredient sugar = Ingredient('Sugar', 100.0, 'grams');
  Ingredient butter = Ingredient('Butter', 50.0, 'grams');

  // and at least one Recipe object.
  Recipe cake = Recipe('Vanilla Cake');

  // Adding ingredients to the recipe
  cake.addIngredient(flour);
  cake.addIngredient(sugar);
  cake.addIngredient(butter);

  // Printing the recipe
  cake.printRecipe();

  // Removing an ingredient and printing the recipe again
  cake.removeIngredient('Sugar');
  cake.printRecipe();
}
