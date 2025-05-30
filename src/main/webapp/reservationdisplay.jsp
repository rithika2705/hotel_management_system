<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>View Reservations | Luxe Stays</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8fafc;
            color: #374151;
            padding: 2rem 1rem;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 2.5rem 2rem;
            margin-bottom: 2rem;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.2);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/><circle cx="50" cy="10" r="1" fill="white" opacity="0.05"/><circle cx="10" cy="90" r="1" fill="white" opacity="0.05"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
            pointer-events: none;
        }

        .header h1 {
            color: white;
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
            position: relative;
            z-index: 1;
        }

        .header p {
            color: rgba(255, 255, 255, 0.9);
            font-size: 1.1rem;
            position: relative;
            z-index: 1;
        }

        .actions-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .add-btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .add-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        }

        .back-home {
            color: #6b7280;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .back-home:hover {
            color: #374151;
        }

        .back-home::before {
            content: '← ';
            margin-right: 0.5rem;
        }

        .table-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            overflow-x: auto;
            border: 1px solid #f1f5f9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
            padding: 1.25rem 1rem;
            text-align: left;
            font-weight: 600;
            color: #475569;
            border-bottom: 2px solid #e2e8f0;
            white-space: nowrap;
            font-size: 0.875rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        td {
            padding: 1.25rem 1rem;
            border-bottom: 1px solid #f8fafc;
            vertical-align: middle;
            transition: background-color 0.2s ease;
        }

        tr:hover {
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
        }

        tr:nth-child(even) {
            background-color: #fdfdfd;
        }

        .reservation-id {
            font-weight: 700;
            color: #667eea;
            font-size: 0.95rem;
        }

        .customer-name {
            font-weight: 600;
            color: #1e293b;
        }

        .room-number {
            background: linear-gradient(135deg, #ddd6fe, #c4b5fd);
            color: #6d28d9;
            padding: 0.375rem 0.75rem;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.875rem;
            display: inline-block;
        }

        .amount {
            font-weight: 700;
            color: #059669;
            font-size: 1rem;
        }

        .date-cell {
            color: #64748b;
            font-weight: 500;
        }

        .actions {
            display: flex;
            gap: 0.75rem;
            flex-wrap: wrap;
        }

        .action-btn {
            padding: 0.375rem 0.75rem;
            border-radius: 6px;
            text-decoration: none;
            font-size: 0.875rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .update-btn {
            background-color: #dbeafe;
            color: #1d4ed8;
        }

        .update-btn:hover {
            background-color: #bfdbfe;
        }

        .delete-btn {
            background-color: #fee2e2;
            color: #dc2626;
        }

        .delete-btn:hover {
            background-color: #fecaca;
        }

        .no-data {
            text-align: center;
            padding: 3rem;
            color: #9ca3af;
            font-style: italic;
        }

        .stats-bar {
            background: white;
            padding: 2rem;
            margin-bottom: 2rem;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            display: flex;
            justify-content: center;
            gap: 3rem;
            flex-wrap: wrap;
            border: 1px solid #f1f5f9;
        }

        .stat-item {
            text-align: center;
            padding: 1rem;
            border-radius: 12px;
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
            min-width: 120px;
            transition: transform 0.2s ease;
        }

        .stat-item:hover {
            transform: translateY(-2px);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 800;
            color: #667eea;
            display: block;
        }

        .stat-label {
            font-size: 0.875rem;
            color: #64748b;
            margin-top: 0.5rem;
            font-weight: 500;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            body {
                padding: 1rem 0.5rem;
            }

            .header {
                padding: 1.5rem;
            }

            .header h1 {
                font-size: 1.5rem;
            }

            .actions-bar {
                flex-direction: column;
                align-items: stretch;
                text-align: center;
            }

            .stats-bar {
                padding: 1rem;
                gap: 1rem;
            }

            th, td {
                padding: 0.75rem 0.5rem;
                font-size: 0.875rem;
            }

            .actions {
                flex-direction: column;
                gap: 0.5rem;
            }

            .action-btn {
                text-align: center;
            }
        }

        @media (max-width: 640px) {
            .table-container {
                margin: 0 -0.5rem;
                border-radius: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Current Reservations</h1>
            <p>Manage all your hotel bookings in one place</p>
        </div>

        <% 
        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
        int totalReservations = (reservations != null) ? reservations.size() : 0;
        %>

        <div class="stats-bar">
            <div class="stat-item">
                <div class="stat-number"><%= totalReservations %></div>
                <div class="stat-label">Total Reservations</div>
            </div>
        </div>

        <div class="actions-bar">
            <a href="reservationadd.jsp" class="add-btn">+ Add New Reservation</a>
            <a href="index.jsp" class="back-home">Back to Home</a>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Reservation ID</th>
                        <th>Customer Name</th>
                        <th>Room Number</th>
                        <th>Check-In Date</th>
                        <th>Check-Out Date</th>
                        <th>Total Amount</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <% 
                if (reservations != null && !reservations.isEmpty()) {
                    for (Reservation reservation : reservations) { 
                %>
                    <tr>
                        <td class="reservation-id">#<%= reservation.getReservationId() %></td>
                        <td class="customer-name"><%= reservation.getCustomerName() %></td>
                        <td><span class="room-number"><%= reservation.getRoomNumber() %></span></td>
                        <td class="date-cell"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckIn()) %></td>
                        <td class="date-cell"><%= new java.text.SimpleDateFormat("MMM dd, yyyy").format(reservation.getCheckOut()) %></td>
                        <td class="amount">$<%= String.format("%.2f", reservation.getTotalAmount()) %></td>
                        <td class="actions">
                            <a href="reservationupdate.jsp?id=<%= reservation.getReservationId() %>" class="action-btn update-btn">✏️ Update</a>
                            <a href="reservationdelete.jsp?id=<%= reservation.getReservationId() %>" class="action-btn delete-btn" >🗑️ Delete</a>
                        </td>
                    </tr>
                <% 
                    }
                } else { 
                %>
                    <tr>
                        <td colspan="7" class="no-data">
                            No reservations found. <a href="reservationadd.jsp" style="color: #3b82f6;">Create your first reservation</a>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>