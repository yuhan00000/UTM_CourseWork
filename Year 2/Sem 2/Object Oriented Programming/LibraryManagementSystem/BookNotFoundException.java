// BookNotFoundException.java - Custom checked exception
// Chapter 9: Exception Handling (Custom exception)

public class BookNotFoundException extends Exception {
    public BookNotFoundException(String message) {
        super(message);
    }
}