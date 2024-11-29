<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .profile-image {
            max-width: 150px;
            max-height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .profile-detail {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Expense Management</a>
        <div class="ml-auto">
            <a href="logout.html" class="btn btn-danger">Logout</a>
        </div>
    </nav>

    <div class="profile-container">
        <h2 class="text-center">User Profile</h2>

        <!-- Profile Picture -->
        <div class="text-center">
            <c:if test="${not empty profilePicture}">
                <img src="${profilePicture}" alt="Profile Picture" class="profile-image">
            </c:if>
            <c:if test="${empty profilePicture}">
                <img src="default-avatar.png" alt="Profile Picture" class="profile-image">
            </c:if>
        </div>

        <!-- User Information -->
        <div class="profile-detail">
            <strong>Full Name:</strong> <c:out value="${firstName} ${lastName}"/><br>
            <strong>Email:</strong> <c:out value="${email}"/><br>
            <strong>Birthdate:</strong> <c:out value="${birthdate}"/><br>
            <strong>Gender:</strong> <c:out value="${gender}"/><br>
            <strong>Role:</strong> <c:out value="${role}"/><br>
        </div>

        <!-- Edit Profile Button -->
        <div class="text-center">
            <a href="logout.html" class="btn btn-primary">logout</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
