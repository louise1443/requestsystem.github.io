<?php
session_start();
$active = isset($_GET['page']) ? $_GET['page'] : 'user account';
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Barangay Hilantagaan Service Request System</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
<link rel="icon" type="image/png" href="system/kaongkodlogo.jpg">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
    :root {
        --sidebar-width: 260px;
        --accent: #43a047;
        --muted: #b2dfdb;
        --bg: #f1f8e9;
        --sidebar-bg: #c8e6c9;
        --container-bg: #a5d6a7;
        --text-main: #1b5e20;
    }

    body {
        font-family: "Inter", Arial, sans-serif;
        margin: 0;
        background: var(--bg);
        color: var(--text-main);
        overflow-x: hidden;
    }

    .app {
        display: flex;
        min-height: 100vh;
        width: 100%;
    }

    /* ✅ Sidebar */
    .sidebar {
        width: var(--sidebar-width);
        background: var(--sidebar-bg);
        border-right: 1px solid #81c784;
        padding: 30px 18px;
        position: fixed;
        top: 0;
        left: 0;
        bottom: 0;
        z-index: 100;
        overflow-y: auto;
        overflow-x: hidden;
    }

    .sidebar img.logo-img {
        display: block;
        margin: 0 auto 15px auto;
        border-radius: 50%;
        border: 3px solid #fff;
        box-shadow: 0 0 15px rgba(255,255,255,0.8);
        width: 120px;
        height: 120px;
        object-fit: cover;
    }

    .brand h1 {
        font-size: 14px;
        color: #000; /* solid black text */
        font-weight: bold; /* makes it bold */
        margin: 0;
        line-height: 1.2;
        text-align: center;
    }

    .brand p {
        font-size: 12px;
        color: #33691e;
        margin: 0;
        text-align: center;
    }

    nav ul {
        list-style: none;
        padding: 0;
        margin: 12px 0;
    }

    nav li {
        margin: 8px 0;
    }
    nav a{
            display:flex; align-items:center; gap:12px;
            padding:10px 12px; border-radius:8px;
            color:var(--text-main); text-decoration:none;
            transition: background 0.15s;
            }

    nav a.active {
        background: var(--muted);
        color: var(--accent);
        font-weight: 600;
    }

    nav a:hover {
        background: #dcedc8;
        color: var(--accent);
    }

    /* ✅ Main Area */
    .main {
        flex: 1;
        margin-left: var(--sidebar-width);
        padding: 30px;
        min-height: 100vh;
    }

    .topbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background: var(--container-bg);
        padding: 12px 18px;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0,0,0,0.15);
        margin-bottom: 25px;
    }

    .page-title {
        margin: 0;
        font-size: 20px;
        font-weight: 600;
    }

    .panel {
        background: #fff;
        padding: 22px;
        border-radius: 15px;
        box-shadow: 0 3px 8px rgba(0,0,0,0.1);
    }

    /* ✅ Table Styling */
    .table {
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
        margin-top: 10px;
    }

    .table th {
        background-color: #43a047;
        color: white;
        text-align: center;
    }

    .table td {
        text-align: center;
        vertical-align: middle;
    }

    .table-striped tbody tr:nth-child(odd) {
        background-color: #f1f8e9;
    }

    .table-striped tbody tr:nth-child(even) {
        background-color: #e8f5e9;
    }

    /* ✅ Buttons */
    .btn-primary {
        background-color: #43a047;
        border-color: #43a047;
        color: white;
        font-weight: 500;
    }

    .btn-primary:hover {
        background-color: #2e7d32;
        border-color: #2e7d32;
    }

    .btn-danger {
        background-color: #e53935;
        border-color: #c62828;
        color: white;
    }

    .btn-danger:hover {
        background-color: #b71c1c;
        border-color: #b71c1c;
    }

    /* ✅ Animation */
    .fade-in {
        opacity: 0;
        transform: translateY(20px);
        animation: fadeInUp 0.6s ease forwards;
    }

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* ✅ Responsive Adjustments */
    @media (max-width: 768px) {
        .sidebar {
            position: relative;
            width: 100%;
            height: auto;
            border-right: none;
        }

        .main {
            margin-left: 0;
            padding: 20px;
        }

        .topbar {
            flex-direction: column;
            align-items: flex-start;
            gap: 10px;
        }
    }
