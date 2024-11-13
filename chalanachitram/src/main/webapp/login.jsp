<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Chalana Chitram</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Same CSS as in your register.jsp -->
     <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

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
            display: flex;
            flex-direction: column;
        }

        .header {
            background: rgba(0, 0, 0, 0.9);
            padding: 1rem 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
        }

        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 2rem;
        }

        .logo {
            color: var(--primary-color);
            font-size: 2rem;
            font-weight: bold;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: all 0.3s ease;
        }

        .logo:hover {
            color: var(--accent-color);
            transform: scale(1.05);
        }

        .register-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 8rem 2rem 4rem;
        }

        .register-box {
            background: rgba(255, 255, 255, 0.1);
            padding: 3rem;
            border-radius: 20px;
            width: 100%;
            max-width: 500px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        .register-title {
            text-align: center;
            margin-bottom: 2.5rem;
            color: var(--accent-color);
            font-size: 2.2rem;
            font-weight: 600;
        }

        .input-group {
            margin-bottom: 2rem;
            position: relative;
        }

        .input-group label {
            display: block;
            margin-bottom: 0.8rem;
            color: #fff;
            font-size: 1.1rem;
        }

        .input-group input {
            width: 100%;
            padding: 1rem 1.5rem;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 25px;
            background: rgba(255, 255, 255, 0.05);
            color: white;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .input-group input:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 10px rgba(225, 27, 27, 0.3);
        }

        .input-group i {
            position: absolute;
            right: 1.5rem;
            top: 3.2rem;
            color: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .input-group i:hover {
            color: var(--accent-color);
        }

        .password-requirements {
            font-size: 0.9rem;
            color: #ccc;
            margin-top: 0.5rem;
            padding-left: 1rem;
        }

        .password-requirements ul {
            list-style-type: none;
            margin-top: 0.5rem;
        }

        .password-requirements li {
            margin-bottom: 0.3rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .password-requirements li i {
            position: static;
            font-size: 0.8rem;
        }

        .register-btn {
            width: 100%;
            padding: 1rem;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
        }

        .register-btn:hover {
            background: #ff2b2b;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(225, 27, 27, 0.3);
        }

        .login-link {
            text-align: center;
            color: #ccc;
        }

        .login-link a {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .login-link a:hover {
            color: var(--primary-color);
        }

        .error-message {
            background: rgba(255, 0, 0, 0.1);
            border-left: 4px solid var(--primary-color);
            padding: 1rem;
            margin-bottom: 2rem;
            border-radius: 0 10px 10px 0;
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .error-message i {
            color: var(--primary-color);
            font-size: 1.2rem;
        }

        .footer {
            background: rgba(0, 0, 0, 0.95);
            padding: 2rem 0;
            margin-top: auto;
        }

        .footer-content {
            max-width: 1400px;
            margin: 0 auto;
            text-align: center;
            color: #888;
        }

        @media (max-width: 768px) {
            .register-box {
                padding: 2rem;
                margin: 1rem;
            }

            .nav-container {
                padding: 0 1rem;
            }

            .logo {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <nav class="nav-container">
            <a href="index.jsp" class="logo">Chalana Chitram</a>
        </nav>
    </header>

    <main class="login-container">
        <div class="login-box">
            <h2 class="login-title">Login</h2>
            <% 
                String errorMessage = (String) request.getAttribute("error");
                if (errorMessage != null) {
            %>
                <div class="error-message">
                    <i class="fas fa-exclamation-circle"></i>
                    <%= errorMessage %>
                </div>
            <% } %>
            <!-- Updated form action -->
            <form action="login" method="post">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                    <i class="fas fa-user"></i>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="remember-forgot">
                    <div class="remember-me">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Remember me</label>
                    </div>
                    <a href="forgot-password" class="forgot-password">Forgot Password?</a>
                </div>
                <button type="submit" class="login-btn">Login</button>
                <div class="register-link">
                    Don't have an account? <a href="register">Register Now</a>
                </div>
            </form>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-content">
            <p>&copy; 2024 Chalana Chitram. All rights reserved.</p>
        </div>
    </footer>

     <script>
        function togglePassword(inputId, icon) {
            const input = document.getElementById(inputId);
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            }
        }

        function validatePassword(password) {
            const requirements = {
                length: password.length >= 8,
                uppercase: /[A-Z]/.test(password),
                lowercase: /[a-z]/.test(password),
                number: /[0-9]/.test(password),
                special: /[!@#$%^&*(),.?":{}|<>]/.test(password)
            };

            for (const [requirement, met] of Object.entries(requirements)) {
                const element = document.getElementById(requirement);
                const icon = element.querySelector('i');
                if (met) {
                    icon.classList.remove('fa-times');
                    icon.classList.add('fa-check');
                    icon.style.color = '#28a745';
                } else {
                    icon.classList.remove('fa-check');
                    icon.classList.add('fa-times');
                    icon.style.color = '#dc3545';
                }
            }

            return Object.values(requirements).every(Boolean);
        }

        function validateForm() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (!validatePassword(password)) {
                alert('Please ensure your password meets all requirements.');
                return false;
            }

            if (password !== confirmPassword) {
                alert('Passwords do not match.');
                return false;
            }

            return true;
        }

        // Live password validation
        document.getElementById('password').addEventListener('input', function() {
            validatePassword(this.value);
        });

        // Add header shadow on scroll
        window.addEventListener('scroll', function() {
            const header = document.querySelector('.header');
            if (window.scrollY > 0) {
                header.style.boxShadow = '0 2px 10px rgba(0,0,0,0.3)';
            } else {
                header.style.boxShadow = 'none';
            }
        });
    </script>
</body>
</html>