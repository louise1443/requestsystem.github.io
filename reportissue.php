<?php
// barangayindigency.php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$database = "system";

// ✅ Connect to DB
$connection = new mysqli($servername, $username, $password, $database);
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

// ✅ Get logged-in user info
if (!isset($_SESSION["user_id"])) {
    die("Access denied. Please log in first.");
}

$userId = $_SESSION["user_id"];
//$userFullname = "User"; // fallback
$admin_id = $_SESSION["admin_id"] ?? 1; // default admin id if not set

// ✅ Fetch user full name from users_account
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

// ✅ Initialize variables for form
$fullname = $userFullname;
$address = $gender = $contact = $issue_type = $location = $details = "";
$successMessage = $errorMessage = "";

// ✅ Form handling
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fullname = trim($_POST["fullname"]);
    $address  = trim($_POST["address"]);
    $gender  = trim($_POST["gender"]);
    $contact  = trim($_POST["contact"]);
    $issue_type  = trim($_POST["issue_type"]);
    $location      = trim($_POST["location"]);
    $details   = trim($_POST["details"]);

    // ✅ Validation
    if (empty($fullname) || empty($address) || empty($gender) || empty($contact) || empty($issue_type) || empty($location) || empty($details)) {
        $errorMessage = "⚠ All fields are required!";
    } elseif (!preg_match('/^09\d{9}$/', $contact)) {
        $errorMessage = "⚠ Contact must be 11 digits and start with '09'.";
    } else {
        // ✅ Insert record into barangay_indigency
        $stmt = $connection->prepare("INSERT INTO barangay_issues 
            (user_id, admin_id, fullname, address, gender, contact, issue_type, location, details, date_reported) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())");

        $stmt->bind_param("iisssssss", $userId, $admin_id, $fullname, $address, $gender, $contact, $issue_type, $location, $details);

        if ($stmt->execute()) {
            $successMessage = "✅ Barangay issue report submitted successfully.
                                Always check your notification bell for new update!";
            // ✅ Clear form after success
            $address = $contact = $details = "";
        } else {
            $errorMessage = "❌ Database Error: " . $stmt->error;
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
            transition: color 0.2s;
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
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
            color: #333;
        }
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background: #007bff;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background: #0069d9;
        }
    </style>
</head>
<body>
<header>   
    <h1><img src="system/kaongkodlogo.jpg" width="50" height="50" style="border-radius:50%; object-fit:cover; border:2px solid #fff; box-shadow:0 2px 6px rgba(0,0,0,0.3);">Barangay Kaongkod Services Request System</h1>
    <nav style="display:flex;align-items:center;gap:20px;">
        <a href="webpage.php">🏠 Home</a>
        <a href="#services">📝 Services</a>
        <a href="#" onclick="logoutWithSwal(event)" class="dropdown-item" 
            style="display: block; padding: 8px; text-decoration: none; color: white; font-weight: bold;">🚪 Logout</a>
        <div class="notif-user" style="display:flex;align-items:center;gap:12px;">
            <button class="notif-btn" id="notifBtn" style="background:none;border:none;cursor:pointer;font-size:18px;color:white;">🔔
                <span class="badge" id="notifBadge" style="display:none;background:red;color:white;border-radius:50%;padding:2px 6px;font-size:12px;vertical-align:top;">0</span>
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
        <h2>Barangay Issue Report</h2>
        <form method="POST" action="">
            <label>Full Name</label>
            <input type="text" name="fullname" placeholder="Enter Full Name"value="" required>

            <label>Address</label>
            <input type="text" name="address" placeholder="Enter Completed Address" value="<?= htmlspecialchars($address); ?>" required>

            <label class="form-label">Gender</label>
            <div style="display: flex; align-items: center; gap: 25px; margin-bottom: 12px;">
                <label style="display: flex; align-items: center; gap: 6px;">
                    <input type="radio" name="gender" value="M" <?= $gender == 'M' ? 'checked' : '' ?> required>
                    <span>Male</span>
                </label>
                <label style="display: flex; align-items: center; gap: 6px;">
                    <input type="radio" name="gender" value="F" <?= $gender == 'F' ? 'checked' : '' ?> required>
                    <span>Female</span>
                </label>
            </div>

            <label>Contact Number</label>
            <input type="text" name="contact" maxlength="11" value="<?= htmlspecialchars($contact); ?>" required>

            <label>Issue Type</label>
            <input type="text" name="issue_type" placeholder="Enter Type of Issue" value="<?= htmlspecialchars($issue_type); ?>" required>

             <label>Location</label>
            <input type="text" name="location" placeholder="Enter Completed Location" value="<?= htmlspecialchars($location); ?>" required>

            <label>Details for Report</label>
            <textarea name="details" rows="3" required><?= htmlspecialchars($details); ?></textarea>

            <button type="submit" class="btn">Submit Application</button>
        </form>
    </div>
</div>

<script>
<?php if (!empty($errorMessage)): ?>
Swal.fire({
    icon: 'error',
    title: 'Error',
    text: <?= json_encode($errorMessage) ?>
});
<?php endif; ?>

<?php if (!empty($successMessage)): ?>
Swal.fire({
    icon: 'success',
    title: 'Success',
    text: <?= json_encode($successMessage) ?>
}).then(() => {
    window.location.href = "/system/requestindigency.php";
});
<?php endif; ?>

// ✅ Notification Fetch + Display
let notifications = [];
let unreadCount = 0;

function loadNotifications() {
    $.get("fetch_notifications.php", function(data) {
        notifications = data;
        unreadCount = data.length;
        if (unreadCount > 0) {
            $("#notifBadge").text(unreadCount).show();
        } else {
            $("#notifBadge").hide();
        }
    });
}
loadNotifications();

$("#notifBtn").on("click", function() {
    if (notifications.length > 0) {
        let html = "<ul style='text-align:left;'>";
        notifications.forEach(n => {
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
                notifications = [];
                unreadCount = 0;
            });
        });
    } else {
        Swal.fire("📢 Notifications", "No new notifications.", "info");
    }
});

//log out sweet alert
            function logoutWithSwal(event) {
                event.preventDefault(); // Prevent default link action

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