</style>
</head>
<body>
<div class="app">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="text-center">
            <img src="system/kaongkodlogo.jpg" alt="Barangay Logo" class="logo-img">
        </div>

        <div class="brand">
            <div>
                <h1>Barangay Kaongkod Service Request System</h1>
                <p>Efficient and reliable local service</p>
            </div>
        </div>

        <nav>
            <ul>
                <li><a href="/system/dashboard.php" class="<?= ($active=='dashboard')? 'active':''?>">📊 Dashboard</a></li>
                <li><a href="Send_notification.php" class="<?= ($active=='send notification')? 'active':''?>">🔔 Send Notification</a></li>
                <li><a href="/system/paymentrecord.php" class="<?= ($active=='payment records')? 'active':''?>">💰 Payment Records</a></li>
                <li><a href="/system/budget_record.php" class="<?= ($active=='budget records')? 'active':''?>">💰 Budget Records</a></li>
                <li><a href="/system/resident.php" class="<?= ($active=='residents')? 'active':''?>">📑 Resident Information</a></li>
                <li><a href="/system/barangayofficials.php" class="<?= ($active=='officials')? 'active':''?>">🏛️ Barangay Officials</a></li>
                <li><a href="/system/Useraccount.php" class="<?= ($active=='user account')? 'active':''?>">👤 Users Account</a></li>
            </ul>
        </nav>
    </aside>

    <!-- Main -->
    <main class="main fade-in">
        <div class="topbar">
            <h2 class="page-title">👤 <?= ucfirst($active); ?></h2>
            <!-- ⚙️ Settings Menu -->
                    <div style="position: relative;">
                    <!-- Settings Icon -->
                    <i class="bi bi-gear-fill" 
                        style="font-size: 20px; color: black; cursor: pointer;" 
                        title="Settings" 
                        onclick="toggleSettingsMenu()">⚙️Setting</i>

                    <!-- Dropdown Menu -->
                    <div id="settingsMenu" 
                        style="display: none; position: absolute; right: 0; top: 50px; background: white; border-radius: 8px; 
                                box-shadow: 0 4px 12px rgba(0,0,0,0.15); padding: 10px; min-width: 180px; z-index: 999;">
                        <a href="printing_form.php" class="dropdown-item" 
                        style="display: block; padding: 8px; text-decoration: none; color: #285430;">🖨️ Print Form</a>
                        <a href="archivebusinesspermit.php" class="dropdown-item" 
                        style="display: block; padding: 8px; text-decoration: none; color: #285430;">🗄️ Archive</a>
                        <a href="#" onclick="logoutWithSwal(event)" class="dropdown-item" 
                        style="display: block; padding: 8px; text-decoration: none; color: red; font-weight: bold;">🚪 Logout</a>
                    </div>
                    </div>

                    <script>
                    function toggleSettingsMenu() {
                    const menu = document.getElementById('settingsMenu');
                    menu.style.display = (menu.style.display === 'none' || menu.style.display === '') ? 'block' : 'none';
                    }

                    // ✅ Close dropdown when clicking outside
                    document.addEventListener('click', function(event) {
                    const settingsIcon = document.querySelector('.bi-gear-fill');
                    const menu = document.getElementById('settingsMenu');
                    if (!settingsIcon.contains(event.target) && !menu.contains(event.target)) {
                        menu.style.display = 'none';
                    }
                    });
                    </script>
        </div>

        <div class="panel">
            <h3>👥 User Accounts</h3>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Password</th>
                            <th>Created At</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $conn = new mysqli("localhost", "root", "", "system");
                        if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);
                        $sql = "SELECT * FROM users_account";
                        $result = $conn->query($sql);

                        if ($result->num_rows > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<tr>
                                    <td>{$row['user_id']}</td>
                                    <td>{$row['name']}</td>
                                    <td>{$row['password']}</td>
                                    <td>{$row['created_at']}</td>
                                </tr>";
                            }
                        } else {
                            echo "<tr><td colspan='4' class='text-center'>No users found</td></tr>";
                        }
                        $conn->close();
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    </div>
        <script>
            // ✅ Add fade-in effect when page loads
            document.addEventListener("DOMContentLoaded", () => {
                document.querySelector(".main").classList.add("fade-in");
            });

            // ✅ Add smooth transition when clicking links
            document.querySelectorAll("nav a").forEach(link => {
                link.addEventListener("click", e => {
                    if (link.getAttribute("href") !== "javascript:void(0)") {
                        e.preventDefault();
                        document.querySelector(".main").classList.remove("fade-in");
                        document.querySelector(".main").style.opacity = "0";

                        setTimeout(() => {
                            window.location.href = link.href;
                        }, 300); // Delay to let fade-out play
                    }
                });
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
                            window.location.href = 'Adminlogout.php';
                        }, 1200);
                    }
                });
            }
        </script>
    </body>
</html>

