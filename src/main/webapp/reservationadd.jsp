<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Reservation | Luxe Stays</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f5f7fa;
    min-height: 100vh;
    padding: 2rem 1rem;
}

.container {
    max-width: 500px;
    margin: 0 auto;
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    overflow: hidden;
}

.header {
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
    padding: 2rem;
    text-align: center;
}

.header h1 {
    font-size: 1.8rem;
    margin-bottom: 0.5rem;
}

.header p {
    opacity: 0.9;
    font-size: 0.95rem;
}

.form-section {
    padding: 2rem;
}

.form-group {
    margin-bottom: 1.5rem;
}

label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 600;
    color: #374151;
    font-size: 0.9rem;
}

input {
    width: 100%;
    padding: 0.75rem;
    border: 2px solid #e5e7eb;
    border-radius: 8px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
    background-color: #fff;
}

input:focus {
    outline: none;
    border-color: #667eea;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
}

.submit-btn {
    width: 100%;
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
    border: none;
    padding: 0.875rem;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    margin-top: 1rem;
}

.submit-btn:hover {
    transform: translateY(-1px);
    box-shadow: 0 6px 20px rgba(102, 126, 234, 0.3);
}

.back-link {
    display: inline-block;
    margin-top: 1.5rem;
    color: #667eea;
    text-decoration: none;
    font-weight: 500;
    padding: 0.5rem 0;
    transition: color 0.3s ease;
}

.back-link:hover {
    color: #4f46e5;
}

.back-link::before {
    content: '← ';
    margin-right: 0.5rem;
}

/* Mobile responsiveness */
@media (max-width: 640px) {
    body {
        padding: 1rem 0.5rem;
    }
    
    .header {
        padding: 1.5rem;
    }
    
    .header h1 {
        font-size: 1.5rem;
    }
    
    .form-section {
        padding: 1.5rem;
    }
}
</style>
</head>
<body>

<%
String status = request.getParameter("status");
String errorMessage = (String) request.getAttribute("error");
if ("fail".equals(status) && errorMessage != null) {
%>
<script>
alert("Reservation failed: <%= errorMessage.replace("\"", "\\\"") %>");
// Clean URL
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.pathname);
}
</script>
<%
}
%>

<div class="container">
    <div class="header">
        <h1>Add New Reservation</h1>
        <p>Fill in the details below to create your booking</p>
    </div>

    <div class="form-section">
        <form action="AddReservationServlet" method="post">
            <div class="form-group">
                <label for="customerName">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" required>
            </div>

            <div class="form-group">
                <label for="roomNumber">Room Number:</label>
                <input type="text" id="roomNumber" name="roomNumber" required>
            </div>

            <div class="form-group">
                <label for="checkIn">Check-In Date:</label>
                <input type="date" id="checkIn" name="checkIn" required>
            </div>

            <div class="form-group">
                <label for="checkOut">Check-Out Date:</label>
                <input type="date" id="checkOut" name="checkOut" required>
            </div>

            <div class="form-group">
                <label for="totalAmount">Total Amount:</label>
                <input type="number" id="totalAmount" name="totalAmount" step="0.01" required>
            </div>

            <button type="submit" class="submit-btn">Add Reservation</button>
        </form>

        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</div>

</body>
</html>