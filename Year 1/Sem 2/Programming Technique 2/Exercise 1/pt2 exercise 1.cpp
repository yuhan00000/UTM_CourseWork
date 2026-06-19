// ? EXERCISE 1: INTRODUCTION TO CLASSES AND OBJECTS

// Programming Technique II
// Semester 2, 2023/2024

// Section: 01
// Member 1's Name: Evelyn Goh Yuan Qi  A23CS0222   Location: Sarawak (i.e. where are you currently located)
// Member 2's Name: Lim Yu Han  A23CS0241   Location: Johor
//
// Date and time of pair programming sessions:
//   4/4/2024 8pm  (Date, time and estimate duration)
//   _________  (Date, time and estimate duration)
// 
// Video link:
//   _________  

// ? Notes: Choose the debug mode "Console Program" to run the program.

#include <iostream>
#include <string>

using namespace std;


class Student 
{
	private:
		string name;
		string code;
		int score;
	public:
		Student(){
			name="";
			code="";
			score=0;
		}
        Student(string a,string b,int c): name(a),code(b),score(c){}
           
		void setName (string a) {
			name = a;
		}
		void setCode (string b) {
			code = b;
		}
		void setScore (int c) {
			score = c;
		}
		string getName () const {
			return name;
		}
		string getCode () const {
			return code;
		}
		int getScore () const {
			return score;
		}
		
		string getGrade(int c){
		if (c < 0 || c > 100) {
			return "Error";
		}
		else if (c >= 90) {
			return "A+";
		}
		else if (c >= 80) {
			return "A";
		}
		else if (c >= 75) {
			return "A-";
		}
		else if (c >= 70) {
			return "B+";
		}
		else if (c >= 65) {
			return "B";
		}
		else if (c >= 60) {
			return "B-";
		}
		else if (c >= 55) {
			return "C+";
		}
		else if (c >= 50) {
			return "C";
		}
		else if (c >= 45) {
			return "C-";
		}
		else if (c >= 40) {
			return "D+";
		}
		else if (c >= 35) {
			return "D";
		}
		else if (c >= 30) {
			return "D-";
		}
		else {
			return "E";
		}
		}
		
		double getGradePoint (string grade){
			if (grade == "A+") {
				return 4.00;
		}
		else if (grade == "A") {
			return 4.00;
		}
		else if (grade == "A-") {
			return 3.67;
		}
		else if (grade == "B+") {
			return 3.33;
		}
		else if (grade == "B") {
			return 3.00;
		}
		else if (grade == "B-") {
			return 2.67;
		}
		else if (grade == "C+") {
			return 2.33;
		}
		else if (grade == "C") {
			return 2.00;
		}
		else if (grade == "C-") {
			return 1.67;
		}
		else if (grade == "D+") {
			return 1.33;
		}
		else if (grade == "D") {
			return 1.00;
		}
		else if (grade == "D-") {
			return 0.67;
		}
		else {
			return 0.00;
		}
		}
		
		double pointEarned (double c, int creditHour)
		{
			return c*creditHour;
		}
		~Student() {}
};


int main()
{
	string name;
	string code;
	int score;
	Student s;
	int creditHOUR;
	char answer;
	string grade;
	double point;
	
	do
	{
	cout << "Enter the following data: " << endl;
	cout << "  Subject name => ";
	getline(cin,name);

	cout << "  Subject code => ";
	getline(cin,code);

	cout << "  Score earned => ";
	cin>> score;
	
	Student s (name,code, score);
	
	cout << endl
		 << endl;

	cout << "THE RESULT" << endl
		 << endl;

	cout << "Subject Code : " << s.getCode() << endl;
	cout << "Subject Name : " << s.getName() <<endl;
	creditHOUR=code[code.length() - 1] - '0';
	cout << "Credit Hour  : " << creditHOUR<<endl;
	cout << "Score Earned : " << s.getScore() <<endl;
	grade = s.getGrade(score);
	cout << "Grade Earned : " << grade << endl;
	point = s.getGradePoint(grade);
	cout << "Grade Point  : " << point << endl;
	cout << "Point Earned : " << s.pointEarned (point,creditHOUR) << endl;
	cout << endl;
	cout << "Do you want to continue? (y/n) => ";
	cin >> answer;
	cin.ignore();
	} while(answer == 'Y' || answer == 'y');
	
	system("pause");

	return 0;
}
