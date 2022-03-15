<?php
    require_once 'head.php';
?>
<body>
    <h2 style="width:fit-content; margin: 50px auto 0 auto;">Přihlášení</h2>
    <div id="form_div">
        <form name="form" method="post" action="login.php">
            <div class="flexbox">
                <label for="username">Username: </label>
                <input type="text" id="username" name="username">
            </div>
            <div class="flexbox">
                <label for="password">Password: </label>
                <input type="password" id="password" name="password">
            </div>
            <button type="submit" id="connect_button">Přihlásit</button>
        </form>
        <form name="formRegister" method="post" action="register.php">
            <button type="submit">Registrace</button>
        </form>
    </div>
</body>
</html>