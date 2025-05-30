<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, com.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Update Reservation | Luxe Stays</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #fff;
    min-height: 100vh;
    padding: 2rem 1rem;
    color: #333;
}

.container {
    max-width: 600px;
    margin: 0 auto;
    background: white;
    border-radius: 16px;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    overflow: hidden;
    backdrop-filter: blur(10px);
}

.header {
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
    padding: 2.5rem 2rem;
    text-align: center;
    position: relative;
}

.header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(45deg, rgba(255,255,255,0.1) 0%, transparent 50%);
}

.header h1 {
    font-size: 2rem;
    margin-bottom: 0.5rem;
    font-weight: 700;
    position: relative;
    z-index: 1;
}

.header p {
    opacity: 0.9;
    font-size: 1rem;
    position: relative;
    z-index: 1;
}

.content {
    padding: 2.5rem 2rem;
}

.error {
    background: linear-gradient(135deg, #ff6b6b, #ee5a52);
    color: white;
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 2rem;
    font-weight: 500;
    box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
    animation: shake 0.5s ease-in-out;
}

@keyframes shake {
    0%, 20%, 50%, 80%, 100% { transform: translateX(0); }
    10% { transform: translateX(-5px); }
    30% { transform: translateX(5px); }
    60% { transform: translateX(-3px); }
}

.form-container {
    background: linear-gradient(135deg, #f8f9fc 0%, #ffffff 100%);
    border-radius: 12px;
    padding: 2rem;
    border: 1px solid #e5e7eb;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    position: relative;
    margin-bottom: 2rem;
}

.form-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border-radius: 2px 0 0 2px;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 600;
    color: #374151;
    font-size: 0.9rem;
}

.form-input {
    width: 100%;
    padding: 0.875rem 1rem;
    border: 2px solid #e5e7eb;
    border-radius: 8px;
    font-size: 1rem;
    transition: all 0.3s ease;
    background: white;
    color: #1f2937;
}

.form-input:focus {
    outline: none;
    border-color: #667eea;
    box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    transform: translateY(-1px);
}

.form-input:hover {
    border-color: #9ca3af;
}

.hidden-input {
    display: none;
}

.actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
    margin-top: 2rem;
}

.btn {
    padding: 0.875rem 2rem;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    font-size: 1rem;
    cursor: pointer;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    min-width: 140px;
}

