#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
using namespace std;

const int NUM_CEREALS = 10;
double carbSumPercentDV = 0, proteinSumPercentDV = 0, fatSumPercentDV = 0;	// Sum of Percentage Daily Values
double carbAvgPercentDV, proteinAvgPercentDV, fatAvgPercentDV; 	//Average of each nutrient's percentage daily values
double data[NUM_CEREALS][3];   // 0: Carbohydrate, 1: Protein, 2: Fat
double dailyValue[3] = {300.0, 50.0, 65.0};   // Daily recommended values
double carbPercentDV[10], proteinPercentDV[10], fatPercentDV[10];   // Percentage Daily Values
string carbAvgCategory, proteinAvgCategory, fatAvgCategory, cereal1[10], carbCategory[10], proteinCategory[10], fatCategory[10];
char cereal2[10];
double carb[10], protein[10], fat[10];
char choice1, choice2;
char choose = 'Y';

// function prototype
void calconvert(double[], double[], double[], int);
void calDV(double[], double[], double[], int);
void calAvgPercentDV(double[], double [], double [], int);
void category(double[], string, int);
void cerealList(char, char, double[], double[], double[]);


//function definition
// Function to convert ounce value to gram
void calconvert(double carb[], double protein[], double fat[], int i) 
    {
    	carb[i] *= 28.35;
        protein[i] *= 28.35;
        fat[i] *= 28.35;
}


// Function to calculate %DV
void calDV(double carb[], double protein[], double fat[], int i) 
    {
    carbPercentDV[i] = (carb[i] / dailyValue[0]) * 100;
    proteinPercentDV[i] = (protein[i] / dailyValue[1]) * 100;
    fatPercentDV[i] = (fat[i] / dailyValue[2]) * 100;
}


// Function to calculate average %DV
void calAvgPercentDV(double carbPercentDV[], double proteinPercentDV[], double fatPercentDV[], int i) 
    {
    carbSumPercentDV += carbPercentDV[i];
    carbAvgPercentDV = carbSumPercentDV / NUM_CEREALS;
    
    proteinSumPercentDV += proteinPercentDV[i];
    proteinAvgPercentDV = proteinSumPercentDV / NUM_CEREALS;
    
    fatSumPercentDV += fatPercentDV[i];
    fatAvgPercentDV = fatSumPercentDV / NUM_CEREALS;
}

// Function to categorize each nutrient value
void category(double carbPercentDV[], double proteinPercentDV[], double fatPercentDV[], double carbAvgPercentDV, double proteinAvgPercentDV, double fatAvgPercentDV, int i) 
{
	if (carbPercentDV[i] <= 5) 
		carbCategory[i] = "low";
	else if (carbPercentDV[i] > 5 && carbPercentDV[i] < 20)
		carbCategory[i] = "moderate";
	else if (carbPercentDV[i] >= 20)
		carbCategory[i] = "high";
		
	if (proteinPercentDV[i] <= 5) 
		proteinCategory[i] = "low";
	else if (proteinPercentDV[i] > 5 && proteinPercentDV[i] < 20)
		proteinCategory[i] = "moderate";
	else if (proteinPercentDV[i] >= 20)
		proteinCategory[i] = "high";
		
	if (fatPercentDV[i] <= 5) 
		fatCategory[i] = "low";
	else if (fatPercentDV[i] > 5 && fatPercentDV[i] < 20)
		fatCategory[i] = "moderate";
	else if (fatPercentDV[i] >= 20)
		fatCategory[i] = "high";
	
    if (carbAvgPercentDV <= 5) 
		carbAvgCategory = "low";
	else if (carbAvgPercentDV > 5 && carbAvgPercentDV < 20)
		carbAvgCategory = "moderate";
	else if (carbAvgPercentDV >= 20)
		carbAvgCategory = "high";
		
	if (proteinAvgPercentDV <= 5) 
		proteinAvgCategory = "low";
	else if (proteinAvgPercentDV > 5 && proteinAvgPercentDV < 20)
		proteinAvgCategory = "moderate";
	else if (proteinAvgPercentDV >= 20)
		proteinAvgCategory = "high";
		
	if (fatAvgPercentDV <= 5) 
		fatAvgCategory = "low";
	else if (fatAvgPercentDV > 5 && fatAvgPercentDV < 20)
		fatAvgCategory = "moderate";
	else if (fatAvgPercentDV >= 20)
		fatAvgCategory = "high";
}

