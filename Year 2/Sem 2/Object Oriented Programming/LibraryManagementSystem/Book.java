// Book.java - Represents a Book in the Library
// Chapter 5: Uses object to store in ArrayList

public class Book {
    private String id;
    private String title;
    private String author;
    private boolean isIssued;
    
    // Constructor
    public Book(String id, String title, String author) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.isIssued = false;
    }

    // Getters
    public String getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public boolean isIssued() { return isIssued; }
    
    // Issue and return book
    public void issue() { isIssued = true; }
    public void returned() { isIssued = false; }

    // To display book info
    @Override
    public String toString() {
        return id + " - " + title + " by " + author + (isIssued ? " [Issued]" : " [Available]");
    }
}