<?php

include "db.php"; // Using database connection file here

if (isset($_GET['id'])) {

    $id = $_GET['id'];

    // prepare the SQL statement
    $statement = $conn->prepare("DELETE FROM students WHERE ID = ?");  // ? is a placeholder for $id value
    $statement->bind_param("i", $id);  // "i" indicate type integer


    // execute the SQL statement
    if ($statement->execute()) {
        echo "<script>alert('User Deleted Successfully'); window.location='view.php'</script>";
    } else {
        echo "<script>alert('User Not Deleted'); window.location='view.php'</script>";
    }

    // close the prepared statement
    $statement->close();
}


?>