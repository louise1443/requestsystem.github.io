<?php
// businesspermit.php
session_start();

// --- DATABASE CONFIG ---
$servername = "localhost";
$username   = "root";
$password   = "";
$database   = "system";

$connection = new mysqli($servername, $username, $password, $database);
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

// ✅ Make sure user is logged in
if (!isset($_SESSION["user_id"])) {
    die("Access denied. Please log in first.");
}

$userId = $_SESSION["user_id"];
$admin_id = $_SESSION["admin_id"] ?? 1;
$userFullname = "User";

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

// ✅ User profile setup
$firstName   = trim(explode(" ", $userFullname)[0]);
$userInitial = strtoupper(substr($firstName, 0, 1));
$colors = ["#3498db", "#e67e22", "#2ecc71", "#9b59b6", "#f39c12", "#1abc9c", "#e74c3c", "#34495e"];
$bgColor = $colors[$userId % count($colors)];

$today = date("Y-m-d");
$nextYear = date("Y-m-d", strtotime("+1 year"));

$business_name = $owner_name = $business_type = $business_location = $address =$civil_status = $contact = "";
$capital_investment = $employees = "";
$permit_start = $today;
$permit_end   = $nextYear;
$errorMessage = "";
$successMessage = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Collect form data
    $business_name      = trim($_POST['business_name'] ?? '');
    $owner_name         = trim($_POST['owner_name'] ?? '');
    $business_type      = trim($_POST['business_type'] ?? '');
    $business_location  = trim($_POST['business_location'] ?? '');
    $address            = trim($_POST['address'] ?? '');
    $civil_status           = trim($_POST['civil_status'] ?? '');
    $contact            = trim($_POST['contact'] ?? '');
    $capital_investment = trim($_POST['capital_investment'] ?? '0');
    $employees          = trim($_POST['employees'] ?? '0');
    $permit_start       = $today;
    $permit_end         = $nextYear;

    // ✅ Optional: admin ID (if you have admin login session)
    $admin_id = $_SESSION["admin_id"] ?? 1; // default 1 if not set

    // Validation
    $errors = [];
    if ($business_name === '') $errors[] = "Business name is required.";
    if ($owner_name === '') $errors[] = "Owner name is required.";
    if ($business_type === '') $errors[] = "Business type is required.";
    if ($business_location === '') $errors[] = "Business location is required.";
    if ($address === '') $errors[] = "Business address is required.";
    if ($civil_status === '') $errors[] = "Civil Status is required.";

    if ($contact === '') {
        $errors[] = "Contact number is required.";
    } elseif (!preg_match('/^\d{11}$/', $contact)) {
        $errors[] = "Contact must be exactly 11 digits.";
    } elseif (substr($contact, 0, 2) !== '09') {
        $errors[] = "Contact must start with '09'.";
    }

    if ($capital_investment === '') $capital_investment = 0;
    if (!is_numeric($capital_investment)) $errors[] = "Capital investment must be a number.";
    if ($employees === '') $employees = 0;
    if (!ctype_digit(strval($employees))) $errors[] = "Number of employees must be an integer.";

    if (count($errors) > 0) {
        $errorMessage = implode(" ", $errors);
    } else {
        //✅ Insert including user_id and admin_id
        $sql = "INSERT INTO business_permits
                (user_id, admin_id, business_name, owner_name, business_type, business_location ,address, civil_status, contact, capital_investment, employees, permit_start, permit_end)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt = $connection->prepare($sql);

        if (!$stmt) {
            $errorMessage = "Prepare failed: " . $connection->error;
        } else {
            // ensure proper PHP types
            $cap = (float) $capital_investment;
            $emp = (int) $employees;
            // Correct types string — must match the number of variables (12)
            $types = "iisssssssdiss";

            $stmt->bind_param(
                $types,
                $userId,
                $admin_id,
                $business_name,
                $owner_name,
                $business_type,
                $business_location,
                $address,
                $civil_status,
                $contact,
                $cap,
                $emp,
                $permit_start,
                $permit_end
            );

            if ($stmt->execute()) {
                $successMessage = "Business permit submitted successfully.
                Always check your notification bell for new update!";
                // clear form vars...
                $business_name = $owner_name = $business_type = $business_location = $address = $civil_status = $contact  = "";
                $capital_investment = $employees = "";
                $permit_start = $today;
                $permit_end   = $nextYear;
            } else {
                $errorMessage = "Database error: " . $stmt->error;
            }

            $stmt->close();
        }
    }
}
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Barangay Kaongkod Services Request System</title>
    <link rel="icon" type="image/png" href="system/kaongkodlogo.jpg">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body { background: linear-gradient(135deg, #4facfe, #00f2fe); color:#0f172a; }
        .card { max-width:900px; margin:auto; }
        .required { color: #d6336c; }
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
        nav a:hover { color: #f1c40f; }
    </style>
</head>
<body>
    <!-- ✅ Header with user profile -->
    <header style="background:#2c3e50; color:white; padding:15px 25px; display:flex; justify-content:space-between; align-items:center; flex-wrap:wrap;">
        <div style="display:flex; align-items:center; gap:12px;">
            <img src="system/kaongkodlogo.jpg" width="55" height="55" 
                style="border-radius:50%; object-fit:cover; border:2px solid #fff; box-shadow:0 2px 6px rgba(0,0,0,0.3);">
            <h1 style="font-size:20px; font-weight:700; margin:0; line-height:1.2;">
                Barangay Kaongkod Service Request System
            </h1>
        </div>

        <nav style="display:flex; align-items:center; gap:20px; flex-wrap:wrap;">
            <a href="webpage.php" style="color:white; text-decoration:none; font-weight:bold;">🏠 Home</a>
            <a href="#services" style="color:white; text-decoration:none; font-weight:bold;">📝 Services</a>
            <a href="#" onclick="logoutWithSwal(event)" 
            style="color:white; text-decoration:none; font-weight:bold;">🚪 Logout</a>

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
            </div>
        </nav>
    </header>


    <div class="container py-5">
        <div class="card shadow p-4">
            <h3>Barangay Business Permit Request</h3>

            <?php if ($errorMessage): ?>
                <div class="alert alert-danger"><?= htmlspecialchars($errorMessage) ?></div>
            <?php endif; ?>
            <?php if ($successMessage): ?>
                <div class="alert alert-success"><?= htmlspecialchars($successMessage) ?></div>
            <?php endif; ?>

            <form method="post" id="permitForm">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Business Name *</label>
                        <input name="business_name" placeholder="Enter Business Name" class="form-control" required value="<?= htmlspecialchars($business_name) ?>">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Owner Name *</label>
                        <input name="owner_name" class="form-control" placeholder="Enter Full Name" required value="<?= htmlspecialchars($owner_name) ?>">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Business Type *</label>
                        <select name="business_type" class="form-select" required>
                            <option value="">Select type</option>
                            <option <?= ($business_type=='Sole Proprietorship')?'selected':'' ?>>Sole Proprietorship</option>
                            <option <?= ($business_type=='Partnership')?'selected':'' ?>>Partnership</option>
                            <option <?= ($business_type=='Corporation')?'selected':'' ?>>Corporation</option>
                            <option <?= ($business_type=='Cooperative')?'selected':'' ?>>Cooperative</option>
                            <option <?= ($business_type=='Others')?'selected':'' ?>>Others</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Business Location</label>
                        <input name="business_location" placeholder="Enter Completed Location" class="form-control" required value="<?= htmlspecialchars($business_location) ?>">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label"> Owner Address</label>
                        <input name="address" class="form-control" placeholder="Enter Completed Address" required value="<?= htmlspecialchars($address) ?>">
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Civil Status *</label>
                        <select name="civil_status" class="form-select" required>
                            <option value="">Select Status</option>
                            <option <?= ($civil_status=='Single')?'selected':'' ?>>Single</option>
                            <option <?= ($civil_status=='Married')?'selected':'' ?>>Married</option>
                            <option <?= ($civil_status=='Widowed')?'selected':'' ?>>Widowed</option>
                            <option <?= ($civil_status=='Divorced')?'selected':'' ?>>Divorced</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Contact *</label>
                        <input name="contact" placeholder="Enter Contact Number" maxlength="11" class="form-control" required value="<?= htmlspecialchars($contact) ?>">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Capital Investment (₱)</label>
                        <input name="capital_investment" placeholder="Enter Amount" class="form-control" value="<?= htmlspecialchars($capital_investment) ?>">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Number of Employees</label>
                        <input name="employees" placeholder="Enter Total of Employees" class="form-control" value="<?= htmlspecialchars($employees) ?>">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Permit Start</label>
                        <input name="permit_start" type="date" class="form-control" readonly value="<?= $permit_start ?>">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Permit End</label>
                        <input name="permit_end" type="date" class="form-control" readonly value="<?= $permit_end ?>">
                    </div>
                </div>
                <button class="btn btn-primary mt-4" type="submit">Submit Application</button>
            </form>
        </div>
    </div>

    <script>
    // SweetAlert notifications based on PHP messages (escaped safely)
    <?php if ($errorMessage): ?>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: <?= json_encode($errorMessage) ?>,
            confirmButtonText: 'OK'
        });
    <?php endif; ?>

    <?php if ($successMessage): ?>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: <?= json_encode($successMessage) ?>,
            confirmButtonText: 'OK'
        }).then(() => {
            // Redirect to same page (GET) to clear POST data and reset form
            window.location.href = '/system/requestbusinesspermit.php';
        });
    <?php endif; ?>

    // ✅ Notifications
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
