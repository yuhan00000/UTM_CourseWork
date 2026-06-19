// Librarian.java - Represents the librarian role
// Chapter 6: Association (Librarian uses Library class)
// Chapter 7: Inheritance (Extends User)
// Chapter 8: Polymorphism (Overrides displayMenu())


import java.util.Scanner;

public class Librarian extends User {  // Chapter 7: Inheritance (Librarian extends User)
    private Library library;

    public Librarian(String name, String userId, Library library) {
        super(name, userId);
        this.library = library;
    }

    @Override
    public void displayMenu() {
        Scanner sc = new Scanner(System.in);
        int choice;

        do {
            System.out.println("\n=== Librarian Menu ===");
            System.out.println("1. Add Book");
            System.out.println("2. Delete Book");
            System.out.println("3. View All Books");
            System.out.println("4. Issue Book"); // When user borrow from library, librarian process it
            System.out.println("5. Return Book"); // When user returns book to library, librarian help to returns the book
            System.out.println("6. Exit");
            System.out.print("Enter choice: ");
            choice = sc.nextInt();
            sc.nextLine();

            switch (choice) {
                case 1: {
                    System.out.print("Enter Book ID: ");
                    String id = sc.nextLine();
                    System.out.print("Enter Title: ");
                    String title = sc.nextLine();
                    System.out.print("Enter Author: ");
                    String author = sc.nextLine();
                    library.addBook(new Book(id, title, author));
                    break;
                }
                case 2: {
                    System.out.print("Enter Book ID to delete: ");
                    String id = sc.nextLine();
                    try {
                        library.removeBook(id);
                    } catch (BookNotFoundException e) {
                        System.out.println(e.getMessage());
                    }
                    break;
                }
                case 3: {
                    library.viewBooks();
                    break;
                }
                case 4: {
                    System.out.print("Enter Book ID to issue: ");
                    String id = sc.nextLine();
                    try {
                        library.issueBook(id);
                    } catch (BookNotFoundException e) {
                        System.out.println(e.getMessage());
                    }
                    break;
                }
                case 5: {
                    System.out.print("Enter Book ID to return: ");
                    String id = sc.nextLine();
                    try {
                        library.returnBook(id);
                    } catch (BookNotFoundException e) {
                        System.out.println(e.getMessage());
                    }
                    break;
                }
                case 6: {
                    System.out.println("Exiting system...");
                    break;
                }
                default: {
                    System.out.println("Invalid choice!");
                    break;
                }
            }
        } while (choice != 6);
    }
}