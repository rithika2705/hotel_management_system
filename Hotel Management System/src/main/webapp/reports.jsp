<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reports | Luxe Stays</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background:#fff;
    min-height: 100vh;
    padding: 2rem 1rem;
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
    font-size: 2.2rem;
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

.report-options {
    display: grid;
    gap: 1.5rem;
}

.report-option {
    background: linear-gradient(135deg, #f8f9fc 0%, #ffffff 100%);
    border-radius: 12px;
    padding: 1.8rem;
    border: 1px solid #e5e7eb;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.report-option::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: linear-gradient(135deg, #667eea, #764ba2);
}

.report-option:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 24px rgba(102, 126, 234, 0.15);
    border-color: #667eea;
}

.report-option h3 {
    color: #1f2937;
    font-size: 1.3rem;
    margin-bottom: 0.8rem;
    font-weight: 600;
}

.report-option p {
    color: #6b7280;
    margin-bottom: 1.2rem;
    line-height: 1.6;
    font-size: 0.95rem;
}

.report-option a {
    display: inline-flex;
    align-items: center;
    padding: 0.75rem 1.5rem;
    background: linear-gradient(135deg, #667eea, #764ba2);
    color: white;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 500;
    font-size: 0.9rem;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.report-option a:hover {
    transform: translateY(-1px);
    box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    background: linear-gradient(135deg, #5b6fd8, #6a42a0);
}

.report-option a::after {
    content: '→';
    margin-left: 0.5rem;
    transition: transform 0.3s ease;
}

.report-option a:hover::after {
    transform: translateX(2px);
}

.back-link {
    display: inline-flex;
    align-items: center;
    margin-top: 2rem;
    padding: 0.75rem 1.5rem;
    color: #667eea;
    text-decoration: none;
    font-weight: 500;
    border-radius: 8px;
    transition: all 0.3s ease;
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
}

.back-link:hover {
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.15), rgba(118, 75, 162, 0.15));
    transform: translateX(-2px);
}

.back-link::before {
    content: '←';
    margin-right: 0.5rem;
    transition: transform 0.3s ease;
}

.back-link:hover::before {
    transform: translateX(-2px);
}

.footer {
    background: linear-gradient(135deg, #1f2937 0%, #111827 100%);
    color: #d1d5db;
    text-align: center;
    padding: 1.5rem;
    font-size: 0.9rem;
    position: relative;
}

.footer::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 1px;
    background: linear-gradient(90deg, transparent, rgba(102, 126, 234, 0.3), transparent);
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
        font-size: 1.8rem;
    }
    
    .content {
        padding: 2rem 1.5rem;
    }
    
    .report-option {
        padding: 1.5rem;
    }
    
    .report-option h3 {
        font-size: 1.2rem;
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

.report-option {
    animation: fadeInUp 0.6s ease-out;
    animation-fill-mode: both;
}

.report-option:nth-child(1) { animation-delay: 0.1s; }
.report-option:nth-child(2) { animation-delay: 0.2s; }
.report-option:nth-child(3) { animation-delay: 0.3s; }
</style>
</head>
<body>

<div class="container">
    <div class="header">
        <h1>Reports Dashboard</h1>
        <p>Generate comprehensive reports and analytics for your hotel</p>
    </div>

    <div class="content">
        <div class="report-options">
            <div class="report-option">
                <h3>Reservations by Date Range</h3>
                <p>View all reservations between specific dates with detailed booking information and guest details.</p>
                <a href="report_form.jsp?reportType=dateRange">Generate Report</a>
            </div>

            <div class="report-option">
                <h3>Total Revenue</h3>
                <p>Calculate total revenue generated over a specific period with comprehensive financial insights.</p>
                <a href="report_form.jsp?reportType=revenue">Generate Report</a>
            </div>

            <div class="report-option">
                <h3>Most Popular Rooms</h3>
                <p>View which rooms are booked most frequently and analyze occupancy patterns and trends.</p>
                <a href="report_form.jsp?reportType=popularRooms">Generate Report</a>
            </div>
        </div>

        <a href="index.jsp" class="back-link">Back to Home</a>
    </div>
</div>



</body>
</html>