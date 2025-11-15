<?php 
// blotter_request.php
session_start();

$servername = "localhost";
$username   = "root";
$password   = "";
$database   = "system";

// ✅ Connect to DB
$connection = new mysqli($servername, $username, $password, $database);
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

// ✅ Make sure user is logged in
if (!isset($_SESSION["user_id"])) {
    die("Access denied. Please log in first.");
}

$userId = $_SESSION["user_id"];
$userFullname = "User";

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

// ✅ Avatar setup
$firstName   = trim(explode(" ", $userFullname)[0]);
$userInitial = strtoupper(substr($firstName, 0, 1));
$colors = ["#3498db", "#e67e22", "#2ecc71", "#9b59b6", "#f39c12", "#1abc9c", "#e74c3c", "#34495e"];
$bgColor = $colors[$userId % count($colors)];

$admin_id = $_SESSION["admin_id"] ?? 1; // fallback
$successMessage = $errorMessage = "";

// ✅ Initialize inputs
$address = $contact = $respondent = $incident_date = $incident_place = $details = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $address        = trim($_POST["address"]);
    $contact        = trim($_POST["contact"]);
    $respondent     = trim($_POST["respondent"]);
    $incident_date  = trim($_POST["incident_date"]);
    $incident_place = trim($_POST["incident_place"]);
    $details        = trim($_POST["details"]);
    $complainant    = $userFullname;

    // ✅ Validation
    if (empty($address) || empty($contact) || empty($respondent) || empty($incident_date) || empty($incident_place) || empty($details)) {
        $errorMessage = "⚠ All fields are required!";
    } elseif (!preg_match('/^09\d{9}$/', $contact)) {
        $errorMessage = "⚠ Contact number must be 11 digits and start with '09'.";
    } else {
        // ✅ Insert into DB
        $stmt = $connection->prepare("INSERT INTO barangay_blotter (user_id, admin_id, complainant, address, contact, respondent, incident_date, incident_place, details, date_filed) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())");
        $stmt->bind_param("iisssssss", $userId, $admin_id, $complainant, $address, $contact, $respondent, $incident_date, $incident_place, $details);

        if ($stmt->execute()) {
            $successMessage = "✅ Blotter request filed successfully.
                                Always check your notification bell for new update!";
            // Reset inputs only after success
            $address = $contact = $respondent = $incident_date = $incident_place = $details = "";
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
        margin: 0; min-height: 100vh;
        display: flex; flex-direction: column;
    }
    header {
        background: #2c3e50; color: white;
        padding: 15px 20px; display: flex;
        justify-content: space-between; align-items: center;
    }
    header h1 { font-size: 22px; margin: 0; display: flex; align-items: center; gap: 10px; }
    header img { border-radius: 50%; object-fit: cover; border: 2px solid #fff; box-shadow: 0 2px 6px rgba(0,0,0,0.3); }
    nav a { color: white; text-decoration: none; margin-left: 20px; font-size: 15px; font-weight: bold; transition: color 0.2s; }
    nav a:hover { color: #f1c40f; }
    .main { flex: 1; display: flex; justify-content: center; align-items: center; padding: 20px; }
    .container { background: #fff; padding: 25px; border-radius: 12px; box-shadow: 0 6px 15px rgba(0,0,0,0.2); width: 420px; }
    h2 { text-align: center; color: #333; margin-bottom: 20px; }
    label { font-weight: bold; display: block; margin: 10px 0 5px; color: #333; }
    input, textarea, select {
        width: 100%; padding: 10px; margin-bottom: 12px;
        border: 1px solid #ccc; border-radius: 6px; font-size: 14px;
    }
    .btn {
        width: 100%; padding: 12px;
        background: #007bff; border: none;
        border-radius: 6px; color: white;
        font-size: 16px; cursor: pointer;
    }
    .btn:hover { background: #0069d9; }
</style>
</head>
<body>
<header>   
    <h1><img src="system/kaongkodlogo.jpg" width="50" height="50">Barangay Kaongkod Services Request System</h1>
    <nav style="display:flex;align-items:center;gap:20px;">
        <a href="webpage.php">🏠 Home</a>
        <a href="#services">📝 Services</a>
        <a href="#" onclick="logoutWithSwal(event)" class="dropdown-item" 
            style="display: block; padding: 8px; text-decoration: none; color: white; font-weight: bold;">🚪 Logout</a>
        <div class="notif-user" style="display:flex;align-items:center;gap:12px;">
            <button class="notif-btn" id="notifBtn" style="background:none;border:none;cursor:pointer;font-size:18px;color:white;">
                🔔
                <span class="badge" id="notifBadge" style="display:none;background:red;color:white;border-radius:50%;padding:2px 6px;font-size:12px;vertical-align:top;">0</span>
            </button>
            <!-- ✅ User Initial above Name -->
            <div style="display:flex;flex-direction:column;align-items:center;gap:4px;">
                <div style="width:36px;height:36px;border-radius:50%;background:<?= $bgColor ?>;
                            color:white;display:flex;align-items:center;justify-content:center;
                            font-weight:bold;font-size:16px;">
                    <?= htmlspecialchars($userInitial) ?>
                </div>
                <span style="color:white;font-weight:500;"><?= htmlspecialchars($userFullname) ?></span>
            </div>
        </div>
    </nav>
</header>

<div class="main">
    <div class="container">
        <h2>Barangay Blotter Request</h2>
        <form method="POST">
           <label>Complainant’s Full Name</label>
            <input type="text" placeholder="Enter Complainant Name" name="complainant"
                value="<?= htmlspecialchars($complainant ?? '') ?>" required>

            <label>Complainant’s Address</label>
            <select name="address" required>
                <option value="">Select Address</option>
                <option <?= ($address=='Purok Bugsayan 1')?'selected':'' ?>>Purok Bugsayan 1</option>
                <option <?= ($address=='Purok Bugsayan 2')?'selected':'' ?>>Purok Bugsayan 2</option>
                <option <?= ($address=='Purok Ipil Ipil')?'selected':'' ?>>Purok Ipil Ipil</option>
                <option <?= ($address=='Purok Kalubihan')?'selected':'' ?>>Purok Kalubin</option>
                <option <?= ($address=='Purok Kamanggahan')?'selected':'' ?>>Purok Kamanggahan</option>
                <option <?= ($address=='Purok Kasagingan')?'selected':'' ?>>Purok Kasagingan</option>
                <option <?= ($address=='Purok Maisan 1')?'selected':'' ?>>Purok Maisan 1</option>
                <option <?= ($address=='Purok Maisan 2')?'selected':'' ?>>Purok Maisan 2</option>
                <option <?= ($address=='Purok Maisan 3')?'selected':'' ?>>Purok Maisan 3</option>
                <option <?= ($address=='Purok Pukoton 1')?'selected':'' ?>>Purok Pukoton 1</option>
                <option <?= ($address=='Purok Pukoton 2')?'selected':'' ?>>Purok Pukoton 2</option>
            </select>

            <label>Complainant’s Contact Number</label>
            <input type="text" placeholder="Enter Contact Number" name="contact" maxlength="11" value="<?= htmlspecialchars($contact); ?>" required>

            <label>Respondent’s Full Name</label>
            <input type="text" placeholder="Enter Respondents Name" name="respondent" value="<?= htmlspecialchars($respondent); ?>" required>

            <label>Date of Incident</label>
            <input type="date" name="incident_date" value="<?= htmlspecialchars($incident_date); ?>" required>

            <label>Place of Incident</label>
            <input type="text" placeholder="Enter Place of Incident" name="incident_place" value="<?= htmlspecialchars($incident_place); ?>" required>

            <label>Incident Details</label>
            <textarea name="details" rows="3" required><?= htmlspecialchars($details); ?></textarea>

            <button type="submit" class="btn">Submit Blotter</button>
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
    window.location.href = "requestblotter.php";
});
<?php endif; ?>

// ✅ Notification system
function loadNotifications() {
    $.getJSON("fetch_notifications.php", function(data) {
        if (data.length > 0) {
            $("#notifBadge").text(data.length).show();
        } else {
            $("#notifBadge").hide();
        }

        $("#notifBtn").off("click").on("click", function() {
            if (data.length > 0) {
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
                    $.post("mark_notifications_read.php");
                    $("#notifBadge").hide();
                });
            } else {
                Swal.fire("📢 Notifications", "No new notifications.", "info");
            }
        });
    });
}
loadNotifications();

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
