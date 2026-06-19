#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>
using namespace std;
	
void readFile(char ans[][20], string name[], string matric[], int numRow, int numCol){

	ifstream infile("StudentAnswer.txt");
	
	

	for (int row=0; row<numRow; row++){
		infile >> name[row];
//		cout <<"Name: "<< name[row] << endl;
		
		infile >> matric[row];
//		cout << "Matric: " << matric[row] << endl;
		
		for (int col=0; col<20; col++){
			infile >> ans[row][col];
//			cout << "Ans: " << ans[row][col];
		}
	}
	
		
	infile.close();
	
}

void compareAnswer(char cAns[20], char ans[20], bool quesWrong[20], int& numQues, int& ansCorrect, int& ansWrong){
	ifstream incompans("CorrectAnswer.txt");
	
	numQues = 0;
	ansCorrect = 0;
	ansWrong = 0;
	
	for (int col=0; col<20; col++){
		incompans >> cAns[col];
		numQues += 1;
		
		if (ans[col] == cAns[col]){
			quesWrong[col] = true;
			ansCorrect += 1;
//			cout << "correct" << endl;
		}
		else{
			quesWrong[col] = false;
			ansWrong += 1;
//			cout << "wrong" << endl;
		}
	}
	
	incompans.close();
}

void printMissQuestion(int& ansWrong, bool quesWrong[][20], const char cAns[20], const char ans[][20], int studentRow){
	cout << "Number of the questions missed: " << ansWrong << endl;
	cout << "List of the questions missed: " << endl;
	cout << "Question \t Correct Answer \t Student Answer" << endl;
	
	for (int a=0; a<20; a++){
		if (quesWrong[studentRow][a] == false){
			cout << a+1 << "\t\t\t" << cAns[a] << "\t\t\t" << ans[studentRow][a] << endl;
		}
	}
}

void getResult(int ansCorrect[], const int numQues, int pctg[], char gred[], int numRow){
	for (int row=0; row<numRow; row++){
		pctg[row] = ansCorrect[row] * 100 / 20;

		if (pctg[row] >= 80)
			gred[row] = 'A';
		else if (pctg[row] >= 70)
			gred[row] = 'B';
		else if (pctg[row] >= 60)
			gred[row] = 'C';
		else
			gred[row] = 'F';
	}
}

void printReport(string name[], string matric[], int pctg[], char gred[], int numRow){
	ofstream outfile;
	outfile.open("StudentsAndGradeOutput.txt");
	
	outfile << "LIST OF STUDENTS AND GRADES" << endl << endl;;
	outfile << left << setw(19) << "NAME" << left << setw(18) << "ID" << left << setw(12) << "PERCENTAGE" << left << setw(13) << "GRADE" <<endl;
	
	for (int row=0; row<numRow; row++){
		if (name[row].empty()){
			break;
		}
		else{
			outfile << left << setw(10) << name[row] << right << setw(18) <<  matric[row] << right << setw(11) << pctg[row] << right << setw(13) << gred[row] << endl;
		}
	}
	
	outfile.close();
}

int main(){
	const int numRow = 40;
	const int numCol = 22;

	string studentID;
	char ans[numRow][20];
	string name[numRow];
	string matric[numRow];
	char cAns[20];
	bool quesWrong[numRow][20];
	int numQues;
	int ansCorrect[numRow];
	int ansWrong[numRow];
	int pctg[numRow];
	char gred[numRow];
	
	cout << "Enter the student ID: ";
	cin >> studentID;
	
	readFile (ans, name, matric, numRow, numCol);
	
	for (int row=0; row<numRow; row++){
		compareAnswer (cAns, ans[row], quesWrong[row], numQues, ansCorrect[row], ansWrong[row]);
	}
	
//	cout << "num ques: " << numQues << endl;
//	cout << "num ans correct: " << ansCorrect << endl;
//	cout << "num ans wrong: " << ansWrong << endl;
	
	int studentRow = -1;
	
	for (int row=0; row<numRow; row++){
		if (studentID == matric[row]){
			studentRow = row;
		}
	}
	
	if (studentRow != -1){
		cout << endl << "EXAM RESULT" << endl;
		cout << "Name: " << name[studentRow] << endl;
		cout << "Student ID: " << matric[studentRow] << endl;
	}
	else{
		cout << "Invalid" << endl;
	}
	
	printMissQuestion (ansWrong[studentRow], quesWrong, cAns, ans, studentRow);
	
	getResult (ansCorrect, numQues, pctg, gred, numRow);
	
	printReport (name, matric, pctg, gred, numRow);
	
	cout << endl << "Percentage: " << pctg[studentRow] << "% , GRED: " << gred[studentRow];
	
	return 0;
}