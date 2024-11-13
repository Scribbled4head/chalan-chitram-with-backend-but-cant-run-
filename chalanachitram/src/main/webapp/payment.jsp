<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Chalana Chitram</title>
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
            max-width: 1000px;
            margin: 4rem auto;
            padding: 2rem;
        }

        .payment-header {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeInDown 0.8s ease;
        }

        .payment-header h1 {
            color: var(--accent-color);
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .payment-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            animation: fadeIn 1s ease;
        }

        .booking-summary, .payment-form {
            background: rgba(255, 255, 255, 0.05);
            padding: 2rem;
            border-radius: 15px;
            backdrop-filter: blur(10px);
        }

        .booking-summary h2, .payment-form h2 {
            color: var(--accent-color);
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            padding: 0.5rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .summary-item:last-child {
            border-bottom: none;
            font-weight: bold;
        }

        .payment-form form {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            color: #ccc;
            font-size: 0.9rem;
        }

        .form-group input {
            padding: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.05);
            color: white;
            font-size: 1rem;
        }

        .card-details {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            gap: 1rem;
        }

        .pay-button {
            background: var(--primary-color);
            color: white;
            padding: 1rem;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
        }

        .pay-button:hover {
            background: #ff2b2b;
            transform: translateY(-2px);
        }

        .payment-methods {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .payment-method {
            padding: 1rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            flex: 1;
            text-align: center;
        }

        .payment-method.active {
            border-color: var(--accent-color);
            background: rgba(255, 215, 0, 0.1);
        }

        .payment-method i {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: var(--accent-color);
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

            .payment-grid {
                grid-template-columns: 1fr;
            }

            .card-details {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="payment-header">
            <h1>Complete Your Payment</h1>
            <p>Secure payment gateway</p>
        </div>

        <div class="payment-grid">
            <div class="booking-summary">
                <h2>Booking Summary</h2>
                <div class="summary-item">
                    <span>Movie</span>
                    <span><%= request.getParameter("movie") %></span>
                </div>
                <div class="summary-item">
                    <span>Theater</span>
                    <span><%= request.getParameter("theater") %></span>
                </div>
                <div class="summary-item">
                    <span>Show Time</span>
                    <span><%= request.getParameter("time") %></span>
                </div>
                <div class="summary-item">
                    <span>Seats</span>
                    <span><%= request.getParameter("seats") %></span>
                </div>
                <div class="summary-item">
                    <span>Price per Ticket</span>
                    <span>₹250</span>
                </div>
                <div class="summary-item">
                    <span>Total Amount</span>
                    <span>₹<%= request.getParameter("seats").split(",").length * 250 %></span>
                </div>
            </div>

            <div class="payment-form">
                <h2>Payment Details</h2>
                <div class="payment-methods">
                    <div class="payment-method active">
                        <i class="fas fa-credit-card"></i>
                        <div>Credit Card</div>
                    </div>
                    <div class="payment-method">
                        <i class="fas fa-university"></i>
                        <div>Net Banking</div>
                    </div>
                    <div class="payment-method">
                        <i class="fas fa-wallet"></i>
                        <div>UPI</div>
                    </div>
                </div>
                <form action="tickets.jsp" method="POST">
                    <input type="hidden" name="movie" value="<%= request.getParameter("movie") %>">
                    <input type="hidden" name="theater" value="<%= request.getParameter("theater") %>">
                    <input type="hidden" name="time" value="<%= request.getParameter("time") %>">
                    <input type="hidden" name="seats" value="<%= request.getParameter("seats") %>">
                    
                    <div class="form-group">
                        <label>Card Holder Name</label>
                        <input type="text" required placeholder="Enter card holder name">
                    </div>
                    
                    <div class="form-group">
                        <label>Card Number</label>
                        <input type="text" required placeholder="1234 5678 9012 3456" maxlength="19">
                    </div>
                    
                    <div class="card-details">
                        <div class="form-group">
                            <label>Expiry Date</label>
                            <input type="text" required placeholder="MM/YY" maxlength="5">
                        </div>
                        <div class="form-group">
                            <label>CVV</label>
                            <input type="password" required placeholder="***" maxlength="3">
                        </div>
                    </div>
                    
                    <button type="submit" class="pay-button">
                        Pay ₹<%= request.getParameter("seats").split(",").length * 250 %>
                    </button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Payment method selection
        const paymentMethods = document.querySelectorAll('.payment-method');
        paymentMethods.forEach(method => {
            method.addEventListener('click', () => {
                paymentMethods.forEach(m => m.classList.remove('active'));
                method.classList.add('active');
            });
        });

        // Format card number input
        const cardInput = document.querySelector('input[placeholder="1234 5678 9012 3456"]');
        cardInput.addEventListener('input', (e) => {
            let value = e.target.value.replace(/\s/g, '');
            if (value.length > 0) {
                value = value.match(new RegExp('.{1,4}', 'g')).join(' ');
            }
            e.target.value = value;
        });

        // Format expiry date input
        const expiryInput = document.querySelector('input[placeholder="MM/YY"]');
        expiryInput.addEventListener('input', (e) => {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length > 2) {
                value = value.slice(0, 2) + '/' + value.slice(2);
            }
            e.target.value = value;
        });
    </script>
</body>
</html>