<html>

    <head>
        <title>Student Registration</title>

        <style>
            body{
                background-color: rgb(230, 238, 230);
                text-align: center;
                border-style: double;
                padding: 10px;
                margin: 0;
                max-width: 600px;
                margin-left: auto;
                margin-right: auto;
            }

            h3.solid{
                border: 3px solid rgb(196, 208, 245);
                padding: 8px;
                background-color: rgb(196, 208, 245);
            }

            button {
                padding: 7px;
                border: 2px solid;
                border-radius: 5px;
                cursor: pointer;
            }

        </style>
    </head>
    
    <body>
    <img src="logo_utm.png" alt="This is UTM logo" width="500" height="150" style="display: block; margin: auto;">
        <h1 style="text-align: center;">Add New Student</h1>

        <h3 class="solid">Student Personal Details</h3>

        <form action="register.php" method="POST">

            <label> Name: </label>
            <input type="text" name="name" required><br>

            <label> Matric No: </label>
            <input type="text" name="matricno" required><br>

            <label> Email: </label>
            <input type="email" name="email" required><br>

            <label> Phone number: </label>
            <input type="text" name="phone" required><br>

            <label> Gender: </label>
            <input type="radio" name="gender" value="Male" required> Male
            <input type="radio" name="gender" value="Female" required> Female<br>

            <label> Date of Birth: </label>
            <input type="date" name="dob" required><br>

            <h3 class="solid">Academic Information</h3>

            <label> Programme of Study: </label>
            <select name="programme" required>
                <option value="Data Engineering">Data Engineering</option>
                <option value="Software Engineering">Software Engineering</option>
                <option value="Network Security">Network Security</option>
                <option value="Bioinfometrics">Bioinfometrics</option>
                <option value="Graphic Design">Graphic Design</option>
            </select><br>

            <label> Year of Study: </label>
            <select name="yearstudy" required>
                <option value="Year 1">Year 1</option>
                <option value="Year 2">Year 2</option>
                <option value="Year 3">Year 3</option>
                <option value="Year 4">Year 4</option>
            </select><br>

            <h3 class="solid">Subject Selection</h3>

            
            <input type="checkbox" name="subject[]" value="Digital Logic">
            <label for="subject1">Digital Logic</label><br>
            <input type="checkbox" name="subject[]" value="Discrete Structure">
            <label for="subject2">Discrete Structure</label><br>
            <input type="checkbox" name="subject[]" value="Programming Technique 1">
            <label for="subject3">Programming Technique 1</label><br>
            <input type="checkbox" name="subject[]" value="Programming Technique 2">
            <label for="subject4">Programming Technique 2</label><br>
            <input type="checkbox" name="subject[]" value="Computer Organization Architecture">
            <label for="subject5">Computer Organization Architecture</label><br><br>

            <button type="submit" style="background-color: rgb(201, 245, 196); border: rgb(201, 245, 196);"
                                    onmouseover="this.style.border='3px solid green';"
                                    onmouseout="this.style.border='2px solid rgb(201, 245, 196)';"> Add Student </button>
            <button type="reset" style="background-color: rgb(245, 207, 207); border: rgb(245, 207, 207);"
                                    onmouseover="this.style.border='3px solid red';"
                                    onmouseout="this.style.border='2px solid rgb(245, 207, 207)';"> Reset </button> 

        </form>

            <a href="view.php"> View Registered Student List </a><br>

    </body>

</html>


<?php

include "db.php"; //using database connection file here

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $name = $_POST['name'];
    $matricno = $_POST['matricno'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $gender = $_POST['gender'];
    $dob = $_POST['dob'];
    $programme = $_POST['programme'];
    $yearstudy = $_POST['yearstudy'];

    // combine the selected subjects into a single string, separated by commas
    if(!empty($_POST['subject'])) {
        $subject = implode(",", $_POST['subject']);
    } else {
        $error_message = "You must select at least one subject.";
    }


    $statement = $conn->prepare("INSERT INTO students (name, matricno, email, phone, gender, dob, programme, yearstudy, subject) 
                                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    $statement->bind_param("sssssssss", $name, $matricno, $email, $phone, $gender, $dob, $programme, $yearstudy, $subject);

    if ($statement->execute()) {
        echo "<script>alert('Registration successfully'); window.location='register.php'</script>";
    } else {
        echo "<script>alert('Error during registration: " . $statement->Error . "'); window.location='register.php'</script>";
    }

    $statement->close();
}

?>