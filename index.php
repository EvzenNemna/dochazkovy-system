<?php
    session_start();

    require_once 'db_connect.php';
    include_once 'head.php';
    include_once 'foot.php';

    if (isset($_SESSION['username']) && isset($_SESSION['password'])) {
        header("Location: homepage.php");
    } else {
        header("Location: login.php");
    }

    function consolelog($text) {
        echo "<script>console.log('$text');</script>";
    }
?>

