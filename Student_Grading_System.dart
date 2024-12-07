import 'dart:io';
import 'dart:core';

void main() {
  print("Welcome to the Student Grading Application!");

  // List to store information of multiple students
  List<Map<String, dynamic>> students = [];

  // Loop to allow input for multiple students
  while (true) {
    print("\nEnter Student's Name:");
    String studentName = stdin.readLineSync()!;

    // Map to store a single student's information
    Map<String, dynamic> studentData = {
      'name': studentName,
      'scores': {},
    };

    // Subjects and their scores
    List<String> subjects = ['Math', 'Science', 'English'];
    double totalScore = 0;

    for (String subject in subjects) {
      while (true) {
        print("Enter score for $subject (0-100):");
        String? input = stdin.readLineSync();
        try {
          double score = double.parse(input!);
          if (score < 0 || score > 100) {
            throw Exception("Score out of range.");
          }
          studentData['scores'][subject] = score;
          totalScore += score;
          break;
        } catch (e) {
          print("Invalid input. Please enter a valid score between 0 and 100.");
        }
      }
    }

    // Calculate average
    double averageScore = totalScore / subjects.length;
    studentData['total'] = totalScore;
    studentData['average'] = averageScore;

    // Assign grade based on average score
    if (averageScore >= 90) {
      studentData['grade'] = 'A';
    } else if (averageScore >= 80) {
      studentData['grade'] = 'B';
    } else if (averageScore >= 70) {
      studentData['grade'] = 'C';
    } else if (averageScore >= 60) {
      studentData['grade'] = 'D';
    } else {
      studentData['grade'] = 'F';
    }

    // Add student's data to the list
    students.add(studentData);

    // Ask if the user wants to input another student
    print("Do you want to add another student? (yes/no):");
    String? response = stdin.readLineSync()?.toLowerCase();
    if (response != 'yes') break;
  }

  // Display summary
  print("\n Student Summary\n");

  for (var student in students) {
    print("Name: ${student['name']}");
    print("Scores:");
//
  for (var subject in student['scores'].keys) {
  print("  $subject: ${student['scores'][subject]}");
}
    
    print("Total Score: ${student['total']}");
    print("Average Score: ${student['average'].toStringAsFixed(2)}");
    print("Grade: ${student['grade']}\n");
  }
  print("Thank you for using the Student Grading Application!");
}
