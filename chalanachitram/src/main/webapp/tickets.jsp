<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tickets Confirmed - Chalana Chitram</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #e11b1b;
            --secondary-color: #1a1a1a;
            --accent-color: #ffd700;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1a1a1a 0%, #2d2d2d 100%);
            color: white;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 4rem auto;
            padding: 2rem;
        }

        .success-header {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeInDown 0.8s ease;
        }

        .success-header i {
            font-size: 4rem;
            color: #4CAF50;
            margin-bottom: 1rem;
        }

        .success-header h1 {
            color: var(--accent-color);
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .ticket-container {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            overflow: hidden;
            margin-bottom: 2rem;
            animation: fadeIn 1s ease;
            position: relative;
        }

        .ticket-header {
            background: var(--primary-color);
            padding: 1.5rem;
            text-align: center;
        }

        .ticket-header h2 {
            margin: 0;
            color: white;
            font-size: 1.8rem;
        }

        .ticket-body {
            padding: 2rem;
            position: relative;
        }

        .ticket-info {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .info-item label {
            color: var(--accent-color);
            font-size: 0.9rem;
            text-transform: uppercase;
        }

        .info-item span {
            font-size: 1.1rem;
            color: white;
        }

        .ticket-footer {
            border-top: 1px dashed rgba(255, 255, 255, 0.1);
            padding-top: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .qr-code {
            background: white;
            padding: 1rem;
            border-radius: 8px;
            width: 100px;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .booking-id {
            font-family: monospace;
            font-size: 1.2rem;
            color: var(--accent-color);
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .action-button {
            flex: 1;
            padding: 1rem;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .download-button {
            background: var(--accent-color);
            color: var(--secondary-color);
        }

        .share-button {
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }

        .action-button:hover {
            transform: translateY(-2px);
        }

        .ticket-decoration {
            position: absolute;
            width: 20px;
            height: 20px;
            background: var(--secondary-color);
            border-radius: 50%;
        }

        .decoration-left {
            left: -10px;
            top: 50%;
            transform: translateY(-50%);
        }

        .decoration-right {
            right: -10px;
            top: 50%;
            transform: translateY(-50%);
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .ticket-info {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-header">
            <i class="fas fa-check-circle"></i>
            <h1>Booking Confirmed!</h1>
            <p>Your tickets have been booked successfully</p>
        </div>

        <div class="ticket-container">
            <div class="ticket-header">
                <h2><%= request.getParameter("movie") %></h2>
            </div>
            <div class="ticket-body">
                <div class="ticket-decoration decoration-left"></div>
                <div class="ticket-decoration decoration-right"></div>
                
                <div class="ticket-info">
                    <div class="info-item">
                        <label>Theater</label>
                        <span><%= request.getParameter("theater") %></span>
                    </div>
                    <div class="info-item">
                        <label>Show Time</label>
                        <span><%= request.getParameter("time") %></span>
                    </div>
                    <div class="info-item">
                        <label>Seats</label>
                        <span><%= request.getParameter("seats") %></span>
                    </div>
                    <div class="info-item">
                        <label>Total Amount</label>
                        <span>₹<%= request.getParameter("seats").split(",").length * 250 %></span>
                    </div>
                </div>

                <div class="ticket-footer">
                    <div class="booking-id">
                        Booking ID: CC<%= System.currentTimeMillis() % 100000000 %>
                    </div>
                    <div class="qr-code">
                        <img src="https://api.qrserver.com/v1/create-qr-code/?size=100x100&data=CC<%= System.currentTimeMillis() %>" 
                             alt="QR Code">
                    </div>
                </div>
            </div>
        </div>

        <div class="action-buttons">
            <button class="action-button download-button">
                <i class="fas fa-download"></i>
                Download Ticket
            </button>
            <button class="action-button share-button">
                <i class="fas fa-share-alt"></i>
                Share
            </button>
        </div>
    </div>

    <script>
        // Download ticket functionality
        document.querySelector('.download-button').addEventListener('click', () => {
            window.print();
        });

        // Share functionality
        document.querySelector('.share-button').addEventListener('click', () => {
            if (navigator.share) {
                navigator.share({
                    title: 'Movie Tickets',
                    text: 'Check out my movie tickets for <%= request.getParameter("movie") %>!',
                    url: window.location.href
                });
            }
        });
    </script>
</body>
</html>