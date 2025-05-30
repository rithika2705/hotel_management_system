<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxe Stays | Hotel Reservation System</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
            overflow-x: hidden;
        }

        /* Animated Background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(255, 118, 117, 0.3) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(120, 219, 226, 0.3) 0%, transparent 50%);
            z-index: -1;
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            33% { transform: translateY(-20px) rotate(1deg); }
            66% { transform: translateY(-10px) rotate(-1deg); }
        }

        /* Navigation Bar */
        nav {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
            padding: 1rem 2rem;
            position: sticky;
            top: 0;
            z-index: 100;
            transition: all 0.3s ease;
        }

        nav:hover {
            background: rgba(255, 255, 255, 0.15);
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        nav h2 {
            color: #ffffff;
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(45deg, #fff, #e0e7ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 2rem;
        }

        nav ul li a {
            color: rgba(255, 255, 255, 0.9);
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            border-radius: 50px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        nav ul li a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        nav ul li a:hover::before {
            left: 100%;
        }

        nav ul li a:hover {
            background: rgba(255, 255, 255, 0.2);
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        /* Hero Section */
        .hero {
            text-align: center;
            padding: 6rem 2rem 4rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .hero h1 {
            font-size: clamp(2.5rem, 5vw, 4rem);
            margin-bottom: 1.5rem;
            color: #ffffff;
            font-weight: 800;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            animation: slideDown 1s ease-out;
        }

        .hero p {
            font-size: 1.3rem;
            margin-bottom: 3rem;
            color: rgba(255, 255, 255, 0.9);
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            line-height: 1.6;
            animation: slideUp 1s ease-out 0.2s both;
        }

        .cta-button {
            display: inline-block;
            background: linear-gradient(45deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 1rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
            box-shadow: 0 8px 25px rgba(238, 90, 36, 0.3);
            position: relative;
            overflow: hidden;
            animation: slideUp 1s ease-out 0.4s both;
        }

        .cta-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s;
        }

        .cta-button:hover::before {
            left: 100%;
        }

        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(238, 90, 36, 0.4);
            background: linear-gradient(45deg, #ee5a24, #ff6b6b);
        }

        /* Main Content */
        main {
            padding: 4rem 2rem 6rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .services-title {
            text-align: center;
            margin-bottom: 4rem;
            color: #ffffff;
            font-size: 2.5rem;
            font-weight: 700;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .service-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 2.5rem;
            text-align: center;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .service-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #ff6b6b, #4ecdc4, #45b7d1);
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .service-card:hover::before {
            transform: scaleX(1);
        }

        .service-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        .service-card h3 {
            color: #ffffff;
            margin-bottom: 1rem;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .service-card p {
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 2rem;
            line-height: 1.6;
            font-size: 1.1rem;
        }

        .service-button {
            background: linear-gradient(45deg, #4ecdc4, #44a08d);
            color: white;
            padding: 0.8rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            display: inline-block;
            box-shadow: 0 6px 20px rgba(68, 160, 141, 0.3);
        }

        .service-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(68, 160, 141, 0.4);
            background: linear-gradient(45deg, #44a08d, #4ecdc4);
        }

        /* Toast Notification */
        #toast {
            position: fixed;
            top: 20px;
            right: 20px;
            background: linear-gradient(45deg, #4CAF50, #45a049);
            color: white;
            padding: 1.5rem 2rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(76, 175, 80, 0.3);
            z-index: 1000;
            animation: slideInRight 0.5s ease, pulse 2s infinite;
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            max-width: 350px;
        }

        #toast strong {
            font-size: 1.2rem;
            display: block;
            margin-bottom: 0.5rem;
        }

        #toast p {
            margin: 0;
            opacity: 0.9;
        }

        #toast button {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 25px;
            font-weight: 600;
            margin-top: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        #toast button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.05);
        }

        /* Animations */
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInRight {
            from {
                opacity: 0;
                transform: translateX(100%);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.02); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            nav {
                padding: 1rem;
            }
            
            .nav-container {
                flex-direction: column;
                gap: 1rem;
            }

            nav ul {
                gap: 1rem;
            }

            .hero {
                padding: 4rem 1rem 3rem;
            }

            .services-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .service-card {
                padding: 2rem;
            }

            #toast {
                right: 10px;
                left: 10px;
                max-width: none;
            }
        }

        /* Scroll animations */
        .service-card {
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 0.6s ease forwards;
        }

        .service-card:nth-child(1) { animation-delay: 0.1s; }
        .service-card:nth-child(2) { animation-delay: 0.2s; }
        .service-card:nth-child(3) { animation-delay: 0.3s; }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

<%
    String status = request.getParameter("status");
    String toastMessage = "";
    String toastTitle = "";

    if ("success".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully created.";
    } else if ("deleted".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully deleted.";
    } else if ("done".equals(status)) {
        toastTitle = "Success!";
        toastMessage = "Your reservation has been successfully updated.";
    }

    if (!toastMessage.isEmpty()) {
%>
    <div id="toast">
        <strong><%= toastTitle %></strong>
        <p><%= toastMessage %></p>
        <button onclick="closeToast()">Close</button>
    </div>

    <script>
        function closeToast() {
            const toast = document.getElementById('toast');
            toast.style.animation = 'slideInRight 0.5s ease reverse';
            setTimeout(() => {
                toast.style.display = 'none';
            }, 500);
        }

        window.onload = function () {
            setTimeout(() => {
                closeToast();
            }, 5000);

            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.pathname);
            }
        };
    </script>
<% } %>

<!-- Navigation Bar -->


<!-- Hero Section -->
<section class="hero">
    <h1>Hotel Reservation System</h1>
    <p>Experience seamless booking with our state-of-the-art reservation platform. Your comfort and satisfaction are our top priorities.</p>
    <a href="#services-section" class="cta-button">Get Started</a>
</section>

<!-- Main Content -->
<main>
    <h2 id="services-section" class="services-title">Our Reservation Services</h2>

    <div class="services-grid">
        <div class="service-card">
            <h3>🏨 Create New Booking</h3>
            <p>Book your next luxurious stay with us in just a few clicks. Choose from our premium rooms and suites.</p>
            <a href="reservationadd.jsp" class="service-button">Book Now</a>
        </div>

        <div class="service-card">
            <h3>📋 Manage Bookings</h3>
            <p>View, modify, or cancel your existing reservations with our intuitive management system.</p>
            <a href="reservationdisplay" class="service-button">View Bookings</a>
        </div>

        <div class="service-card">
            <h3>📊 Analytics Dashboard</h3>
            <p>Access comprehensive reports and statistics about your bookings and reservation history.</p>
            <a href="reports.jsp" class="service-button">View Reports</a>
        </div>
    </div>
</main>

</body>
</html>