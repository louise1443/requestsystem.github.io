<?php
// Adminlogout.php
session_start();
session_unset();
session_destroy();
header("Location: User.php");
exit;
