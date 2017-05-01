<?php

// this page >> Respons on take the user to the correct page on his type

session_start();


include '../controller/RegisterOPerations.php';

if (isset($_POST['finish'])) {

    $_SESSION['usertype'] = $_POST['type'];
    $_SESSION['username'] = $_POST['username'];

    $user = $_POST['username'];
    $pass = $_POST['password'];
    $email = $_POST['email'];
    $type = $_POST['type'];
    $birthDay = $_POST['birth_day'];
    $country = $_POST['country'];
    $gender = $_POST['gender'];

  //  $gender = 'male';
    $phone = $_POST['phone'];
    //$image = addslashes(file_get_contents($_FILES['image']['tmp_name']));
    $univers = $_POST['university'];
    $faculty = $_POST['faculty'];

    echo $user . "    " . $email;

    $resultForUsername = RegisterOperations::usernameChecker($user);
    $resultForEmail = RegisterOperations::emailChecker($email);

    if ($row = mysqli_fetch_array($resultForUsername, 1)) {

        header('Location: signup.php?errors=usernameerror');
    }

    else if ($row2 = mysqli_fetch_array($resultForEmail, 1)) {

        header('Location: signup.php?errors=emailerror');
    } 
    
    
    else {
        RegisterOperations::signUp($user, $pass, $email, $type, $birthDay, $country, $phone, $univers, $faculty, $gender);

        switch ($_POST['type']) {

            case "admin":
                header('Location: adminhome.php');
                break;
            case "doctor":
                header("Location: doctorhome.php");
                break;
            case "student":
                header("Location: home.php");
                break;
        }
    }
} else {
    $userName = $_POST['username'];
    $password = $_POST['password'];

    echo $userName . "    " . $password;

    $result = RegisterOperations::loginChecker($userName, $password);


    // check if the statment is true
    // check if the username of password is correct

    if ($row = mysqli_fetch_array($result, 1)) { // get some data before login to late use
        $_SESSION['userid'] = $row['id'];
        $_SESSION['username'] = $row['username'];
        $_SESSION['usertype'] = $row['type'];
        $_SESSION['userimage'] = $row['image'];

        switch ($_SESSION['usertype']) {

            case "admin":
                header('Location: adminhome.php');
                break;
            case "doctor":
                header("Location: doctorhome.php");
                break;
            case "student":
                header("Location: home.php");
                break;
        }
    } else {

        header('Location: login.php?errors=error');
    }
}
?>