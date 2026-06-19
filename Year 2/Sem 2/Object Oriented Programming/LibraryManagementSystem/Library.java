// Library.java - Manages the book list
// Chapter 5: Uses ArrayList to manage dynamic book list
// Chapter 6: Aggregation (Library "has-a" list of Books)

import java.util.ArrayList;

public class Library {
    private ArrayList<Book> books = new ArrayList<>(); // Chapter 5: ArrayList
    // Chapter 6: Aggregation (Library "has-a" list of Books)

    public void addBook(Book book) {
        books.add(book); // Ch5: Add book to the list
        System.out.println("Book added.");
    }

    public void removeBook(String id) throws BookNotFoundException {
        Book book = findBook(id); // May throw exception
        books.remove(book); // Ch5: Remove book from the list
        System.out.println("Book removed.");
    }

    public void viewBooks() {
        if (books.isEmpty()) {
            System.out.println("No books found.");
            return;
        }
        for (Book book : books) {
            System.out.println(book);
        }
    }

    public void issueBook(String id) throws BookNotFoundException {
        Book book = findBook(id);
        if (!book.isIssued()) {
            book.issue();
            System.out.println("Book issued.");
        } else {
            System.out.println("Book already issued.");
        }
    }

    public void returnBook(String id) throws BookNotFoundException {
        Book book = findBook(id);
        if (book.isIssued()) {
            book.returned();
            System.out.println("Book returned.");
        } else {
            System.out.println("Book is not issued.");
        }
    }

    private Book findBook(String id) throws BookNotFoundException {
        for (Book b : books) {
            if (b.getId().equals(id)) {
                return b;
            }
        }
        throw new BookNotFoundException("Book ID " + id + " not found.");
    }
}