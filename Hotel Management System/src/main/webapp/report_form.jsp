<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Generate Report | Luxe Stays</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
    max-width: 700px;
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
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.header h1::before {
    content: '📊';
    font-size: 1.5rem;
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

.error-alert {
    background: linear-gradient(135deg, #ff6b6b, #ee5a52);
    color: white;
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 2rem;
    font-weight: 500;
    box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
    animation: shake 0.5s ease-in-out;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.error-alert::before {
    content: '⚠️';
    font-size: 1.2rem;
}

@keyframes shake {
    0%, 20%, 50%, 80%, 100% { transform: translateX(0); }
    10% { transform: translateX(-5px); }
    30% { transform: translateX(5px); }
    60% { transform: translateX(-3px); }
}

.report-type-info {
    background: linear-gradient(135deg, #e3f2fd 0%, #f8f9fa 100%);
    border-radius: 12px;
    padding: 1.5rem;
    margin-bottom: 2rem;
    border-left: 4px solid #667eea;
    position: relative;
}

.report-type-info h2 {
    color: #1f2937;
    margin-bottom: 0.5rem;
    font-size: 1.3rem;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.report-type-info p {
    color: #6b7280;
    font-size: 0.95rem;
    line-height: 1.5;
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
    display: flex;
    align-items: center;
    gap: 0.5rem;
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

.btn {
    width: 100%;
    padding: 1rem 2rem;
    border: none;
    border-radius: 8px;
    font-weight: 600;
    font-size: 1.1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.btn:hover {
    background: linear-gradient(135deg, #5a67d8, #6b46c1);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
}

.btn::before {
    content: '📈';
    font-size: 1rem;
}

.btn:disabled {
    opacity: 0.6;
    cursor: not-allowed;
    transform: none;
}

.btn:disabled:hover {
    transform: none;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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
    padding: 0.5rem 1rem;
    border-radius: 6px;
}

.back-link a:hover {
    background: rgba(102, 126, 234, 0.1);
    color: #4f46e5;
    transform: translateX(-3px);
}

.back-link a::before {
    content: '🏠';
}

.no-params-message {
    text-align: center;
    color: #10b981;
    font-weight: 500;
    font-size: 1rem;
    background: linear-gradient(135deg, #d1fae5, #ecfdf5);
    padding: 1rem;
    border-radius: 8px;
    border: 1px solid #a7f3d0;
}

.no-params-message::before {
    content: '✨';
    display: block;
    font-size: 1.5rem;
    margin-bottom: 0.5rem;
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
        flex-direction: column;
        gap: 0.3rem;
    }
    
    .content {
        padding: 2rem 1.5rem;
    }
    
    .form-container {
        padding: 1.5rem;
    }
    
    .form-input {
        padding: 0.75rem;
        font-size: 0.95rem;
    }
    
    .btn {
        padding: 0.875rem 1.5rem;
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

.form-container {
    animation: fadeInUp 0.6s ease-out 0.1s both;
}

.btn {
    animation: fadeInUp 0.6s ease-out 0.2s both;
}

/* Report type specific icons */
.date-range-icon::before { content: '📅'; }
.revenue-icon::before { content: '💰'; }
.popular-rooms-icon::before { content: '🏆'; }

/* Enhanced date input styling */
.form-input[type="date"] {
    position: relative;
}

.form-input[type="date"]::-webkit-calendar-picker-indicator {
    color: #667eea;
    cursor: pointer;
    font-size: 1.2rem;
}

/* Loading animation */
@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

.btn.loading::before {
    content: '⏳';
    animation: spin 1s linear infinite;
}

/* Success state */
.success-message {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
    padding: 1rem 1.5rem;
    border-radius: 8px;
    margin-bottom: 2rem;
    font-weight: 500;
    box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.success-message::before {
    content: '✅';
    font-size: 1.2rem;
}
</style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Generate Report</h1>
        <p>Create detailed analytics and insights</p>
    </div>

    <div class="content">
        <%
        String error = request.getParameter("error");
        if (error != null && !error.isEmpty()) {
        %>
            <div class="error-alert">
                <%= error.replaceAll("\"", "&quot;") %>
            </div>
        <%
        }
        %>

        <%
        String reportType = request.getParameter("reportType");
        if (reportType == null) {
        %>
            <div class="error-alert">
                No report type selected. Please select a report type from the main menu.
            </div>
            <div class="back-link">
                <a href="dashboard.jsp">Back to Dashboard</a>
            </div>
        <%
        } else {
        %>
            <div class="report-type-info">
                <h2 class="<%= reportType.equals("dateRange") ? "date-range-icon" : 
                              reportType.equals("revenue") ? "revenue-icon" : 
                              reportType.equals("popularRooms") ? "popular-rooms-icon" : "" %>">
                    <%= reportType.equals("dateRange") ? "Reservations by Date Range" :
                        reportType.equals("revenue") ? "Revenue Report" :
                        reportType.equals("popularRooms") ? "Popular Rooms Report" : "Unknown Report" %>
                </h2>
                <p>
                    <%= reportType.equals("dateRange") ? "Generate a comprehensive list of all reservations within your specified date range." :
                        reportType.equals("revenue") ? "Analyze your revenue performance and financial metrics for the selected period." :
                        reportType.equals("popularRooms") ? "Discover which rooms are most frequently booked and generate insights." : "Report description not available." %>
                </p>
            </div>

            <form action="ReportServlet" method="post" class="report-form">
                <div class="form-container">
                    <input type="hidden" name="reportType" value="<%= reportType %>" class="hidden-input">

                    <%
                    if ("dateRange".equals(reportType) || "revenue".equals(reportType)) {
                    %>
                        <div class="form-group">
                            <label for="startDate" class="form-label">
                                <i class="fas fa-calendar-alt"></i>
                                Start Date
                            </label>
                            <input type="date" id="startDate" name="startDate" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label for="endDate" class="form-label">
                                <i class="fas fa-calendar-check"></i>
                                End Date
                            </label>
                            <input type="date" id="endDate" name="endDate" class="form-input" required>
                        </div>
                    <%
                    } else if ("popularRooms".equals(reportType)) {
                    %>
                        <div class="no-params-message">
                            This report doesn't require additional parameters.
                            Click generate to view the most popular rooms.
                        </div>
                    <%
                    }
                    %>
                </div>

                <button type="submit" class="btn">Generate Report</button>
            </form>

            <div class="back-link">
                <a href="index.jsp">Back to Home</a>
            </div>
        <%
        }
        %>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.report-form');
    const submitBtn = document.querySelector('.btn');
    const startDateInput = document.getElementById('startDate');
    const endDateInput = document.getElementById('endDate');
    
    // Date validation
    function validateDates() {
        if (startDateInput && endDateInput) {
            const startDate = new Date(startDateInput.value);
            const endDate = new Date(endDateInput.value);
            const today = new Date();
            today.setHours(23, 59, 59, 999);
            
            if (startDate > today) {
                startDateInput.setCustomValidity('Start date cannot be in the future');
                return false;
            } else if (endDate < startDate) {
                endDateInput.setCustomValidity('End date must be after start date');
                return false;
            } else {
                startDateInput.setCustomValidity('');
                endDateInput.setCustomValidity('');
                return true;
            }
        }
        return true;
    }
    
    // Add event listeners for date validation
    if (startDateInput && endDateInput) {
        startDateInput.addEventListener('change', validateDates);
        endDateInput.addEventListener('change', validateDates);
        
        // Set max date to today for both inputs
        const today = new Date().toISOString().split('T')[0];
        startDateInput.setAttribute('max', today);
        endDateInput.setAttribute('max', today);
    }
    
    // Form submission with loading state
    if (form) {
        form.addEventListener('submit', function(e) {
            if (!validateDates()) {
                e.preventDefault();
                return;
            }
            
            if (form.checkValidity()) {
                submitBtn.disabled = true;
                submitBtn.classList.add('loading');
                submitBtn.textContent = 'Generating Report...';
                submitBtn.style.background = 'linear-gradient(135deg, #9ca3af, #6b7280)';
            }
        });
    }
    
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
    
    // Auto-fill with reasonable defaults
    if (startDateInput && endDateInput) {
        const today = new Date();
        const thirtyDaysAgo = new Date(today.getTime() - (30 * 24 * 60 * 60 * 1000));
        
        if (!startDateInput.value) {
            startDateInput.value = thirtyDaysAgo.toISOString().split('T')[0];
        }
        if (!endDateInput.value) {
            endDateInput.value = today.toISOString().split('T')[0];
        }
    }
});

// Keyboard shortcuts
document.addEventListener('keydown', function(e) {
    if (e.ctrlKey && e.key === 'Enter') {
        const form = document.querySelector('.report-form');
        if (form) form.submit();
    }
    if (e.key === 'Escape') {
        window.location.href = 'dashboard.jsp';
    }
});

// Show alert for errors
<%
if (error != null && !error.isEmpty()) {
%>
setTimeout(function() {
    const errorAlert = document.querySelector('.error-alert');
    if (errorAlert) {
        errorAlert.style.opacity = '0';
        setTimeout(() => errorAlert.remove(), 300);
    }
}, 5000);
<%
}
%>
</script>

</body>
</html>