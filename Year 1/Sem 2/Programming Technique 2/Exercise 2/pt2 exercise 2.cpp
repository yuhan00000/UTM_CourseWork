// ? EXERCISE 2: CLASS AND OBJECT MANIPULATIONS

// Programming Technique II
// Semester 2, 2023/2024

// Section: 02
// Member 1's Name: LIM YU HAN  A23CS0241  Location: ____________ (i.e. where are you currently located)
// Member 2's Name: EVELYN GOH YUAN QI  A23CS0222  Location: ____________
//
// Date and time of pair programming sessions:
//   03/05/2024  (Date, time and estimate duration)
//   03/05/2024  (Date, time and estimate duration)
//
// Video link:
//   _________

// ? Notes: Choose the debug mode "Console Program" to run the program.

#include <iostream>
#include <string>
#include <iomanip>

using namespace std;

#define MAX_SUBJECT_COUNT 10

class Subject
{
private:
	string name;
	string code;
	int score;


public:
	Subject();
	int credit() const;
	string grade() const;
	double point() const;
	void print() const;
	friend int readUserInput(Subject []);
	friend Subject lower(Subject, Subject);
	bool operator< (const Subject &);
};


int main()
{
	Subject subjects[MAX_SUBJECT_COUNT];
	Subject lowestSubject;
	int numSub = readUserInput(subjects);
	
	
	cout << endl
		 << endl
		 << "THE RESULT"
		 << endl
		 << endl;

	// Print the output table header
	cout << left << setw(15) << "Subject Code";
	cout << left << setw(30) << "Subject Name";
	cout << left << setw(10) << "Credit";
	cout << left << setw(10) << "Score";
	cout << left << setw(10) << "Grade";
	cout << left << setw(10) << "Point";
	cout << left << setw(10) << "Sub Total";
	cout << endl
		 << endl;
		 
		 
	double totalPoints = 0;
	int totalCredits = 0;
	
	for (int i = 0; i < numSub; i++)
	{
		subjects[i].print();
		totalPoints += subjects[i].point() * subjects[i].credit();
		totalCredits += subjects[i].credit();
	}
		 

	cout << endl;
	cout << "TOTAL POINT  : " << totalPoints << endl;
	cout << "TOTAL CREDIT : " << totalCredits << endl;
	cout << "GPA          : " << setprecision(1) << totalPoints / totalCredits << endl;

	cout << endl;
	cout << "LOWEST SUBJECT : " << endl;
	lowestSubject = lower(subjects[0], subjects[1]);
	
	for (int i = 2; i < numSub; i++) {
        lowestSubject = lower(lowestSubject, subjects[i]);
    }
    
    lowestSubject.print();
	cout << endl;

	system("pause");

	return 0;
}

// The definition of the default constructor is fully given
Subject::Subject() : name(""), code(""), score(0) {}

// The definition of the getter for the 'credit()' is fully given
int Subject::credit() const { return code[7] - '0'; }

// The definition of the getter for the 'grade()' is fully given
string Subject::grade() const
{
	if (score >= 90)
		return "A+";
	if (score >= 80)
		return "A";
	if (score >= 75)
		return "A-";
	if (score >= 70)
		return "B+";
	if (score >= 65)
		return "B";
	if (score >= 60)
		return "B-";
	if (score >= 55)
		return "C+";
	if (score >= 50)
		return "C";
	if (score >= 45)
		return "C-";
	if (score >= 40)
		return "D+";
	if (score >= 35)
		return "D";
	if (score >= 30)
		return "D-";
	return "E";
}

double Subject :: point() const 
{
    if (grade() == "A+") return 4.00;
	else if (grade() == "A") return 4.00;
	else if (grade() == "A-") return 3.67;
	else if (grade() == "B+") return 3.33;
	else if (grade() == "B") return 3.00;
	else if (grade() == "B-") return 2.67;
	else if (grade() == "C+") return 2.33;
	else if (grade() == "C") return 2.00;
	else if (grade() == "C-") return 1.67;
	else if (grade() == "D+") return 1.33;
	else if (grade() == "D") return 1.00;
	else if (grade() == "D-") return 0.67;
	else return 0.00;
}

void Subject :: print() const
{
	cout << left << setw(15) << code;
	cout << left << setw(30) << name;
	cout << left << setw(10) << credit();
	cout << left << setw(10) << score;
	cout << left << setw(10) << grade();
	cout << left << setw(10) << fixed << setprecision(2) << point();
	cout << left << setw(10) << fixed << setprecision(2) << point() * credit() << endl;	
}

// Define a regular function that read a list of subjects from user input
int readUserInput(Subject subjects[])
{
	int numSubjects;
	cout << "How many subjects do you want to enter? => " ;
	cin >> numSubjects;
	cout << endl;
	
	for (int i = 0; i < numSubjects; i++)
	{
		
		cout << "Enter info for subject #" << i + 1 << ":" << endl;
		cout << "Subject Code => ";
		cin >> subjects[i].code;
		cin.ignore();
		cout << "Subject name => ";
		getline(cin, subjects[i].name);
		cout << "Score earned => ";
		cin >> subjects[i].score;
		cout << endl;
	}
	return numSubjects;
}


bool Subject :: operator< (const Subject &obj)
{
	 return score < obj.score;
}

// Define a regular function that determines the lower subject.
Subject lower(Subject a, Subject b)
{
	if (a < b)
	   return a;
	else 
	   return b;
}
