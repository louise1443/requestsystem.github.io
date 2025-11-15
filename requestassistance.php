<?php 
session_start(); // ✅ Start session to get user info

$servername = "localhost";
$db_username = "root";
$db_password = "";
$database   = "system";

// ✅ Connect to DB
$connection = new mysqli($servername, $db_username, $db_password, $database);
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

// ✅ Make sure user is logged in
if (!isset($_SESSION["user_id"])) {
    die("Access denied. Please log in first.");
}

$userId = $_SESSION["user_id"];
$userFullname = "User"; // fallback

// ✅ Fetch user full name
$sql = "SELECT name FROM users_account WHERE user_id = ?";
$stmt = $connection->prepare($sql);
$stmt->bind_param("i", $userId);
$stmt->execute();
$stmt->bind_result($dbName);
if ($stmt->fetch()) {
    $userFullname = $dbName;
}
$stmt->close();

// ✅ User profile setup (initial with color)
$firstName   = trim(explode(" ", $userFullname)[0]);
$userInitial = strtoupper(substr($firstName, 0, 1));
$colors = ["#3498db", "#e67e22", "#2ecc71", "#9b59b6", "#f39c12", "#1abc9c", "#e74c3c", "#34495e"];
$bgColor = $colors[$userId % count($colors)];

// ✅ Default admin_id
$admin_id = $_SESSION["admin_id"] ?? 1; 

$successMessage = $errorMessage = "";

// ✅ Define variables to keep form data
$fullname = $userFullname;
$address = $contact = $assistance = $reason = "";

