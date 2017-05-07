<?php include './Header.php'; ?>
<html>
    <head>

        <meta charset="utf-8"/>

    </head>
    <body>
        <br>
        <br>
        <br>

        <div class="">
            <?php
            //connect to data base and create table for result
            include '../include/vars.php';
            $conn = mysqli_connect($host, $username, $password, $dbname);
            if ($conn->error)
                die("connection lost");
            $sql = "SELECT quizzes.quiz_id, quizzes.quiz_name, users.username, quizzes.password from quizzes JOIN users on users.id = quizzes.doctor_id where quizzes.state = 'opend'";
            $result = $conn->query($sql);
            if (!$result)
                die($conn->error);
            //display result in table
            if ($result->num_rows > 0) {
                echo '<div class="containerr">';
                echo '<table class="containerr"><thead>'
                . '<tr><th>Quiz Code</th>'
                . '<th>Quiz Name</th>'
                . '<th>Doctor name</th>'
                . '<th>Secure</th>'
                . '</tr><thead><tbody>';
                while ($row = $result->fetch_assoc()) {
                    $id = $row['quiz_id'];
                    $name = $row['quiz_name'];
                    $password = $row['password'];
                    $maker = $row['username'];

                    if ($_SESSION['usertype'] == "student") {

                        echo '<tr>'
                        . '<td><a href="Quiz.php?id=' . $id . '&&maker=' . $maker . '&&name=' . $name . '">' . $name . '</a></td>'
                        . '<td>' . $id . '</td><td>' . $maker . '</td>';
                    } else {

                        echo '<tr>'
                        . '<td>' . $name . '</td>'
                        . '<td>' . $id . '</td><td>' . $maker . '</td>';
                    }
                    if (empty($password)) {
                        echo '<td><img src="../recources/images/1.png" style="max-width:25px; "></td>';
                    } else {
                        echo '<td><img src="../recources/images/0.png " style="max-width:25px;"></td>';
                    }
                    echo '</tr>';
                }
                echo '</tbody></table></div>';
            }
            ?>
        </div>
        <link href="../recources/js/bootstrap.min.js" rel="stylesheet" type="text/javascript"/>
    </body>
</html>