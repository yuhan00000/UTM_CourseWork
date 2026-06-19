#include <iostream>
#include <string>
#include <sstream>
#include <iomanip>
using namespace std;

#define MAX_SIZE 100

// Class to represent a customer
class Customer {
public:
    int customerID;
    string name;
    string contactNumber;
    string checkInDate;
    string checkOutDate;
    double totalPayment;

    Customer() {}

    Customer(int id, string n, string contact, string checkIn, string checkOut) {
        customerID = id;
        name = n;
        contactNumber = contact;
        checkInDate = checkIn;
        checkOutDate = checkOut;
        totalPayment = calculatePayment(checkIn, checkOut);
    }

     // Simplified function to calculate the total payment based on check-in and check-out dates
    double calculatePayment(const string& checkIn, const string& checkOut) {
        int checkInDay, checkOutDay;

        // Extracting days from the input dates (assuming YYYY-MM-DD format)
        checkInDay = stoi(checkIn.substr(8, 2));
        checkOutDay = stoi(checkOut.substr(8, 2));

        int days = checkOutDay - checkInDay;

        if (days <= 0) {
            cout << "Error: Check-out date must be after check-in date.\n";
            return 0;
        }

        return days * 99.00; // RM99 per night
    }

    void displayCustomer() {
        cout << "Customer ID: " << customerID << endl;
        cout << "Name: " << name << endl;
        cout << "Contact: " << contactNumber << endl;
        cout << "Check-In Date: " << checkInDate << endl;
        cout << "Check-Out Date: " << checkOutDate << endl;
        cout << "Total Payment: RM" << fixed << setprecision(2) << totalPayment << endl;
    }

        static void customerMenu(class Booking& hotelBooking, int& customerID);

};

// Queue Class
class Booking {
private:
    Customer bookings[MAX_SIZE];
    Customer processed[MAX_SIZE];
    int front;
    int rear;
    int size;
    int pSize;  // processed bookings size

public:
    Booking() {
        front = 0;
        rear = -1;
        size = 0;
        pSize = 0; 
    }

    bool isFull() { return size == MAX_SIZE; }
    bool isEmpty() { return size == 0; }

    void enqueue(Customer c) {
        if (isFull()) {
            cout << "Queue is full. Cannot add more bookings.\n";
            return;
        }
        rear = (rear + 1) % MAX_SIZE;
        bookings[rear] = c;
        size++;
        cout << "Booking added successfully for " << c.name << ".\n";
    }

    void dequeue() {
        if (isEmpty()) {
            cout << "Queue is empty. No bookings to process.\n";
            return;
        }
        // Process the booking
        cout << "Processing booking for " << bookings[front].name << "...\n";
        addp(bookings[front]);
        front = (front + 1) % MAX_SIZE;
        size--;
    }

// add processed bookings
    void addp(Customer c) {
        if (pSize == MAX_SIZE) {
            cout << "Processed bookings storage is full.\n";
            return;
        }
        processed[pSize++] = c;
    }

    void displayBookings() {
        if (isEmpty()) {
            cout << "No bookings in the queue.\n";
            return;
        }

        cout << "\n=== Current Bookings ===\n";
        int count = 0;
        for (int i = front; count < size; i = (i + 1) % MAX_SIZE, count++) {
            cout << "Booking " << count + 1 << ":\n";
            bookings[i].displayCustomer();
            cout << "--------------------------\n";
        }
    }

//display processed bookings
    void displayp() {
        if (pSize == 0) {
            cout << "No processed bookings yet.\n";
            return;
        }

        cout << "\n=== Processed Bookings ===\n";
        for (int i = 0; i < pSize; ++i) {
            cout << "Processed Booking " << i + 1 << ":\n";
            processed[i].displayCustomer();
            cout << "--------------------------\n";
        }
        cout << "Total Processed Bookings: " << pSize<< endl;
    }

    void peek() {
        if (isEmpty()) {
            cout << "No bookings to process.\n";
            return;
        }
        cout << "\nNext booking to process:\n";
        bookings[front].displayCustomer();
    }

void rejectBooking(const string& name) {
    if (isEmpty()) {
        cout << "No bookings to reject.\n";
        return;
    }

    int found = -1;

    for (int i = front; i != rear; i = (i + 1) % MAX_SIZE) {
        if (bookings[i].name == name) {
            found = i;
            break;
        }
    }

    if (bookings[rear].name == name) {
        found = rear;
    }

    if (found == -1) {
        cout << "No booking found with name: " << name << "\n";
        return;
    }

    for (int i = found; i != rear; i = (i + 1) % MAX_SIZE) {
        bookings[i] = bookings[(i + 1) % MAX_SIZE];
    }
    rear = (rear - 1 + MAX_SIZE) % MAX_SIZE;
    size--;
    cout << "Booking for " << name << " has been rejected by staff.\n";
}