.update-btn {
    background: linear-gradient(135deg, #059669, #047857);
    color: white;
}

.update-btn:hover {
    background: linear-gradient(135deg, #047857, #065f46);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(5, 150, 105, 0.4);
}

.update-btn::before {
    content: '✏️';
    margin-right: 0.5rem;
}

.cancel-btn {
    background: linear-gradient(135deg, #6b7280, #4b5563);
    color: white;
}

.cancel-btn:hover {
    background: linear-gradient(135deg, #4b5563, #374151);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(107, 114, 128, 0.4);
}

.cancel-btn::before {
    content: '←';
    margin-right: 0.5rem;
}

.back-link {
    text-align: center;
    margin-top: 1.5rem;
}

.back-link a {
    color: #667eea;
    text-decoration: none;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    transition: all 0.3s ease;
}

.back-link a:hover {
    color: #4f46e5;
    transform: translateX(-3px);
}

.back-link a::before {
    content: '🏠';
}

/* Mobile responsiveness */
@media (max-width: 768px) {
    body {
        padding: 1rem 0.5rem;
    }
    
    .header {
        padding: 2rem 1.5rem;
    }
    
    .header h1 {
        font-size: 1.6rem;
    }
    
    .content {
        padding: 2rem 1.5rem;
    }
    
    .form-container {
        padding: 1.5rem;
    }
    
    .actions {
        flex-direction: column;
        align-items: stretch;
    }
    
    .btn {
        width: 100%;
        justify-content: center;
    }
    
    .form-input {
        padding: 0.75rem;
        font-size: 0.95rem;
    }
}

/* Animation for page load */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.container {
    animation: fadeInUp 0.6s ease-out;
}

.form-container {
    animation: fadeInUp 0.6s ease-out 0.1s both;
}

.actions {
    animation: fadeInUp 0.6s ease-out 0.2s both;
}

/* Form validation styles */
.form-input:invalid {
    border-color: #ef4444;
}

.form-input:valid {
    border-color: #10b981;
}

/* Loading state for form submission */
.btn:disabled {
    opacity: 0.6;
    cursor: not-allowed;
    transform: none;
}

.btn:disabled:hover {
    transform: none;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* Success message */
.success {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 2rem;
    font-weight: 500;
    box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
    animation: slideInDown 0.5s ease-out;
}

@keyframes slideInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Enhanced input focus effects */
.form-group {
    position: relative;
}

.form-input:focus + .form-label,
.form-input:not(:placeholder-shown) + .form-label {
    color: #667eea;
    transform: scale(0.85) translateY(-0.5rem);
}

/* Custom date input styling */
.form-input[type="date"] {
    position: relative;
}

.form-input[type="date"]::-webkit-calendar-picker-indicator {
    color: #667eea;
    cursor: pointer;
}

/* Number input styling */
.form-input[type="number"] {
    -moz-appearance: textfield;
}

.form-input[type="number"]::-webkit-outer-spin-button,
.form-input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Update Reservation</h1>
        <p>Modify reservation details with ease</p>
    </div>

    <div class="content">
        <%
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendRedirect("reservationdisplay.jsp");
            return;
        }

        int id = Integer.parseInt(idParam);
        ReservationDAO reservationDAO = new ReservationDAO();
        Reservation reservation = reservationDAO.selectReservation(id);

        if (reservation == null) {
            response.sendRedirect("reservationdisplay.jsp");
            return;
        }

        if (request.getAttribute("errorMessage") != null) { %>
            <div class="error"><%= request.getAttribute("errorMessage") %></div>
        <% } %>

        <form action="UpdateReservationServlet" method="post" class="update-form">
            <div class="form-container">
                <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>" class="hidden-input">

                <div class="form-group">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" id="customerName" name="customerName" 
                           value="<%= reservation.getCustomerName() %>" 
                           class="form-input" required placeholder="Enter customer name">
                </div>

                <div class="form-group">
                    <label for="roomNumber" class="form-label">Room Number</label>
                    <input type="text" id="roomNumber" name="roomNumber" 
                           value="<%= reservation.getRoomNumber() %>" 
                           class="form-input" required placeholder="Enter room number">
                </div>

                <div class="form-group">
                    <label for="checkIn" class="form-label">Check-In Date</label>
                    <input type="date" id="checkIn" name="checkIn"
                           value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckIn()) %>" 
                           class="form-input" required>
                </div>

                <div class="form-group">
                    <label for="checkOut" class="form-label">Check-Out Date</label>
                    <input type="date" id="checkOut" name="checkOut"
                           value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(reservation.getCheckOut()) %>" 
                           class="form-input" required>
                </div>

                <div class="form-group">
                    <label for="totalAmount" class="form-label">Total Amount ($)</label>
                    <input type="number" id="totalAmount" name="totalAmount" step="0.01"
                           value="<%= reservation.getTotalAmount() %>" 
                           class="form-input" required placeholder="0.00" min="0">
                </div>
            </div>

            <div class="actions">
                <button type="submit" class="btn update-btn">Update Reservation</button>
                <a href="reservationdisplay" class="btn cancel-btn">Cancel</a>
            </div>
        </form>

    </div>
</div>

<script>
// Form validation and enhancement
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.update-form');
    const submitBtn = document.querySelector('.update-btn');
    const checkInInput = document.getElementById('checkIn');
    const checkOutInput = document.getElementById('checkOut');
    
    // Date validation
    function validateDates() {
        const checkIn = new Date(checkInInput.value);
        const checkOut = new Date(checkOutInput.value);
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        
        if (checkIn < today) {
            checkInInput.setCustomValidity('Check-in date cannot be in the past');
        } else if (checkOut <= checkIn) {
            checkOutInput.setCustomValidity('Check-out date must be after check-in date');
        } else {
            checkInInput.setCustomValidity('');
            checkOutInput.setCustomValidity('');
        }
    }
    
    checkInInput.addEventListener('change', validateDates);
    checkOutInput.addEventListener('change', validateDates);
    
    // Form submission with loading state
    form.addEventListener('submit', function(e) {
        validateDates();
        
        if (form.checkValidity()) {
            submitBtn.disabled = true;
            submitBtn.textContent = 'Updating...';
            submitBtn.style.background = 'linear-gradient(135deg, #9ca3af, #6b7280)';
        }
    });
    
    // Enhanced input interactions
    const inputs = document.querySelectorAll('.form-input');
    inputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'scale(1.02)';
            this.parentElement.style.transition = 'transform 0.2s ease';
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'scale(1)';
        });
    });
    
    // Auto-format currency input
    const amountInput = document.getElementById('totalAmount');
    amountInput.addEventListener('input', function() {
        let value = parseFloat(this.value);
        if (!isNaN(value)) {
            this.value = value.toFixed(2);
        }
    });
});

// Keyboard shortcuts
document.addEventListener('keydown', function(e) {
    if (e.ctrlKey && e.key === 'Enter') {
        document.querySelector('.update-form').submit();
    }
    if (e.key === 'Escape') {
        window.location.href = 'reservationdisplay.jsp';
    }
});
</script>

</body>
</html>