<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, com.dao.ReservationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Delete Reservation | Luxe Stays</title>
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

.warning-message {
    background: linear-gradient(135deg, #ffeaa7, #fdcb6e);
    color: #2d3436;
    padding: 1.5rem;
    border-radius: 12px;
    margin-bottom: 2rem;
    text-align: center;
    font-weight: 600;
    font-size: 1.1rem;
    box-shadow: 0 4px 12px rgba(253, 203, 110, 0.3);
}

.warning-message::before {
    content: '⚠️';
    font-size: 1.5rem;
    display: block;
    margin-bottom: 0.5rem;
}

.reservation-details {
    background: linear-gradient(135deg, #f8f9fc 0%, #ffffff 100%);
    border-radius: 12px;
    padding: 2rem;
    margin-bottom: 2rem;
    border: 1px solid #e5e7eb;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    position: relative;
}

.reservation-details::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border-radius: 2px 0 0 2px;
}

.reservation-details h3 {
    color: #1f2937;
    margin-bottom: 1.5rem;
    font-size: 1.3rem;
    font-weight: 600;
}

.detail-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.75rem 0;
    border-bottom: 1px solid #f3f4f6;
}

.detail-row:last-child {
    border-bottom: none;
    font-weight: 600;
    color: #059669;
    font-size: 1.1rem;
}

.detail-label {
    font-weight: 600;
    color: #374151;
    min-width: 140px;
}

.detail-value {
    color: #6b7280;
    font-weight: 500;
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
    min-width: 120px;
}

.delete-btn {
    background: linear-gradient(135deg, #ef4444, #dc2626);
    color: white;
}

.delete-btn:hover {
    background: linear-gradient(135deg, #dc2626, #b91c1c);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(239, 68, 68, 0.4);
}

.delete-btn::before {
    content: '🗑️';
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
    
    .actions {
        flex-direction: column;
        align-items: stretch;
    }
    
    .btn {
        width: 100%;
        justify-content: center;
    }
    
    .detail-row {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.25rem;
    }
    
    .detail-label {
        min-width: auto;
        font-size: 0.9rem;
    }
    
    .detail-value {
        font-size: 1rem;
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

.reservation-details {
    animation: fadeInUp 0.6s ease-out 0.1s both;
}

.actions {
    animation: fadeInUp 0.6s ease-out 0.2s both;
}

/* Confirmation modal styles */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.5);
    backdrop-filter: blur(5px);
}

.modal-content {
    background: white;
    margin: 15% auto;
    padding: 2rem;
    border-radius: 12px;
    width: 90%;
    max-width: 400px;
    text-align: center;
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.modal-content h3 {
    color: #dc2626;
    margin-bottom: 1rem;
    font-size: 1.3rem;
}

.modal-content p {
    margin-bottom: 1.5rem;
    color: #6b7280;
}

.modal-actions {
    display: flex;
    gap: 1rem;
    justify-content: center;
}

.modal-btn {
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

.confirm-btn {
    background: #dc2626;
    color: white;
}

.confirm-btn:hover {
    background: #b91c1c;
}

.modal-cancel-btn {
    background: #6b7280;
    color: white;
}

.modal-cancel-btn:hover {
    background: #4b5563;
}
</style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Delete Reservation</h1>
        <p>Review the details before confirming deletion</p>
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

       

        <div class="reservation-details">
            <h3>Reservation Details</h3>
            
            <div class="detail-row">
                <span class="detail-label">Reservation ID:</span>
                <span class="detail-value">#<%= reservation.getReservationId() %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Customer Name:</span>
                <span class="detail-value"><%= reservation.getCustomerName() %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Room Number:</span>
                <span class="detail-value"><%= reservation.getRoomNumber() %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Check-In Date:</span>
                <span class="detail-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckIn()) %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Check-Out Date:</span>
                <span class="detail-value"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckOut()) %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Total Amount:</span>
                <span class="detail-value">$<%= String.format("%.2f", reservation.getTotalAmount()) %></span>
            </div>
        </div>

        <div class="actions">
            <button type="button" class="btn delete-btn" onclick="showConfirmModal()">Delete Reservation</button>
            <a href="reservationdisplay" class="btn cancel-btn">Cancel</a>
        </div>
    </div>
</div>

<!-- Confirmation Modal -->
<div id="confirmModal" class="modal">
    <div class="modal-content">
        <h3>Confirm Deletion</h3>
        <p>Are you absolutely sure you want to delete this reservation?</p>
        <div class="modal-actions">
            <form action="DeleteReservationServlet" method="post" style="display: inline;">
                <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>">
                <button type="submit" class="modal-btn confirm-btn">Yes, Delete</button>
            </form>
            <button type="button" class="modal-btn modal-cancel-btn" onclick="hideConfirmModal()">Cancel</button>
        </div>
    </div>
</div>

<script>
function showConfirmModal() {
    document.getElementById('confirmModal').style.display = 'block';
}

function hideConfirmModal() {
    document.getElementById('confirmModal').style.display = 'none';
}

// Close modal when clicking outside
window.onclick = function(event) {
    const modal = document.getElementById('confirmModal');
    if (event.target == modal) {
        hideConfirmModal();
    }
}

// Add keyboard support
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        hideConfirmModal();
    }
});


</script>

</body>
</html>