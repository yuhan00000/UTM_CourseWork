// Main.java - Program Entry
// Chapter 8: Polymorphism (user.displayMenu())
// Chapter 9: Input exception handling

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Library library = new Library();
        Scanner sc = new Scanner(System.in);

        System.out.println("=== Welcome to Library Management System ===");
        
        // Simulated login (You can extend to file or database)
        System.out.print("Enter Librarian ID: ");
        String id = sc.nextLine();
        System.out.print("Enter Password: ");
        String password = sc.nextLine();

        // Hardcoded credentials for demo
        if (id.equals("admin001") && password.equals("lib123")) {
            User librarian = new Librarian("Joanne", id, library);
            librarian.displayMenu();
        } else {
            System.out.println("Invalid login credentials!");
        }
    }
}