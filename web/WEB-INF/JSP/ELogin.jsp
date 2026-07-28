<%-- 
    Document   : ELogin
    Created on : 07-May-2026, 1:21:24 pm
    Author     : huzaif
--%>
<% String msg = (String) request.getAttribute("error");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELogin</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/ELogin.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/ENavBar.css">
    </head>
    <body>
        <div class="outer">
            <%@include file="ENavBar.jsp" %>
            <div class="content">
                <div class="container-detail">
                    <h1>Employer Login </h1>
                    <h1 id="icon"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pickaxe-icon lucide-pickaxe"><path d="m14 13-8.381 8.38a1 1 0 0 1-3.001-3L11 9.999"/><path d="M15.973 4.027A13 13 0 0 0 5.902 2.373c-1.398.342-1.092 2.158.277 2.601a19.9 19.9 0 0 1 5.822 3.024"/><path d="M16.001 11.999a19.9 19.9 0 0 1 3.024 5.824c.444 1.369 2.26 1.676 2.603.278A13 13 0 0 0 20 8.069"/><path d="M18.352 3.352a1.205 1.205 0 0 0-1.704 0l-5.296 5.296a1.205 1.205 0 0 0 0 1.704l2.296 2.296a1.205 1.205 0 0 0 1.704 0l5.296-5.296a1.205 1.205 0 0 0 0-1.704z"/></svg></h1>
                </div>
                <div class="container">
                    <div class="msg"><%= msg != null ? msg : "" %></div>
                    <div class="toggle-btn">
                        <div class="btn">
                            <a href="WLogin">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                                <span>Worker</span>
                            </a>
                        </div>
                        <div class="btn active">
                            <a href="ELogin">
                                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 20V4a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/><rect width="20" height="14" x="2" y="6" rx="2"/></svg>
                                <span>Employer</span>
                            </a>
                        </div>
                    </div>
                    <div class="form">
                        <form action="eloginmodel" method="post">
                            <div class="form-group">
                                <label for="username">Email or Mobile No. :- </label><br>
                                <input type="text" id="username" name="username" placeholder="Enter Email or Mobile">
                            </div>
                            <div class="form-group">
                                <label for="password">Password :- </label><br>
                                <div class="pass-wrapper">
                                    <input type="password" id="password" name="password" placeholder="Enter password">
                                    <button class="login-eye-btn" type="button" onclick="togglePass()">👁</button>
                                </div>
                            </div>
                            <div class="form-submit">
                                <input type="submit" value="Login" id="submit">
                            </div>
                        </form>
                    </div>
                    <div class="register-link">
                        <p>Don't have an account?
                            <a href="ERegister">Register</a>
                        </p>
                    </div>
                </div>
            </div>
            <script>
                function togglePass() {
                    var input = document.getElementById('password');
                    input.type = input.type === 'password' ? 'text' : 'password';
                }
            </script>
        </div>
    </body>
</html>