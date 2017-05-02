<?php

class MyQuizzesOperations {

    public static function getMyQuizzes($doctorName) {

        include '../include/vars.php';

        $conn = new mysqli($host, $username, $password, $dbname);

        //Get all Quizzes for doctor that has doctor_name = 'dr.ahmed'

        $query = "SELECT quiz_id, quiz_name, full_mark, date, password from quizzes "
                . "where doctor_name = '" . $doctorName . "'";

        $result = mysqli_query($conn, $query);

        if (mysqli_error($conn)) {
            echo 'My Quizzes OperationsError !!';

            return NULL;
        } else {
            return $result;
        }
    }

    public static function getMyQuizzesCount($doctorName) {
        $result = MyQuizzesOperations::getMyQuizzes($doctorName);
        $num = mysqli_num_rows($result);
        return $num;
    }

    public static function getQuizQuestionsByID($id) {



        include '../include/vars.php';

        $conn = new mysqli($host, $username, $password, $dbname);

        //Get all Quizzes for doctor that has doctor_name = 'dr.ahmed'

        $query = "SELECT `question_id`, `header`, `correct_answer` FROM `questions` JOIN quizzes on quizzes.quiz_id = questions.quiz_id WHERE questions.quiz_id = '$id'";

        
        $result = mysqli_query($conn, $query);

        if (mysqli_error($conn)) {
            echo 'My Quizzes OperationsError !!';

            return NULL;
        } else {
            return $result;
        }
    }
    
    
      public static function getAnsOnly($id) {



        include '../include/vars.php';

        $conn = new mysqli($host, $username, $password, $dbname);

        //Get all Quizzes for doctor that has doctor_name = 'dr.ahmed'

        $query = "SELECT `answer_1`, `answer_2`, `answer_3`, `answer_4` FROM `questions` JOIN quizzes on quizzes.quiz_id = questions.quiz_id WHERE questions.quiz_id = '$id'";

        
        $result = mysqli_query($conn, $query);

        if (mysqli_error($conn)) {
            echo 'My Quizzes OperationsError !!';

            return NULL;
        } else {
            return $result;
        }
    }

}

?>