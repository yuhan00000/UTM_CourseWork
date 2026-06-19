#include "LibrarySystem.h"
#include <iostream>
#include <string>

using namespace std;

// Book class implementation
Book::Book(string bookName, string bookAuthor, bool availability) 
    : name(bookName), author(bookAuthor), isAvailable(availability) {}

string Book::getName() const {
    return name;
}

string Book::getAuthor() const {
    return author;
}

bool Book::getAvailability() const {
    return isAvailable;
}

void Book::setAvailability(bool availability) {
    isAvailable = availability;
}

// Student class implementation
Student::Student(string studentID, string studentPassword, double initialPenalty) 
    : id(studentID), password(studentPassword), penalty(initialPenalty) {}

string Student::getId() const {
    return id;
}

double Student::getPenalty() const {
    return penalty;
}

void Student::setPenalty(double newPenalty) {
    penalty = newPenalty;
}

bool Student::authenticate(string studentPassword) const {
    return password == studentPassword;
}

// Admin class implementation
Admin::Admin(string adminID, string adminPassword) 
    : id(adminID), password(adminPassword) {}

string Admin::getId() const {
    return id;
}

string Admin::getPassword() const {
    return password;
}

bool Admin::authenticate(string adminID, string adminPassword) const {
    return id == adminID && password == adminPassword;
}

// LibrarySystem class implementation
LibrarySystem::LibrarySystem() : admin("admin", "123456") {
    students.push_back(Student("123", "234567",25.0));
    students.push_back(Student("456","456789", 0.0));
    books.push_back(Book("C++ Programming", "John", true));
    books.push_back(Book("Data Structure", "Jane", true));
}

void LibrarySystem::adminLogin() {
    string adminID, adminPassword;
    cout << "Enter Admin ID: ";
    cin >> adminID;
    cout << "Enter Admin Password: ";
    cin >> adminPassword;

    if (admin.authenticate(adminID, adminPassword)) {
        char option;
        do {
            cout << endl;
            cout << "WELCOME, ADMIN! :) :)" << endl;
            cout << endl;
            cout << "Press 'p' to check student penalties, 'a' to add new books, or 'q' to log out: ";
            cin >> option;

            if (option == 'p') {
                checkStudentPenalty();
            } else if (option == 'a') {
                addBook();
            } else if (option != 'q') {
                cout << "Invalid option selected." << endl;
            }
        } while (option != 'q');
    } else {
        cout << "Authentication failed." << endl;
    }
}

void LibrarySystem::studentLogin() {
    string studentID, studentPassword;
    cout << "Enter Student ID: ";
    cin >> studentID;
    cout << "Enter Student Password: ";
    cin >> studentPassword;

    bool found = false;
    for (const auto& student : students) {
        if (student.getId() == studentID && student.authenticate(studentPassword)) {
            found = true;
            char option;
            do {
                cout << endl;
                cout << "WELCOME, STUDENT! ^_^ ^_^" << endl;
                cout << endl;
                cout << "Press 's' to search for books, 'b' to borrow books, 'r' to return books, or 'q' to log out: ";
                cin >> option;

                if (option == 's') {
                    searchBook();
                } else if (option == 'b') {
                    borrowBook();
                } else if (option == 'r') {
                    returnBook();
                } else if (option != 'q') {
                    cout << "Invalid option selected." << endl;
                }
            } while (option != 'q');
            break;
        }
    }
    if (!found) {
        cout << "Student ID not found." << endl;
    }
}

void LibrarySystem::addBook() {
    char addMore = 'y';
    while (addMore == 'y') {
        string bookName, author;
        char bookStatus;
        cout << "Enter the name of the book: ";
        cin.ignore();
        getline(cin, bookName);
        cout << "Enter the author of the book: ";
        getline(cin, author);
        cout << "Is the book available for students to borrow? (y/n): ";
        cin >> bookStatus;
        books.emplace_back(bookName, author, bookStatus == 'y');
        cout << "\n///Book added successfully.///" << endl;
        cout << "Add more books? (y/n): ";
        cin >> addMore;
    }
}

void LibrarySystem::checkStudentPenalty() {
    string id;
    cout << "Please enter Student's ID to check his or her penalties: ";
    cin >> id;
    bool found = false;
    for (const auto& student : students) {
        if (student.getId() == id) {
            cout << endl;
            cout << "There is a late fee of RM " << student.getPenalty() << " for this student." << endl;
            found = true;
            break;
        }
    }
    if (!found) {
        cout << "Student ID not found." << endl;
    }
}

void LibrarySystem::searchBook() {
    string bookName;
    cout << "Please Enter the name of the book to search: ";
    cin.ignore();
    getline(cin, bookName);
    bool found = false;
    for (const auto& book : books) {
        if (book.getName() == bookName) {
            cout << "**  Book found  ** " << endl;
            cout << endl;
            cout << "Title          :" << book.getName() << endl;
            cout << "Author         :" << book.getAuthor() << endl;
            cout << "Book Status    :" << (book.getAvailability() ? "Yes" : "No") << endl;
            found = true;
            break;
        }
    }
    if (!found) {
        cout << "**  Book not found  **" << endl;
    }
}

void LibrarySystem::borrowBook() {
    string bookName;
    cout << "Please Enter the title of the book to borrow: ";
    cin.ignore();
    getline(cin, bookName);
    bool found = false;
    for (auto& book : books) {
        if (book.getName() == bookName && book.getAvailability()) {
            book.setAvailability(false);
            cout << endl;
            cout << "// You have successfully borrowed the book: " << book.getName() << " //" << endl;
            found = true;
            break;
        }
    }
    if (!found) {
        cout << "Book not found or not available." << endl;
    }
}

void LibrarySystem::returnBook() {
    string bookName;
    cout << "Please Enter the name of the book to return: ";
    cin.ignore();
    getline(cin, bookName);
    bool found = false;
    for (auto& book : books) {
        if (book.getName() == bookName && !book.getAvailability()) {
            book.setAvailability(true);
            cout << endl;
            cout << "// You have successfully returned the book: " << book.getName() << " //" << endl;
            found = true;
            break;
        }
    }
    if (!found) {
        cout << "Book not found or it was not borrowed." << endl;
    }
}
