<?php
include("config.php");
//die('update Administrators set username="' .addslashes($_POST["username"]) .'", password="' . md5(addslashes($_POST["password_ch"])) .'" where username=' . $_POST["username"]);
    $con = mysqli_connect($host, $user, $pass, $data);
    $sql = 'update Settings set id="1", value="'.$_POST['title'].'",code="title" where id="1"';
    mysqli_query($con, $sql);
    mysqli_close($con);
    file_put_contents("data/head",$_POST["head"]);
    header('Location: index.php?page=cp#');
    
    ?>