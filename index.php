<?php
// User.php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Barangay Kaongkod Service Request System</title>
        <link rel="icon" type="image/png" href="system/kaongkodlogo.jpg">
        <style>
            body {
                margin: 0;
                padding: 0;
                height: 100vh;
                background-image: url("system/kaongkod.jpeg");
                background-size: cover;
                background-position: center;
                font-family: Arial, sans-serif;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                color: #fff;
            }
            h1 {
                margin: 15px 0; 
            }
            p {
                font-size: 14px;
                margin: 8px 0;
                color: #f8f9fa;
                font-weight: bold;
            }
            .btn {
                display: block;
                width: 200px;
                padding: 12px;
                margin: 10px auto;
                font-size: 16px;
                font-weight: bold;
                color: white;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                transition: background 0.3s;
                text-decoration: none;
                text-align: center;
            }
            .signup {
                background: #28a745;
            }
            .signup:hover {
                background: #218838;
            }
            .login {
                background: #007bff;
            }
            .login:hover {
                background: #0069d9;
            }
            /* Circular logo on page */
            .logo {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                object-fit: cover;
                border: 3px solid #fff;
                box-shadow: 0 4px 6px rgba(0,0,0,0.3);
                margin-bottom: 15px;
            }
        </style>
    </head>
    <body >
        <img src="system/kaongkodlogo.jpg" alt="Barangay Logo" class="logo">
        <h1>Welcome to Barangay Kaongkod Service Request System</h1>
        <p>Click <strong>Sign up</strong> if you don’t have an account.</p>
        <a href="USersignup.php" class="btn signup">Sign Up</a>

        <p>Click <strong>Log in</strong> if you already have an account.</p>
        <a href="Userlogin.php" class="btn login">Log In</a>
    </body>
</html>
