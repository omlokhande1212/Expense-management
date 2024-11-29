<%@ page contentType="text/html;charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Expense Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- SweetAlert2 -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background: #f4f6f9;
        }
        .card {
            margin-bottom: 20px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .btn-danger:hover, .btn-warning:hover {
            opacity: 0.8;
        }
        .chart-container {
            height: 350px;
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <!-- Stats Cards -->
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header">Total Users</div>
                    <div class="card-body text-center">
                        <h3 id="totalUsers">0</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header">Total Expenses</div>
                    <div class="card-body text-center">
                        <h3 id="totalExpenses">0</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header">Categories</div>
                    <div class="card-body text-center">
                        <h3 id="totalCategories">0</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header">Recent Activity</div>
                    <div class="card-body">
                        <ul id="recentActivityList" class="list-group">
                            <!-- Recent activities will be dynamically populated here -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts -->
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">Expenses by Category</div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="categoryChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">Monthly Expenses</div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="monthlyChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Manage Users Section -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5>Manage Users</h5>
                    </div>
                    <div class="card-body">
                        <button class="btn btn-primary" onclick="addUser()">Add New User</button>
                        <button class="btn btn-danger ml-3" onclick="deleteUser()">Delete User</button>
                        <button class="btn btn-warning ml-3" onclick="editUser()">Edit User</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- SweetAlert2 Script -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.all.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>

    <script>
        // Fetch data and populate stats (Replace with real API/Database calls)
        document.addEventListener("DOMContentLoaded", function() {
            // Mock Data (Replace with actual database data)
            let totalUsers = 120;
            let totalExpenses = 45000;
            let totalCategories = 5;
            let recentActivity = [
                "User John Doe added an expense of $300",
                "Admin deleted a user: jane_doe",
                "User Bob updated an expense"
            ];

            // Populate the dashboard with data
            document.getElementById('totalUsers').textContent = totalUsers;
            document.getElementById('totalExpenses').textContent = `$${totalExpenses}`;
            document.getElementById('totalCategories').textContent = totalCategories;

            // Populate recent activities list
            let activityList = document.getElementById('recentActivityList');
            recentActivity.forEach(function(activity) {
                let li = document.createElement('li');
                li.classList.add('list-group-item');
                li.textContent = activity;
                activityList.appendChild(li);
            });

            // Setup Charts
            var categoryCtx = document.getElementById('categoryChart').getContext('2d');
            var monthlyCtx = document.getElementById('monthlyChart').getContext('2d');

            // Category Chart (Mock data)
            var categoryChart = new Chart(categoryCtx, {
                type: 'pie',
                data: {
                    labels: ['Food', 'Transport', 'Rent', 'Entertainment', 'Other'],
                    datasets: [{
                        label: 'Expenses by Category',
                        data: [3000, 5000, 15000, 7000, 4000], // Mock values
                        backgroundColor: ['#ff6f61', '#ffcc5c', '#66b3ff', '#99cc99', '#f2b5d4'],
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                    },
                }
            });

            // Monthly Expenses Chart (Mock data)
            var monthlyChart = new Chart(monthlyCtx, {
                type: 'line',
                data: {
                    labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                    datasets: [{
                        label: 'Monthly Expenses',
                        data: [5000, 6000, 4500, 7000, 8000, 5500, 6000], // Mock values
                        borderColor: '#007bff',
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            ticks: {
                                beginAtZero: true
                            }
                        },
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        });

        // Admin Actions: Add, Edit, Delete User (Dummy Functions)
        function addUser() {
            Swal.fire({
                title: 'Add New User',
                text: 'Enter the details for the new user',
                input: 'text',
                showCancelButton: true,
                confirmButtonText: 'Add User',
                cancelButtonText: 'Cancel'
            });
        }

        function deleteUser() {
            Swal.fire({
                title: 'Delete User',
                text: 'Are you sure you want to delete this user?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, Delete',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire('Deleted!', 'The user has been deleted.', 'success');
                }
            });
        }

        function editUser() {
            Swal.fire({
                title: 'Edit User',
                text: 'Update the details of the user',
                input: 'text',
                showCancelButton: true,
                confirmButtonText: 'Update User',
                cancelButtonText: 'Cancel'
            });
        }
    </script>
</body>
</html>
