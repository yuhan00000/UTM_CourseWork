import java.util.*;

public class LE3 {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        // Part A Q1
        System.out.println("Question 1: No Output");
        double gpa[] = new double[4];

        // Part A Q2
        System.out.println("\nQuestion 2: No Output");
        int[] points = {90, 85, 88};

        // Part A Q3
        System.out.println("\nQuestion 3: ");
        printTotal("Total", 10, 20, 30);
        System.out.println("");

        // 1D array for student scores
        int[] scores = new int[5];
        for (int i = 0; i < scores.length; i++) {
            System.out.print("Enter score " + (i + 1) + ": ");
            scores[i] = input.nextInt();
        }

        // 2D array for marks of 3 students and 3 subjects
        int[][] marks = {
            {85, 78, 90},
            {88, 92, 79},
            {75, 80, 85}
        };

        // ArrayList of subjects
        ArrayList<String> subjects = new ArrayList<>();
        subjects.add("Math");
        subjects.add("Science");
        subjects.add("English");

        // Array of Student objects
        Student[] students = new Student[3];
        students[0] = new Student("Ali", 20);
        students[1] = new Student("Siti", 21);
        students[2] = new Student("Raj", 19);

        // ParT B Q4
        System.out.println("\nQuestion 4: No Output");
        int[][] matrix = {
            {1,2,3},
            {4,5,6},
            {7,8,9}
        };

        // Part B Q5
        System.out.println("\nQuestion 5: No Output");
        ArrayList<Double> grades = new ArrayList<Double> ();
        grades.add(4.00);
        grades.add(3.75);
        grades.add(3.33);

        // Part B Q6
        System.out.println("\nQuestion 6: ");
        printAverage(new int[] {10,20,30,40});

        // Part C Q7
        System.out.println("\nQuestion 7: ");
        int highestScore = findHighestScore(scores);
        System.out.println("Highest score: " + highestScore);

        // Part C Q8
        System.out.println("\nQuestion 8: ");
        printStudentInfo(students);

        // Part C Q9
        System.out.println("\nQuestion 9: ");
        int totalMarks = sumSubjectMarks(marks);
        System.out.println("Total marks: " + totalMarks);

        System.out.println("\nSubjects: " + subjects);
        System.out.println("\nGrades: " + grades);


        input.close();
    }

        // Part A Q3
        public static void printTotal(String title, int... values) {
            int total = 0;
            for (int val : values)
                total += val;
            System.out.println(title + ": " + total);
        }

        // Part B Q6, helper method printAverage
        public static void printAverage(int[] arr) {
            int sum = 0;

            for (int i : arr) 
                sum += i;

            double avg = (double) sum / arr.length;
            System.out.println("Average: " + avg);
        }

        // Part C Q7
        public static int findHighestScore (int[] scores) {
            int highest = scores[0];

            for(int i : scores) {
                if (i > highest)
                    highest = i;
            }
            return highest;
        }

        // Part C Q8
        public static void printStudentInfo(Student[] arr) {
            for (Student s1 : arr)
                System.out.println("Student: " + s1.getName() + ", Age: " + s1.getAge());
        }

        // Part C Q9
        public static int sumSubjectMarks(int[][]marks) {
            int total = 0;

            for (int row = 0; row < marks.length; row++) {
                for (int col = 0; col < marks[row].length; col++) {
                    total += marks[row][col];
                }
            }
            return total;
        }

}

// Student class
class Student {
    private String name;
    private int age;

    public Student(String name, int age) {
        this.name = name;
        this.age = age;
    }

    public String getName() { return name; }
    public int getAge() { return age; }
}

