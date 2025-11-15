<?php
// Usersignup.php
session_start();

// Database connection
$servername = "localhost";
$db_username = "root";
$db_password = "";
$database = "system";

$connection = new mysqli($servername, $db_username, $db_password, $database);
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$admin_id = $_SESSION["admin_id"] ?? 1;

$errorMessage = "";
$successMessage = "";
$name = $password = $confirmPassword = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = trim($_POST["name"] ?? "");
    $password = trim($_POST["password"] ?? "");
    $confirmPassword = trim($_POST["confirm_password"] ?? "");

    // Validation
    if ($name === "" || $password === "" || $confirmPassword === "") {
        $errorMessage = "All fields are required!";
    } elseif (!preg_match('/^(?=.*[A-Za-z]{4})(?=.*\d{4})[A-Za-z\d]{8}$/', $password)) {
        $errorMessage = "Password must contain exactly 4 letters and 4 numbers!";
    } elseif ($password !== $confirmPassword) {
        $errorMessage = "Passwords do not match!";
    } else {
        // Check if same name + password already exists
        $check = $connection->prepare("SELECT user_id FROM users_account WHERE name = ? password = ? LIMIT 1");
        if ($check) {
            $check->bind_param("ss", $name, $password);
            $check->execute();
            $check->store_result();
            if ($check->num_rows > 0) {
                $errorMessage = "This account already exists. Try logging in.";
            }
            $check->close();
        }

        // Insert into database if no errors
        if ($errorMessage === "") {
            $stmt = $connection->prepare("INSERT INTO users_account (admin_id, name, password) VALUES (?, ?, ?)");
            if ($stmt) {
                // ⚠️ Plain text password — for demo only, use hashing in production!
                $stmt->bind_param("iss",$admin_id, $name, $password);
                if ($stmt->execute()) {
                    // Auto-login: store session
                    $newUserId = $connection->insert_id;
                    $_SESSION["user_id"] = $newUserId;
                    $_SESSION["user_name"] = $name;

                    $successMessage = "Account created successfully!";
                } else { 
                    $errorMessage = "Database error: " . $stmt->error;
                }
                $stmt->close();
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Barangay Hilantagaan Service Request System</title>
    <link rel="icon" type="image/png" href="system/kaongkodlogo.jpg">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('system/kaongkod.jpeg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        /* Container with transparent green and animated border */
        .container {
            position: relative;
            background: rgba(0,255,0,0.1); /* invisible green */
            padding: 30px;
            border-radius: 12px;
            width: 350px;
            text-align: center;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            overflow: hidden;
        }

        /* Animated border flash */
        .container::before {
            content: "";
            position: absolute;
            inset: 0;
            border-radius: 12px;
            padding: 2px; /* border thickness */
            background: linear-gradient(
                90deg,
                rgba(144,238,144,0) 0%, 
                rgba(144,238,144,1) 50%, 
                rgba(144,238,144,0) 100%
            );
            background-size: 200% 200%;
            animation: flashBorder 2s linear infinite;
            -webkit-mask: 
                linear-gradient(#fff 0 0) content-box, 
                linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
                    mask-composite: exclude;
            z-index: 2;
        }

        @keyframes flashBorder {
            0% { background-position: -100% 0; }
            100% { background-position: 100% 0; }
        }

        /* Keep content above border */
        .container > * {
            position: relative;
            z-index: 3;
        }

        h2 { margin-bottom: 20px; }

        input { 
            width:94%; 
            padding:10px; 
            margin:8px 0; 
            border-radius:8px; 
            border:1px solid #ccc; 
            background: #fff; /* white background */
            color: #333; 
            font-size:14px;
        }

        .btn { 
            width:100%; 
            padding:12px; 
            background:#28a745; 
            color:#fff; 
            border:none; 
            border-radius:8px; 
            cursor:pointer; 
            margin-top:10px; 
        }
        .btn:hover { background:#2ecc71; }

        .password-toggle { position:relative; }
        .password-toggle button { 
            position:absolute; 
            right:5px; 
            top:50%; 
            transform:translateY(-50%); 
            background:none; border:none; 
            cursor:pointer; font-size:18px; 
        }

        .logo { 
            width:120px;height:120px;
            border-radius:50%;
            object-fit:cover;
            border:3px solid #fff; 
            box-shadow:0 4px 6px rgba(0,0,0,0.3); 
            margin-bottom:15px; 
        }

        p a { color:#90ee90; text-decoration:none; }
    </style>
    <script>
        function togglePassword(id, btn) {
            const field = document.getElementById(id);
            if (field.type === "password") {
                field.type = "text";
                btn.textContent = "🙈";
            } else {
                field.type = "password";
                btn.textContent = "👁";
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <img src="system/kaongkodlogo.jpg" alt="Barangay Logo" class="logo">
        <h2 style="color:white;">Create Account</h2>
        <form method="POST" action="">
            <input type="text" name="name" placeholder="👤Full Name" required value="<?= htmlspecialchars($name) ?>">

            <div class="password-toggle">
                <input type="password" name="password" id="password" placeholder="🔑Password" required>
                <button type="button" onclick="togglePassword('password', this)">👁</button>
            </div>

            <div class="password-toggle" style="margin-top:8px;">
                <input type="password" name="confirm_password" id="confirm_password" placeholder="🔑Confirm Password" required>
                <button type="button" onclick="togglePassword('confirm_password', this)">👁</button>
            </div>

            <button type="submit" class="btn">Sign Up</button>
        </form>

        <p style="margin-top:12px; color:white;">Already have an account? <a href="Userlogin.php">Log In</a></p>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const errorMessage = <?= json_encode($errorMessage) ?>;
            const successMessage = <?= json_encode($successMessage) ?>;

            if (errorMessage) {
                Swal.fire({
                    icon: "error",
                    title: "Sign Up Failed",
                    text: errorMessage,
                    confirmButtonColor: "#d33"
                });
            }

            if (successMessage) {
                Swal.fire({
                    icon: "success",
                    title: "Account Created",
                    text: successMessage,
                    confirmButtonColor: "#28a745"
                }).then(() => {
                    window.location.href = "User.php";
                });
            }
        });
    </script>
</body>
</html>
