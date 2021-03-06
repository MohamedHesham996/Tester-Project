<?php
class HistoryOperations {
    public static function viewAllQuizzes($studentName) {
        include '../include/vars.php';
        $conn = new mysqli($host, $username, $password, $dbname);
        $query = "SELECT quizzes.quiz_id, quizzes.quiz_name, users.username, submits.mark, submits.time, quizzes.password, quizzes.full_mark from history "
                . "JOIN quizzes on history.doctor_id = quizzes.doctor_id "
                . "JOIN submits on submit_id = submits.id and history.student_name = '" . $studentName . "'"
                . "JOIN users on users.id = history.doctor_id and quizzes.quiz_id = history.quiz_id";
        $result = mysqli_query($conn, $query);
        if (mysqli_error($conn)) {
            echo 'error ';
            return NULL;
        } else {
            return $result;
        }
    }
    public static function getQuizzesCount($studentName) {
        $result = HistoryOperations::viewAllQuizzes($studentName);
        $num = mysqli_num_rows($result);
        return $num;
    }
}
?>