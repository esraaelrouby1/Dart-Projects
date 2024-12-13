//Define an Employee class
class Employee {
//Constructor: Initialize name, role, and salary.
  String name;
  String role;
  double salary;
  //Constructor
  Employee({required this.name, required this.role, required this.salary});

  //Methods:
//promote(newRole, salaryIncrease): Update the role and increase the salary.
  void promote(String newRole, double salaryIncrease) {
    role = newRole;
    salary += salaryIncrease;
    print(
        '$name has been promoted to $newRole with a salary increase of $salaryIncrease.');
  }

  //printDetails(): Display the employee’s current information.
  void printDetails() {
    print('Employee Details:\nName: $name\nRole: $role\nSalary: \$salary\n');
  }
}

// Main function
void main() {
  // Create multiple Employee objects
  Employee emp1 = Employee(name: 'Esraa', role: 'Developer', salary: 70000);
  Employee emp2 = Employee(name: 'Ahmed', role: 'ui/ux', salary: 45000);
  Employee emp3 = Employee(name: 'Mahmoud', role: 'Manager', salary: 60000);

  // Print details for all employees
  emp1.printDetails();
  emp2.printDetails();
  emp3.printDetails();

  // Promote employees and print updated details
  emp1.promote('Senior Developer', 10000);
  emp1.printDetails();

  emp2.promote('Lead Designer', 8000);
  emp2.printDetails();

  emp3.promote('Senior Manager', 12000);
  emp3.printDetails();
}
