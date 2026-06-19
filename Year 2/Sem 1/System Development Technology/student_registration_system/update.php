<html>

    <head>
        <title>Update Student</title>

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
    <h1 style="text-align: center;">Update Student</h1>

        <h3 class="solid">Student Personal Details</h3>

        <?php

        include "db.php"; // using database connectio file here

        if(isset($_GET['id'])){ // Check if id parameter is available inside url
            $id = $_GET['id']; // Get the id parameter value
            $sql = "SELECT * FROM students WHERE id=$id"; // SQL query to select user data based on id
            $result = mysqli_query($conn, $sql); // Execute the query
            $row = mysqli_fetch_assoc($result); // Fetch the result set into an associative array
        }

        ?>

        <form action="update.php?id=<?php echo $row['id']; ?>" method="POST">
            <label> Name: </label>
            <input type="text" name="name" value="<?php echo $row['name']; ?>" required><br>

            <label> Matric no: </label>
            <input type="text" name="matricno" value="<?php echo $row['matricno']; ?>" required><br>

            <label> Email: </label>
            <input type="email" name="email" value="<?php echo $row['email']; ?>" required><br>

            <label> Phone number: </label>
            <input type="text" name="phone" value="<?php echo $row['phone']; ?>" required><br>

            <label> Gender: </label>
            <input type="radio" name="gender" value="Male" <?php if ($row['gender'] == 'Male')echo 'checked'; ?>> Male
            <input type="radio" name="gender" value="Female" <?php if ($row['gender'] == 'Female')echo 'checked'; ?>> Female<br>

            <label> Date of Birth: </label>
            <input type="date" name="dob" value="<?php echo $row['dob']; ?>" required><br>

            <h3 class="solid">Academic Information</h3>

            <label> Programme of Study: </label>
            <select name="programme">
            <option value="Data Engineering" <?php if ($row['programme'] == 'Data Engineering') echo 'selected'; ?>>Data Engineering</option>
            <option value="Software Engineering" <?php if ($row['programme'] == 'Software Engineering') echo 'selected'; ?>>Software Engineering</option>
            <option value="Network Security" <?php if ($row['programme'] == 'Network Security') echo 'selected'; ?>>Network Security</option>
            <option value="Bioinfometrics" <?php if ($row['programme'] == 'Bioinfometrics') echo 'selected'; ?>>Bioinfometrics</option>
            <option value="Graphic Design" <?php if ($row['programme'] == 'Graphic Design') echo 'selected'; ?>>Graphic Design</option>
            </select><br>

            <label> Year of Study: </label>
            <select name="yearstudy">
                <option value="Year 1" <?php if($row['yearstudy'] == 'Year 1') echo 'selected'; ?>>Year 1</option>
                <option value="Year 2" <?php if($row['yearstudy'] == 'Year 2') echo 'selected'; ?>>Year 2</option>
                <option value="Year 3" <?php if($row['yearstudy'] == 'Year 3') echo 'selected'; ?>>Year 3</option>
                <option value="Year 4" <?php if($row['yearstudy'] == 'Year 4') echo 'selected'; ?>>Year 4</option>
            </select><br>

            <h3 class="solid">Subject Selection</h3>
            
            <?php
            //assuming $row['subject] is a comma-separated string of selected subjects
            $selected_subjects = explode(",", $row['subject']); //convert to array of selected subjects
            
            //list all subjects
            $all_subjects = ["Digital Logic", "Discrete Structure", "Programming Technique 1", "Programming Technique 2", "Computer Organization Architecture"];

            //loop through all subjects to generate checkboxes
            foreach($all_subjects as $subject) {
                //if the subject is in the selected subjects array, mark it as checked
                $checked = in_array($subject, $selected_subjects) ? "checked" : '';
                echo "<input type='checkbox' name='subject[]' value='$subject' $checked> $subject<br>";
            }

            ?>
            <br><button type="submit" style="background-color: rgb(201, 245, 196); border: rgb(201, 245, 196);"
                                        onmouseover="this.style.border='3px solid green';"
                                        onmouseout="this.style.border='2px solid rgb(201, 245, 196)';"> Update </button>
            <button type="reset" style="background-color: rgb(245, 207, 207); border: rgb(245, 207, 207);"
                                        onmouseover="this.style.border='3px solid red';"
                                        onmouseout="this.style.border='2px solid rgb(245, 207, 207)';"> Reset </button>
        </form>


        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $name = $_POST['name'];
            $matricno = $_POST['matricno'];
            $email = $_POST['email'];
            $phone = $_POST['phone'];
            $gender = $_POST['gender'];
            $dob = $_POST['dob'];
            $programme = $_POST['programme'];
            $yearstudy = $_POST['yearstudy'];
            $subject = implode(",", $_POST['subject']); // convert array to comma-separated string

            $id = $_GET['id']; // retrieve the id for the update query

            $statement = $conn->prepare("UPDATE students SET name=?, matricno=?, email=?, phone=?, gender=?, dob=?, programme=?, yearstudy=?, subject=?
                     WHERE id=?"); // SQL query to update user data based

            $statement->bind_param("sssssssssi", $name, $matricno, $email, $phone, $gender, $dob, $programme, $yearstudy, $subject, $id);

            if ($statement->execute()) {
                echo "<script>alert('Record updated successfully'); window.location='view.php'</script>";
            } else {
                echo "<script>alert('Error updating record: " . $statement->Error . "'; window.location='view.php'</script>";
            }

            $statement->close();
        }

        ?>
        
        <br>
        <a href="view.php"> Back to Registered Student List </a>

    </body>

</html>