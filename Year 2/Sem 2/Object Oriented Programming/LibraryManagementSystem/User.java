// User.java - Abstract class
// Chapter 7: Inheritance (Superclass)
// Chapter 8: Polymorphism via abstract method

// User.java - Abstract class
public abstract class User {
    protected String name;
    protected String userId;

    public User(String name, String userId) {
        this.name = name;
        this.userId = userId;
    }
    
    // Chapter 8: Polymorphic method to be overridden
    public abstract void displayMenu();
}