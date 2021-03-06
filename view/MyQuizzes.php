<?php
include './Header.php';
include '../controller/MyQuizzesOperations.php';
include '../controller/AdminOperations.php';
?>
<html>
    <head>
        <meta charset="utf-8"/>
        <link href="../recources/css/style1.css" rel="stylesheet" /> 
        <style type="text/css">
            body{
                background: url("../recources/images/back2.jpg") no-repeat right top;
                width: 100%;
                height: 100%
            }
            .remove {
                font-size:1em; 
                font-weight: bold;
                font-size: 25;
                display: block;
                padding: 0;
                margin:0;
                color: #000;
              }
              .remove:hover{
                  color: red;
              }
              .atest {
                display: block;
                padding-bottom: 0;
                margin:0; 
                color: #000;
              }


        </style>
     </head>
    <body >
        <?php
        if (isset($_SESSION['usertype']) == 'doctor' && isset($_GET['deletequizid'])) {
            $quizId = $_GET['deletequizid'];
            AdminOperations::deleteQuiz($quizId);
        }

        if (isset($_GET['name'])) {

            echo '<h1> Mr. "' . $_GET['name'] . '" Quizzes <h1>';

            $doctorName = $_GET['name'];
        } else {
            $doctorName = $_SESSION['username'];
        }
        ?>

        <?php
        $reult = MyQuizzesOperations::getMyQuizzes($doctorName);


// check if the statment is true

        if (!$reult) {
            echo 'error2';
        } else {
            if ($reult->num_rows > 0) {
                echo '<h1> Your Quizzes <h1>';
                echo '<div class="container">
                        <table class="containerr table">
                        <thead>
                        <tr><th>Quiz Code</th>
                        <th>Quiz Name</th>
                        <th>Full Mark</th>
                        <th>Quiz Date</th>
                        <th>Password</th>
                        <th>State</th>
                        <th>Delete</th>
                        </tr></thead>';
                $trID = 0;
            } else {
                die("<h1>You haven\'t any quizzes</h1>");
            }
            while ($row = mysqli_fetch_array($reult, 1)) {
                $trID++;
                $id = $row['quiz_id'];
                $time = $row['time'];

                echo "<tr id = '$trID'>";
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

                        $stateIcon = "<img id = 'close' src = '../recources/images/closed-icon.png' height = '30'>";

                        echo '<style>
                          #close:hover{background-color:red;}
                          </style>';

                        //   .button:hover:before{content:"Un";}                        $color = "btn-danger";
                        //  .button:hover {background-color:#5cb85c }
                    } else {

                        $stateIcon = "<img id = 'open' src = '../recources/images/open-icon.png' height = '30'>";

                        /*    $state = "Opened";
                          $color = "btn-success";
                          echo '<style>
                          .button:hover:before{content:"Un ";}
                          .button:hover {background-color:#d9534f !important; }
                          </style>';
                         */
                    }

                    $removeIcon = "<img src = '../recources/images/105.png' height = '30'>";

                    echo "<td><a href = 'UpdateQuize.php?state=$state&id=$quizId' onClick=\"click(event)\"> $stateIcon </a></td>";
                    echo "<td><a href = 'MyQuizzes.php?deletequizid=$id' onClick=\"click(event)\"> $removeIcon </a></td>";
                }
                echo "</tr>";
                ?>

                <script>
                    function click(e) {
                        e.preventDefault();
                        e.stopPropagation();
                        return confirm('Are you Sure you Want to Delete this Quiz?');
                    }
                    var quiz_id = <?php echo json_encode($row['quiz_id']); ?>;
                    var quizName = <?php echo json_encode($row['quiz_name']) ?>;
                    var quizMaker = <?php echo json_encode($_SESSION['username']) ?>;
                    var fullMark = <?php echo json_encode($row['full_mark']) ?>;
                    var pass = <?php echo json_encode($row['password']) ?>;
                    var time = <?php echo json_encode($row['time']) ?>;

                    var id = <?php echo json_encode($trID) ?>;

                    var link = "ReviewQuiz.php?id=" + quiz_id + "&name=" + quizName + "&maker=" + quizMaker + "&fullmark=" + fullMark + "&pass=" + pass + "&time=" + time;

                    $("#" + id).attr('href', link);

                    $("#" + id).on("click", function () {
                        document.location = $(this).attr('href');
                    });
                </script>


                <?php
            }
            echo '</table></div>';
        }
        ?>


    </body>
</html>