    // Add this method to the class
    void cancelBooking(const string& name) {
        if (isEmpty()) {
            cout << "No bookings to cancel.\n";
            return;
        }

        int found = -1;
        // Search for the booking
        for (int i = front; i != rear; i = (i + 1) % MAX_SIZE) {
            if (bookings[i].name == name) {
                found = i;
                break;
            }
        }
        // Check the rear position as well
        if (bookings[rear].name == name) {
            found = rear;
        }

        if (found == -1) {
            cout << "No booking found with name: " << name << "\n";
            return;
        }

        // Remove the booking and shift elements
        for (int i = found; i != rear; i = (i + 1) % MAX_SIZE) {
            bookings[i] = bookings[(i + 1) % MAX_SIZE];
        }
        rear = (rear - 1 + MAX_SIZE) % MAX_SIZE;
        size--;
        cout << "Booking for " << name << " has been cancelled.\n";
    }
};

// Customer menu
void Customer::customerMenu(Booking& hotelBooking, int& customerID) {
    int choice;
    do {
        cout << "\n=== Customer Menu ===\n";
        cout << "1. Add Booking\n";
        cout << "2. Cancel Booking\n";
        cout << "3. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
        case 1: {
            string name, contact, checkIn, checkOut;
            cout << "Enter your name: ";
            cin.ignore();
            getline(cin, name);
            cout << "Enter contact number: ";
            getline(cin, contact);
            cout << "Enter check-in date (YYYY-MM-DD): ";
            getline(cin, checkIn);
            cout << "Enter check-out date (YYYY-MM-DD): ";
            getline(cin, checkOut);

            Customer c(customerID++, name, contact, checkIn, checkOut);
            hotelBooking.enqueue(c);
            break;
        }
        case 2: {
            string name;
            cout << "Enter Customer Name to cancel booking: ";
            cin.ignore();
            getline(cin, name);
            hotelBooking.cancelBooking(name);
            break;
        }
        case 3:
            cout << "Exiting Customer Menu.\n";
            break;
        default:
            cout << "Invalid choice. Please try again.\n";
        }
    } while (choice != 3);
}

// Class to represent staff
class Staff {
public:
    // Hotel Staff login system
    static bool hotelStaffLogin() {
        const int numStaff = 2;
        string usernames[numStaff] = {"staff1", "staff2"};
        string passwords[numStaff] = {"password1", "password2"};

        string username, password;
        cout << "Enter username: ";
        cin >> username;
        cout << "Enter password: ";
        cin >> password;

        for (int i = 0; i < numStaff; ++i) {
            if (usernames[i] == username && passwords[i] == password) {
                cout << "Login successful. Welcome, " << username << "!\n";
                return true;
            }
        }
        cout << "Invalid credentials. Access denied.\n";
        return false;
    }
    // Staff menu
    static void staffMenu(Booking& hotelBooking) {
        int choice;
        do {
            cout << "\n=== Hotel Staff Menu ===\n";
            cout << "1. Process Booking\n";
            cout << "2. View Next Booking\n";
            cout << "3. View All Bookings\n";
            cout << "4. View Processed Bookings\n";
            cout << "5. Reject Bookings\n";
            cout << "6. Logout\n";
            cout << "Enter your choice: ";
            cin >> choice;

            switch (choice) {
            case 1:
                hotelBooking.dequeue();
                break;
            case 2:
                hotelBooking.peek();
                break;
            case 3:
                hotelBooking.displayBookings();
                break;
            case 4:
                hotelBooking.displayp();
                break;
            case 5: {
                string name;
                cout << "Enter Customer Name to reject booking: ";
                cin.ignore();
                getline(cin, name);
                hotelBooking.rejectBooking(name);
                break;
            }
            case 6:
                cout << "Logging out.\n";
                break;
            default:
                cout << "Invalid choice. Please try again.\n";
            }
        } while (choice >= 1 && choice < 6);
    }
};

// Main function
int main() {
    Booking hotelBooking;
    int customerID = 1;
    int mainChoice;

    do {
        cout << "\n=== Budget Hotel Booking System ===\n";
        cout << "1. Customer\n";
        cout << "2. Hotel Staff\n";
        cout << "3. Exit\n";
        cout << "Enter your choice: ";
        cin >> mainChoice;

        switch (mainChoice) {
        case 1:
            Customer::customerMenu(hotelBooking, customerID);
            break;
        case 2:
            if (Staff::hotelStaffLogin()) {
                Staff::staffMenu(hotelBooking);
            }
            break;
        case 3:
            cout << "Exiting the system. Goodbye!\n";
            break;
        default:
            cout << "Invalid choice. Please try again.\n";
        }
    } while (mainChoice != 3);

    return 0;
}