// ✅ Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fullname   = trim($_POST["fullname"]);
    $address    = trim($_POST["address"]);
    $contact    = trim($_POST["contact"]);
    $assistance = trim($_POST["assistance"]);
    $reason     = trim($_POST["reason"]);

    if (empty($fullname) || empty($address) || empty($contact) || empty($assistance) || empty($reason)) {
        $errorMessage = "⚠ All fields are required!";
    } elseif (!preg_match('/^09\d{9}$/', $contact)) {
        $errorMessage = "⚠ Contact number must be 11 digits and start with '09'.";
    } else {
        // ✅ Correct INSERT for your table
        $stmt = $connection->prepare("
            INSERT INTO barangay_assistance 
            (user_id, admin_id, fullname, address, contact, assistance, reason, date_requested, archive_id) 
            VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NULL)
        ");
        $stmt->bind_param("iisssss", $userId, $admin_id, $fullname, $address, $contact, $assistance, $reason);

        if ($stmt->execute()) {
            $successMessage = "✅ Assistance request submitted successfully. Always check your notification bell for new updates!";
            $address = $contact = $assistance = $reason = "";
        } else {
            $errorMessage = "❌ Error: " . $stmt->error;
        }
        $stmt->close();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Barangay Kaongkod Services Request System</title>
    <link rel="icon" type="image/png" href="system/kaongkodlogo.jpg">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            margin: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        header {
            background: #2c3e50;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            font-size: 22px;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-size: 15px;
            font-weight: bold;
        }
        nav a:hover {
            color: #f1c40f;
        }
        .main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .container {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            width: 420px;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }
        input, textarea, select {
            width: 100%; padding: 10px; margin-bottom: 12px;
            border: 1px solid #ccc; border-radius: 6px;
        }
        .btn {
            width: 100%; padding: 12px;
            background: #007bff; border: none; border-radius: 6px;
            color: white; font-size: 16px; cursor: pointer;
        }
        .btn:hover { background: #0069d9; }
        .notif-btn {
            position: relative;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 20px;
            color: white;
        }
        .notif-btn .badge {
            position: absolute;
            top: -8px;
            right: -8px;
            background: red;
            color: white;
            border-radius: 50%;
            font-size: 12px;
            padding: 2px 6px;
        }
    </style>
</head>
<body>
<header>   
    <h1>
        <img src="system/kaongkodlogo.jpg" width="50" height="50" 
        style="border-radius:50%; object-fit:cover; border:2px solid #fff;">
        Barangay Kaongkod Services Request System
    </h1>
    <nav style="display:flex;align-items:center;gap:20px;">
        <a href="webpage.php">🏠 Home</a>
        <a href="#services">📝 Services</a>
        <a href="#" onclick="logoutWithSwal(event)">🚪 Logout</a>
        <div style="display:flex;align-items:center;gap:12px;">
            <button class="notif-btn" id="notifBtn">🔔
                <span class="badge" id="notifBadge" style="display:none;">0</span>
            </button>
            <div style="display:flex;flex-direction:column;align-items:center;">
                <div style="width:32px;height:32px;border-radius:50%;background:<?= $bgColor ?>;color:white;display:flex;align-items:center;justify-content:center;font-weight:bold;">
                    <?= htmlspecialchars($userInitial) ?>
                </div>
                <span><?= htmlspecialchars($userFullname) ?></span>
            </div>
        </div>
    </nav>
</header>

<div class="main">
    <div class="container">
        <h2>Barangay Assistance Request</h2>
        <form method="POST" action="">
            <label>Full Name</label>
            <input type="text" name="fullname" placeholder="Enter Full name" value="" required>

            <label>Address</label>
            <select name="address" required>
                <option value="">Select Address</option>
                <?php
                $addresses = [
                    'Purok Bugsayan 1', 'Purok Bugsayan 2', 'Purok Ipil Ipil', 'Purok Kalubihan',
                    'Purok Kamanggahan', 'Purok Kasagingan', 'Purok Maisan 1', 'Purok Maisan 2',
                    'Purok Maisan 3', 'Purok Pukoton 1', 'Purok Pukoton 2'
                ];
                foreach ($addresses as $addr) {
                    $sel = ($address == $addr) ? "selected" : "";
                    echo "<option value='$addr' $sel>$addr</option>";
                }
                ?>
            </select>

            <label>Contact Number</label>
            <input type="text" placeholder="Enter Contact Number" name="contact" maxlength="11" value="<?= htmlspecialchars($contact) ?>" required>

            <label>Type of Assistance</label>
            <select name="assistance" required>
                <option value="">-- Select Assistance --</option>
                <?php
                $options = ["Medical", "Financial", "Burial", "Calamity", "Education", "Others"];
                foreach ($options as $opt) {
                    $sel = ($assistance == $opt) ? "selected" : "";
                    echo "<option value='$opt' $sel>$opt</option>";
                }
                ?>
            </select>

            <label>Reason for Request</label>
            <textarea name="reason" rows="3" required><?= htmlspecialchars($reason) ?></textarea>

            <button type="submit" class="btn">Submit Request</button>
        </form>
    </div>
</div>

<script>
<?php if (!empty($errorMessage)): ?>
Swal.fire({
    icon: 'error',
    title: 'Error',
    text: <?= json_encode($errorMessage) ?>,
});
<?php endif; ?>

<?php if (!empty($successMessage)): ?>
Swal.fire({
    icon: 'success',
    title: 'Success',
    text: <?= json_encode($successMessage) ?>,
}).then(() => {
    window.location.href = "requestassistance.php";
});
<?php endif; ?>

// ✅ Notifications fetch
function loadNotifications() {
    $.get("fetch_notifications.php", function(data) {
        if (Array.isArray(data) && data.length > 0) {
            $("#notifBadge").text(data.length).show();
        } else {
            $("#notifBadge").hide();
        }
    }, "json");
}
loadNotifications();

$("#notifBtn").on("click", function() {
    $.get("fetch_notifications.php", function(data) {
        if (Array.isArray(data) && data.length > 0) {
            let html = "<ul style='text-align:left;'>";
            data.forEach(n => {
                html += `<li><strong>${n.title}</strong><br>${n.message}<br><small>${n.created_at}</small></li><hr>`;
            });
            html += "</ul>";
            Swal.fire({
                title: "📢 Notifications",
                html: html,
                width: 500,
                confirmButtonText: "Close"
            }).then(() => {
                $.post("mark_notifications_read.php", function() {
                    $("#notifBadge").hide();
                });
            });
        } else {
            Swal.fire("📢 Notifications", "No new notifications.", "info");
        }
    }, "json");
});

// ✅ Logout confirmation
function logoutWithSwal(event) {
    event.preventDefault();
    Swal.fire({
        title: 'Are you sure?',
        text: "You will be logged out of the system.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#43a047',
        cancelButtonColor: '#e53935',
        confirmButtonText: 'Yes, log out',
        cancelButtonText: 'Cancel'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire({
                title: 'Logging out...',
                text: 'Please wait while we log you out.',
                icon: 'info',
                showConfirmButton: false,
                timer: 1200,
                timerProgressBar: true
            });
            setTimeout(() => {
                window.location.href = 'Userlogout.php';
            }, 1200);
        }
    });
}
</script>
</body>
</html>
