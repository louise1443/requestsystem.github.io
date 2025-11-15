<?php
session_start();

// ✅ Database connection
$servername = "localhost";
$db_username   = "root";  // renamed to avoid conflict with user's name
$db_password   = "";
$database   = "system";

$connection = new mysqli($servername, $db_username, $db_password, $database);
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

// ✅ Get logged in user ID from session 
$userId = $_SESSION["user_id"] ?? 0;
$userFullname = "User"; // default fallback

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
                background: linear-gradient(135deg, #2980b9, #6dd5fa, #ffffff);
                margin: 0;
                padding: 0;
            }
            header {
                background: #2c3e50;
                color: white;
                padding: 15px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .logo-title {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .logo-title img {
                border-radius: 50%;
                object-fit: cover;
                border: 2px solid #fff;
                box-shadow: 0 2px 6px rgba(0,0,0,0.3);
            }
            .logo-title span {
                font-size: 22px;
                font-weight: bold;
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
            /* 🔔 Notification Button */
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

            .container {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 20px;
                padding: 30px;
            }
            .card {
                border-radius: 14px;
                padding: 20px;
                color: white;
                text-align: center;
                transition: transform 0.2s ease, box-shadow 0.2s ease, filter 0.2s ease;
            }
            .card:hover {
                transform: scale(1.05);
                box-shadow: 0 10px 25px rgba(0,0,0,0.3);
                filter: brightness(1.1);
            }
            .card h3 { 
                margin-bottom: 15px; 
            }
            .card p { 
                font-size: 14px; margin-bottom: 20px; 
            }
            .last-row {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 40px 0;
}

.last-row .card {
    max-width: 380px;
    width: 100%;
    border-radius: 14px;
    padding: 25px;
    text-align: center;
    color: white;
    background: linear-gradient(135deg, #d35400, #e67e22);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.25);
    transition: transform 0.25s ease, box-shadow 0.25s ease, filter 0.25s ease;
}

.last-row .card:hover {
    transform: scale(1.05);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
    filter: brightness(1.1);
}

.last-row .card h3 {
    margin-bottom: 15px;
    font-size: 18px;
}

.last-row .card p {
    font-size: 14px;
    margin-bottom: 18px;
}

.last-row .btn {
    display: inline-block;
    background: rgba(0,0,0,0.25);
    color: white;
    text-decoration: none;
    padding: 10px 18px;
    border-radius: 6px;
    font-weight: bold;
    transition: background 0.2s;
}

.last-row .btn:hover {
    background: rgba(0,0,0,0.4); 
}
            /* 🎨 Unique card backgrounds */
            .card:nth-child(1) {background: linear-gradient(135deg, #ff6a00, #ee0979); }
            .card:nth-child(2) {background: linear-gradient(135deg, #27ae60, #2ecc71); }
            .card:nth-child(3) {background: linear-gradient(135deg, #8e44ad, #9b59b6); }

            .second-row .card:nth-child(1) { background: linear-gradient(135deg, #16a085, #1abc9c); }
            .second-row .card:nth-child(2) { background: linear-gradient(135deg, #2980b9, #3498db); }
            .second-row .card:nth-child(3) { background: linear-gradient(135deg, #c0392b, #e74c3c); }
            
            .third-row .card:nth-child(1) { background: linear-gradient(135deg, #d35400, #e67e22); }
            .third-row .card:nth-child(2) { background: linear-gradient(135deg, #9b59b6, #8e44ad); }
            .third-row .card:nth-child(3) { background: linear-gradient(135deg, #f39c12, #e67e22); }

            .fourth-row .card:nth-child(1) {background: linear-gradient(135deg, #e67e22, #f39c12); }
            .fourth-row .card:nth-child(2) {background: linear-gradient(135deg, #c0392b, #e74c3c); }
            .fourth-row .card:nth-child(3) {background: linear-gradient(135deg, #16a085, #1abc9c); }

            .last-row .card:nth-child(1) { background: linear-gradient(135deg, #2980b9, #3498db); }
            .last-row .card:nth-child(2) { background: linear-gradient(135deg, #9b59b6, #8e44ad); }
            .btn {
                display: inline-block;
                background: rgba(0,0,0,0.25);
                color: white;
                text-decoration: none;
                padding: 10px 18px;
                border-radius: 6px;
                font-size: 14px;
                transition: background 0.2s;
            }
            .btn:hover { background: rgba(0,0,0,0.4); }
        </style>
    </head>
    <body>
        <header>
            <div class="logo-title">
                <img src="system/kaongkodlogo.jpg" width="50" height="50" alt="Barangay Logo">
                <span>Barangay Kaongkod Services Request System</span>
            </div>
            <nav style="display:flex;align-items:center;gap:20px;">
                <a href="webpage.php">🏠 Home</a>
                <a href="services.php">📝 Services</a>
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
                </div>
            </nav>
        </header>
        <!-- ✅ Services Section -->
        <div class="container" id="services">
            <div class="card">
                <h3>Business Permit</h3>
                <p>Apply for or renew your business permit in the barangay.</p>
                <a href="requestbusinesspermit.php" class="btn">Apply</a>
            </div>

            <div class="card">
                <h3>Barangay Clearance</h3>
                <p>Request a barangay clearance for personal or legal purposes.</p>
                <a href="requestclearance.php" class="btn">Request</a>
            </div>

            <div class="card">
                <h3>Barangay Indigency</h3>
                <p>Apply for indigency certification for assistance purposes.</p>
                <a href="requestindigency.php" class="btn">Apply</a>
            </div>
        </div>

        <div class="container second-row">
            <div class="card">
                <h3>Certificate of Ownership</h3>
                <p>Request certification for ownership of fishing boats or property.</p>
                <a href="requestcertofownership.php" class="btn">Request</a>
            </div>

            <div class="card">
                <h3>Fencing Permit</h3>
                <p>Apply for a fencing permit before building or renovating fences.</p>
                <a href="requestfencingpermit.php" class="btn">Apply</a>
            </div>

            <div class="card">
                <h3>Business Closure Certification</h3>
                <p>Request certification for formal closure of your business.</p>
                <a href="requestcertforbusinessclosure.php" class="btn">Request</a>
            </div>
        </div>

        <div class="container third-row">
            <div class="card">
                <h3>Barangay Permit (Street Dancing)</h3>
                <p>Secure a permit for organizing a street dancing event.</p>
                <a href="requestbarangaypermit(streetdancing).php" class="btn">Apply</a>
            </div>

            <div class="card">
                <h3>Barangay Permit (2-Day Benefit Dancing)</h3>
                <p>Apply for a special permit for a 2-day benefit dance event.</p>
                <a href="requestbarangaypermit(2daysbenefitdance).php" class="btn">Apply</a>
            </div>

            <div class="card">
                <h3>Solid Waste Management Certification</h3>
                <p>Obtain a certification for compliance with solid waste management.</p>
                <a href="requestcertforsolidwastemanagement.php" class="btn">Request</a>
            </div>
        </div>

        <div class="container fourth-row">
            <div class="card">
                <h3>Assistance Request</h3>
                <p>Submit a request for financial or medical assistance.</p>
                <a href="requestassistance.php" class="btn">Request</a>
            </div>
            <div class="card">  
                <h3>Barangay Certificate</h3>
                <p>Request a certification verifying your residency or good standing within the barangay.</p>
                <a href="requestbarangaycertificate.php" class="btn">Report</a>
            </div>
            <div class="card">
                <h3>Barangay Blotter</h3>
                <p>File a complaint or record an incident involving community disputes.</p>
                <a href="requestblotter.php" class="btn">File</a>
            </div>
        </div>

        <div class="container last-row">
            <div class="card">
                <h3>Barangay Construction Clearance</h3>
                <p>Request clearance for construction or renovation projects.</p>
                <a href="requestbarangayconstructionclearance.php" class="btn">Request</a>
            </div>

            <div class="card">
                <h3>Report Issue</h3>
                <p>Report issue for giving an action to fix the problem.</p>
                <a href="reportissue.php" class="btn">Request</a>
            </div>
        </div>

        <!-- ✅ JS for Notifications -->
        <script>
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

            // ✅ Load notifications only once (no auto-refresh)
            loadNotifications();

            // ✅ Show notifications when button clicked
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
                    // ✅ Mark notifications as read in DB after closing
                    $.post("mark_notifications_read.php", function() {
                    $("#notifBadge").hide();   // remove red badge immediately
                    notifications = [];        // clear notifications
                    unreadCount = 0;           // reset count
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
