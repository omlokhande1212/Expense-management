<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- SweetAlert2 for alerts -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Custom CSS -->
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #e0eafc, #cfdef3);
            font-family: Arial, sans-serif;
        }
        .register-container {
            max-width: 500px;
            width: 100%;
            padding: 30px;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .register-card h3 {
            color: #007bff;
            font-weight: bold;
            font-size: 1.8rem;
            margin-bottom: 1rem;
        }
        .register-btn {
            width: 100%;
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .register-btn:hover {
            background-color: #0056b3;
        }
        .form-group i {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: #007bff;
        }
        .form-group input,
        .form-group select {
            padding-left: 40px;
            height: 45px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }
        .form-group input:focus,
        .form-group select:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
        }
        .social-media-icons {
            margin-top: 20px;
            text-align: center;
        }
        .social-media-icons a {
            font-size: 25px;
            margin: 0 10px;
            color: #333;
            text-decoration: none;
        }
        .social-media-icons a:hover {
            color: #007bff;
        }
        .login-link {
            display: block;
            text-align: center;
            margin-top: 15px;
        }
        .login-link a {
            color: #007bff;
            font-weight: bold;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <div class="card register-card">
        <h3 class="text-center mb-4">Sign Up</h3>
        <form id="registerForm" action="RegistrationServlet" method="POST">
            <div class="form-group position-relative">
                <i class="fas fa-user"></i>
                <label for="username" class="sr-only">Username</label>
                <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="form-group position-relative">
                <i class="fas fa-envelope"></i>
                <label for="email" class="sr-only">Email</label>
                <input type="email" class="form-control" name="email" placeholder="Email" required>
            </div>
            <div class="form-group position-relative">
                <i class="fas fa-lock"></i>
                <label for="password" class="sr-only">Password</label>
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <div class="form-group position-relative">
                <i class="fas fa-calendar-alt"></i>
                <label for="birthdate" class="sr-only">Birthdate</label>
                <input type="date" class="form-control" name="birthdate" required>
            </div>
            <div class="form-group position-relative">
                <i class="fas fa-venus-mars"></i>
                <label for="gender" class="sr-only">Gender</label>
                <select class="form-control" name="gender" required>
                    <option value="" disabled selected>Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group position-relative">
                <i class="fas fa-user-tag"></i>
                <label for="role" class="sr-only">Role</label>
                <select class="form-control" name="role" required>
                    <option value="" disabled selected>Select Role</option>
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                </select>
            </div>
            <button type="submit" class="btn register-btn">Register</button>
        </form>

        <div class="login-link">
            <p>Already have an account? <a href="Login.jsp">Login here</a></p>
        </div>

        <div class="social-media-icons">
            <a href="#" class="fab fa-facebook-square"></a>
            <a href="#" class="fab fa-google"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-linkedin"></a>
        </div>
    </div>
</div>

<% String status = (String) request.getAttribute("status"); %>
<script>
    <% if ("userexists".equals(status)) { %>
        Swal.fire("Error", "User already exists. Please try a different email.", "error");
    <% } else if ("success".equals(status)) { %>
        Swal.fire("Congrats", "Account Created Successfully", "success");
    <% } else if ("failed".equals(status)) { %>
        Swal.fire("Error", "Registration failed. Please try again.", "error");
    <% } %>
</script>

</body>
</html>
