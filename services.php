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
            .panel{
                margin-top: 50px;
            }
            .services-text {
                max-width: 800px;
                margin: 0 auto 40px auto;
                text-align: center;
                color: #2c3e50;
            }
            .services-text h2 { 
                margin-bottom: 40px; 
                font-size: 30px; 
                font-weight: bold; 
            }
            .services-text p {
                font-size: 20px;
                color: #222;
                line-height: 2.0;
                margin-bottom: 12px;
            }
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
        <div class="panel">
            <div class="services-text">
                <h2>About Barangay Services</h2>
                <p>
                The Barangay Services Request System is designed to make local government services more accessible, 
                efficient, and transparent for every resident. Whether you are applying for permits, requesting 
                assistance, or reporting issues, this platform ensures that your concerns are addressed promptly. 
                </p>
                <p>
                By embracing digital solutions, the barangay continues to strengthen its role as the first line 
                of service delivery, ensuring peace, order, and community development for all residents.
                </p>
                <h2>Vision</h2>
                <p>
                Barangay Kaongkod envisions a community with a transparent and accountable constituents for good governance. 
                To achieve challenges, prosperity and development in all aspect, to produce a progressive, peace loving 
                community and environmentally friendly through the guidance of our Almighty God.
                </p>
                <h2>Mission</h2>
                <p>
                In order to achieve our vision, we pledge to promote unity, cooperation, realization and sincerity among 
                the residents. We shall popuralized, approachable, supportive, responsive and above all God-Fearing Community.
                </p>
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
