<?php
session_start();

// --- DEBUG MODE (set false in production) ---
$debug = false;

// ✅ Database connection
$connection = new mysqli("localhost", "root", "", "system");
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$errorMessage = "";
$successMessage = "";
$name = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $name = trim($_POST["name"] ?? "");
    $passwordInput = trim($_POST["password"] ?? "");

    if ($name === "" || $passwordInput === "") {
        $errorMessage = "Please enter both username and password!";
    } else {
        // ✅ Get ALL users with this name
        $stmt = $connection->prepare("SELECT user_id, name, password FROM users_account WHERE name = ?");
        if (!$stmt) {
            $errorMessage = "Database prepare error";
            if ($debug) $errorMessage .= ": " . $connection->error;
        } else {
            $stmt->bind_param("s", $name);
            if (!$stmt->execute()) {
                $errorMessage = "Database execute error";
                if ($debug) $errorMessage .= ": " . $stmt->error;
            } else {
                $result = $stmt->get_result();

                if ($result->num_rows > 0) {
                    $found = false;
                    while ($row = $result->fetch_assoc()) {
                        $storedPassword = $row["password"];

                        // ✅ Check hashed or plain text passwords
                        if (
                            (str_starts_with($storedPassword, '$2y$') || 
                             str_starts_with($storedPassword, '$2a$') || 
                             str_starts_with($storedPassword, '$argon2')) &&
                            password_verify($passwordInput, $storedPassword)
                        ) {
                            // Hashed password match ✅
                            $_SESSION["user_id"] = $row["user_id"];
                            $_SESSION["user_name"] = $row["name"];
                            $successMessage = "Welcome, " . htmlspecialchars($row["name"]) . "!";
                            $found = true;
                            break;
                        } elseif ($storedPassword === $passwordInput) {
                            // Plain text match ✅
                            $_SESSION["user_id"] = $row["user_id"];
                            $_SESSION["user_name"] = $row["name"];
                            $successMessage = "Welcome, " . htmlspecialchars($row["name"]) . "!";
                            $found = true;
                            break;
                        }
                    }

                    if (!$found) {
                        $errorMessage = "Incorrect password!";
                    }
                } else {
                    $errorMessage = "Username not found!";
                }
            }
            $stmt->close();
        }
    }
}

$connection->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Barangay Hilantagaan Service Request System</title>
    <link rel="icon" type="image/png" href="system/kaongkodlogo.jpg">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background: url('system/kaongkod.jpeg'); 
            background-size: cover;
            background-position: center;
            margin:0; padding:0; height:100vh;
            display:flex; justify-content:center; align-items:center;
        }

        /* Container with transparent green and animated border */
        .container {
            position: relative;
            background: rgba(0,255,0,0.1); /* invisible green */
            padding: 30px;
            border-radius: 12px;
            width: 350px;
            text-align: center;
            color: #333; /* darker text for readability */
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

        /* Input fields with white background */
        input {
            width:94%;
            padding:10px; 
            margin:8px 0; 
            border-radius:8px;
            border:1px solid #ccc; 
            background: #fff; /* white background */
            color: #333; /* dark text */
        }

        /* Button styling */
        .btn {
            width:100%; 
            padding:12px; 
            background:#28a745; 
            color:#fff; 
            border:0; 
            border-radius:8px;
            cursor:pointer;
        }
        .btn:hover { background:#2ecc71; }

        /* Password toggle button */
        .password-toggle { 
            position:relative; 
            width:100%; 
        }
        .password-toggle button { 
            position:absolute; 
            right:8px; 
            top:50%; 
            transform:translateY(-50%); 
            background:none; 
            border:none; 
            cursor:pointer; 
            font-size:18px; 
            color:#333;
        }

        /* Logo styling */
        .logo { 
            width:120px;
            height:120px;
            border-radius:50%;
            object-fit:cover;
            border:3px solid #fff; 
            box-shadow:0 4px 6px rgba(0,0,0,0.3); 
            margin-bottom:15px; 
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="system/kaongkodlogo.jpg" alt="Barangay Logo" class="logo">
        <h2 style="color:white;">Log In</h2>
        <form method="POST" action="">
            <input type="name" name="name" placeholder="👤User Name" required value="<?= htmlspecialchars($name) ?>">
            <div class="password-toggle">
                <input type="password" name="password" id="password" placeholder="🔑Password" required>
                <button type="button" onclick="togglePassword('password', this)">👁</button>
            </div>
            <button type="submit" class="btn">Log In</button>
        </form>
        <p style="margin-top:12px; color:white;">Don’t have an account? <a href="Usersignup.php" style="color:#90ee90;">Sign Up</a></p>
    </div>

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

        document.addEventListener("DOMContentLoaded", function () {
            const errorMessage = <?= json_encode($errorMessage) ?>;
            const successMessage = <?= json_encode($successMessage) ?>;

            if (errorMessage) {
                Swal.fire({
                    icon: "error",
                    title: "Login Failed",
                    text: errorMessage,
                    confirmButtonColor: "#d33"
                });
            }

            if (successMessage) {
                Swal.fire({
                    icon: "success",
                    title: "Login Successful",
                    text: successMessage,
                    confirmButtonColor: "#3085d6"
                }).then(() => {
                    window.location.href = "webpage.php";
                });
            }
        });
    </script>
</body>
</html>
