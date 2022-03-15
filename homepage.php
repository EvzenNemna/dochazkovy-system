<?php
    session_start();
    require_once 'head.php';
    require_once 'db_connect.php';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
    <div class="maindiv">
        <h1>Vítejte 
            <?php
                echo $_SESSION['username'];
            ?>
        </h1>
        <p>
            <?php
                $username = $_SESSION['username'];
                $password = $_SESSION['password'];
        
                $sql = "SELECT class_id, role_id FROM user WHERE username = BINARY '$username' AND password= BINARY '$password';";
                $row = ($conn->query($sql))->fetch_assoc();
                $currentClass = $row['class_id'];
                $currentRole = $row['role_id'];
        
                $sql = "SELECT * FROM userlogin INNER JOIN user on userlogin.user_id = user.id WHERE role_id = 2 AND class_id = '$currentClass'";
                $result = $conn->query($sql);
                $count = $result->num_rows;
        
                if ($currentRole == 1) {
                    echo 
                    "<table>
                        <tr>
                            <th>Jméno</th>
                            <th>Třída</th>
                            <th>Příchod</th>
                        </tr>
                    </table>";
                    while ($row = $result->fetch_assoc()) {
                        $trida = "";
        
                        if ($currentClass == 1) {
                            $trida = "C3b";
                        } else {
                            $trida = "A4";
                        }
                        echo 
                        "<table>
                            <tr>
                                <td>" . $row['username'] . "</td>
                                <td>" . $trida . "</td>
                                <td>" . $row['login'] . "</td>
                            </tr>
                        </table>";
                    } 
                } else {
                    echo "Úspěně jste se přihlásil";
                }
            ?>
        </p>
        <form name="form "method="post" action="logout.php">
            <div class="flexbox" id="buttonwrapper">
                <input type="submit" value="Odhlásit se" class="button" id="btnHome"/>
            </div>
        </form>
    </div>  
</body>
</html>