void cerealList(char choice1, char choice2, double carbPercentDV[], double proteinPercentDV[], double fatPercentDV[]) 
{
	int num = 1;
	if (choice1 == '1'){
		if (choice2 == '1'){
			cout << endl << endl << "List of cereal(s) with low amount of carbohydrate: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (carbPercentDV[i] <= 5) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
		else if (choice2 == '2') {
			cout << endl << endl << "List of cereal(s) with moderate amount of carbohydrate: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (carbPercentDV[i] > 5 && carbPercentDV[i] < 20) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
		else if (choice2 == '3') {
			cout << endl << endl << "List of cereal(s) with high amount of carbohydrate: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (carbPercentDV[i] >= 20) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
	}
	num = 1;
    if (choice1 == '2'){
		if (choice2 == '1'){
			cout << endl << endl << "List of cereal(s) with low amount of protein: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (proteinPercentDV[i] <= 5) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
		else if (choice2 == '2') {
			cout << endl << endl << "List of cereal(s) with moderate amount of protein: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (proteinPercentDV[i] > 5 && proteinPercentDV[i] < 20) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
		else if (choice2 == '3') {
			cout << endl << endl << "List of cereal(s) with high amount of protein: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (proteinPercentDV[i] >= 20) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
	}
	num = 1;
	if (choice1 == '3'){
		if (choice2 == '1'){
			cout << endl << endl << "List of cereal(s) with low amount of fat: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (fatPercentDV[i] <= 5) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
		else if (choice2 == '2') {
			cout << endl << endl << "List of cereal(s) with moderate amount of fat: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (fatPercentDV[i] > 5 && fatPercentDV[i] < 20) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
		else if (choice2 == '3') {
			cout << endl << endl << "List of cereal(s) with high amount of fat: " << endl << endl;
			for (int i = 0; i < NUM_CEREALS; i++) {
				if (fatPercentDV[i] >= 20) {
					cout << num << ". " << cereal1[i] << " " << cereal2[i] << endl;
					num++;
				}
			}
		}
	}
}


int main() {
	fstream infile ("cereal.txt", ios::in);
	for (int i = 0; i < NUM_CEREALS; i++) {
		infile >> cereal1[i] >> cereal2[i] >> carb[i] >> protein[i] >> fat[i];
	}
	infile.close();
	
	for (int i = 0; i < NUM_CEREALS; i++) {
		calconvert(carb, protein, fat, i);
		calDV(carb, protein, fat, i);
		calAvgPercentDV(carbPercentDV, proteinPercentDV, fatPercentDV, i);
	}
	while (choose != 'N' && choose != 'n') {
	 	cout << "\t1. Carbohydrate" << endl;
		cout << "\t2. Protein" << endl;
		cout << "\t3. Fat" << endl << endl;
		cout << "Please enter your choice>> ";
		cin >> choice1;
		cout << endl << endl << "\t1. Low" << endl;
		cout << "\t2. Moderate" << endl;
		cout << "\t3. High" << endl << endl;
		cout << "Please enter your choice>> ";
		cin >> choice2;
		
		cerealList(choice1, choice2, carbPercentDV, proteinPercentDV, fatPercentDV);
		
		cout << endl << endl << "Choose again? Y/N >> ";
		cin >> choose; 
	}
	
	
	fstream outfile ("Case Study Question 1 Output.txt", ios::out);
	outfile << "Type\t\tCarbohydrate\t\tProtein\t\t\tFat" << endl;
	outfile << "========\t=============\t\t=======\t\t\t===" << endl;
	
	for (int i = 0; i < NUM_CEREALS; i++)
		category(carbPercentDV, proteinPercentDV, fatPercentDV, carbAvgPercentDV, proteinAvgPercentDV, fatAvgPercentDV, i); 
	
	for (int i = 0; i < NUM_CEREALS; i++) {
		outfile << cereal1[i] << " " << cereal2[i] << "\t" << right << setw(4) << fixed << setprecision(1) << carbPercentDV[i] << "%(" << carbCategory[i] << ")\t\t" << right << setw(4) << fixed << setprecision(1) <<  proteinPercentDV[i] << "%(" << proteinCategory[i] << ")\t\t" << right << setw(4) << fixed << setprecision(1) << fatPercentDV[i] << "%(" << fatCategory[i] << ")" << endl;
	}
	
	outfile << endl << endl << "The ten cereal types produce an average %DV of: " << endl;
	outfile << "Carbohydrate\t: " << setprecision(0) << carbAvgPercentDV << "%(" << carbAvgCategory << ")" << endl;
	outfile << "Protein\t\t: " << setprecision(0) << proteinAvgPercentDV << "%(" << proteinAvgCategory << ")" << endl;
	outfile << "Fat\t\t: " << setprecision(0) << fatAvgPercentDV << "%(" << fatAvgCategory << ")" << endl;
}
