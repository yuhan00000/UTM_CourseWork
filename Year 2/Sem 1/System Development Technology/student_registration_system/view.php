<html>

    <head>
        <title>Registered Student List</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: rgb(230, 238, 230);
                margin: 0;
                padding: 20px;
            }

            h2 {
                text-align: center;
                color:black;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px;
            }

            table, th, td {
                border: 1px solid #ccc;
            }

            td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #d3d3d3;
                color:black;
                padding:12px;
                text-align: center;
            }

        </style>
    </head>

    <body>
    <img src="logo_utm.png" alt="This is UTM logo" width="500" height="150" style="display: block; margin: auto;"><br>
        <h2>Registered Student List</h2>

        <table>

            <tr>
                <th> ID </th>
                <th> Name </th>
                <th> Matric No </th>
                <th> Email </th>
                <th> Phone number </th>
                <th> Gender </th>
                <th> Date of Birth </th>
                <th> Programme of Study </th>
                <th> Year of Study </th>
                <th> Subject Selection </th>
                <th> Update </th>
                <th> Delete </th>
            </tr>

            <?php

            include "db.php"; // using database connection file here

            // prepare the SQL statement
            $statement = $conn->prepare("SELECT * FROM students");
            $statement->execute();
            $result = $statement->get_result();

            if($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>". htmlspecialchars($row['id']) . "</td>";
                    echo "<td>". htmlspecialchars($row['name']) . "</td>";
                    echo "<td>". htmlspecialchars($row['matricno']) . "</td>";
                    echo "<td>". htmlspecialchars($row['email']) . "</td>";
                    echo "<td>". htmlspecialchars($row['phone']) . "</td>";
                    echo "<td>". htmlspecialchars($row['gender']) . "</td>";
                    echo "<td>". htmlspecialchars($row['dob']) . "</td>";
                    echo "<td>". htmlspecialchars($row['programme']) . "</td>";
                    echo "<td>". htmlspecialchars($row['yearstudy']) . "</td>";
                    echo "<td>". htmlspecialchars($row['subject']) . "</td>";
                    echo "<td> <a href='update.php?id=". htmlspecialchars($row['id']) . "'> Update </a> </td>";
                    echo "<td> <a href='delete.php?id=". htmlspecialchars($row['id']) . "'> Delete </a> </td>";
                    echo "</tr>";
                }
            } else {
                echo "<tr><td colspan='12'> No Data Found </td></tr>";
            }

            $statement->close();
            ?>

        </table>

            <a href="register.php">Add New Student</a>

    </body>

</html>