<?php
    session_start();
    unset($_SESSION['username']);
    unset($_SESSION['password']);
    unset($_SESSION['id']);
    $_SESSION['loggedin'] = false;
    session_regenerate_id();
    session_destroy();

    header("Location: login.php");
?>