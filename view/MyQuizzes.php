<?php
include './Header.php';
include '../controller/MyQuizzesOperations.php';
?>
<html>
    <head>
        <meta charset="utf-8"/>

    </head>
    <body >
        <?php
        if (isset($_GET['name'])) {

            echo '<h1> Mr. "' . $_GET['name'] . '" Quizzes <h1>';

            $doctorName = $_GET['name'];
        } else {
            echo '<h1> Your Quizzes <h1>';

            $doctorName = $_SESSION['username'];
        }
        ?>

        <div class="container">



            <table class="containerr"> 

                <th>Quiz Code</th>
                <th>Quiz Name</th>
                <th>Full Mark</th>
                <th>Quiz Date</th>
                <th>Password</th>
                <?php
                if (!isset($_GET['name'])) {
                    echo '<th>State</th>';
                }
                ?>

                <?php
                $reult = MyQuizzesOperations::getMyQuizzes($doctorName);


// check if the statment is true

                if (!$reult) {
                    echo 'error2';
                } else {
                    while ($row = mysqli_fetch_array($reult, 1)) {

                        echo "<tr>";

                        echo "<td>" . $row['quiz_id'] . "</td>";
                        echo "<td>" . $row['quiz_name'] . "</td>";
                        echo "<td>" . $row['full_mark'] . "</td>";
                        echo "<td>" . $row['date'] . "</td>";

                        if ($row['password']) {
                            echo "<td>" . $row['password'] . "</td>";
                        } else {
                            echo "<td>" . 'No Password' . "</td>";
                        }
                        //Quiz state if Expired or not
                        $state = $row['state'];
                        $quizId = $row['quiz_id'];
                        if (!isset($_GET['name'])) {
                            if ($state == "Expired") {
                                $color = "btn-danger";
                                echo '<style>
                                        .button:hover:before{content:"Un";}
                                        .button:hover {background-color:#5cb85c }
                                    </style>';
                            } else {
                                $state = "Opened";
                                $color = "btn-success";
                                echo '<style>
                                        .button:hover:before{content:"Un ";}
                                        .button:hover {background-color:#d9534f !important; }
                                    </style>';
                            }
                            echo '<td><button value="UpdateQuize.php?state=' . $state . '&id=' . $quizId . '" onclick="location= this.value" class="button form-control col-sm-9 ' . $color . '" ">' . $state . '</button></td>';
                        }

                        echo "</tr>";
                    }
                }
                ?>
            </table>
        </div>

        <link href="../recources/js/bootstrap.min.js" rel="stylesheet" type="text/javascript"/>
    </body>
</html>