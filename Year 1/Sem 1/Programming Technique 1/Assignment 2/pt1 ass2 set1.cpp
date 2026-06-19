#include <iostream>
#include <iomanip>

using namespace std;

int main() {
    char gender;
    int age;
    double height, weight;
    

    do {
        cout << "Basal Metabolic Rate (BMR) Calculator" << endl;
        
        // Input age
        do {
            cout << "Age [15-80]: ";
            cin >> age;
        } while (age < 15 || age > 80);

        // Input gender
        do {
            cout << "Gender [F @ M]: ";
            cin >> gender;
            gender = tolower(gender);
        } while (gender != 'f' && gender != 'm');

        // Input height and weight
        cout << "Height (cm): ";
        cin >> height;

        cout << "Weight (kg): ";
        cin >> weight;
        
        // Function calculate BMR using Mifflin-St Jeor Equation
        double bmr;
        if (gender == 'm') {
            bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
        } 
		else {
            bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
        }
        
        // Calculate bmr
        cout << fixed << setprecision(2);
        cout << "\nBMR = " << bmr << " Calories/ day (using Mifflin-St Jeor Equation)\n\n";

        // Display Daily Calorie Needs based on activity level
        cout << "Daily calorie needs based on activity level\n\n";
        cout << "Activity Level\t\t\t\t\t\tCalorie\n";
        cout << "Sedentary: little or no exercise\t\t\t" << 1727 << endl;
        cout << "Exercise 1-3 times/week\t\t\t\t\t" << 1979 << endl;
        cout << "Exercise 4-5 times/week\t\t\t\t\t" << 2108 << endl;
        cout << "Daily exercise or intense exercise 3-4 times/week\t" << 2230 << endl;
        cout << "Intense exercise 6-7 times/week\t\t\t\t" << 2482 << endl;
        cout << "Very intense exercise daily, or physical job\t\t" << 2734 << endl;
        
        cout << "\nExercise: 15-30 minutes of elevated heart rate activity." << endl;
        cout << "Intense exercise: 45-120 minutes of elevated heart rate activity." << endl;
        cout << "Very intense exercise: 2+ hours of elevated heart rate activity." << endl;

        // Ask if the user wants to enter other data
        char choice;
        do {
            cout << "\nDo you want to enter other data? [Y @ N]: ";
            cin >> choice;
            choice = tolower(choice);
        } while (choice != 'y' && choice != 'n');

        if (choice == 'n') {
            cout << "\nThank you :)\n";
            break;
        }

    } while (true);

    return 0;
}
