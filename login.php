<?php
    session_start();
    require_once 'db_connect.php';
    require_once 'head.php';
?>
<body>
    <div class="formdiv">
        <h2 style="width:fit-content; margin: 25px auto 0 auto; padding-bottom: 25px; font-size: 21px; font-weight: 500;">Přihlášení</h2>
        <form name="form" method="post" action="login.php">
            <div class="flexbox">
                <input type="text" id="username" name="username" placeholder="Username">
            </div>
            <div class="flexbox">
                <input type="password" id="password" name="password" placeholder="Password">
            </div>
            <div class="flexbox" id="buttonwrapper">
                <button type="submit" class="button">Přihlásit</button>
            </div>
        </form>
    </div>
</body>
<?php
    if (isset($_POST['username']) && isset($_POST['password'])) {
        $tempUsername = trim($_POST['username']);
        $tempPassword = trim($_POST['password']);


        if ($tempUsername != "" and $tempPassword != "") {
            $username = $_SESSION['username'] = $_POST['username'];
            $password = $_SESSION['password'] = $_POST['password'];
        
            $sql = "SELECT * FROM user WHERE username= BINARY '$username' AND password= BINARY '$password'";
            $count = ($conn->query($sql))->num_rows;

            if ($count > 0) {
                $userId = ($conn->query($sql))->fetch_assoc()['id'];
                $sql = "SELECT id FROM userlogin;";
                $loginCount = ($conn->query($sql))->num_rows;
    
                $sql = "UPDATE userlogin SET login = NOW() WHERE user_id=$userId";
                $result = $conn->query($sql);
            }
        
            if ($count > 0) {  
                header("Location: homepage.php");
                $_SESSION['loggedin'] = true;
            } else {
                ?>
                    <div>
                        <h2 style="color: red; width:fit-content; margin: 50px auto 0 auto;">Neplatné přihlašovací údaje</h2>
                    </div>
                <?php
            }
        }
    }
?>