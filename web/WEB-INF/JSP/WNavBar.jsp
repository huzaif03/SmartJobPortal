<%-- 
    Document   : NavBar
    Created on : 06-Jul-2026, 6:39:02 pm
    Author     : huzaif
--%>
<% HttpSession navSession = request.getSession(false);
                boolean isWorkerLoggedIn = (navSession != null && navSession.getAttribute("w_id") != null);
%>
<nav class="nav-bar">
        <div class="logo">
            <a href="whomemodel">
                <div class="svg-logo">
                    <img src="${pageContext.request.contextPath}/Logo/logo_svg.svg" alt="S">
                </div>
                <h1>Smart Job Portal</h1>
            </a>
        </div>
        <div class="middle"></div>
        <div class="left">
            <%if(isWorkerLoggedIn){%>
                <div class="home">
                   <a href="whomemodel" class="active-home">Home</a>
                </div>
             <% } else { %>
                <div class="home">
                    <a href="WLogin">Home</a>
                </div>
             <% } %>
            <%if(isWorkerLoggedIn){%>
                <div class="notification active">
                    <a href="wnotificationmodel" class="active-notification">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg>
                        <span>Notification</span>
                        <i class="notif-dot"></i>
                    </a>
                </div>
            <% }else { %>
                    <div class="notification">
                        <a href="WLogin">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg>
                            <span>Notification</span>
                        </a>
                    </div>
            <% }%>
            <div class="contact">Contact Us</div>
            <%if(isWorkerLoggedIn){%>
                <div class="profile">
                    <a href="wmyprofilemodel" class="active-profile">
                        My Profile
                    </a>
                </div>
            <% } %>
            <% if (isWorkerLoggedIn) { %>
            <div class="logout">
                <a href="wlogoutmodel">Logout</a>
            </div>
            <% } else { %>
            <div class="logout">
                <a href="WLogin">Login</a>
            </div>
            <%}%>
        </div>
    </nav>            
            <%--
<!--<nav class="nav-outer">
    <div class="nav-bar">
        <div class="logo">
            <a href="WHome">
                <h1>Smart Job Portal</h1>
            </a>
        </div>
        <div class="middle"></div>
        <div class="left">
            <div class="home">Home</div>
            <%if(isWorkerLoggedIn){%>
                <div class="status"><a href="wnotificationmodel">Notification</a></div>
            <%}else if(isEmployerLoggedIn){ %>
                    <div class="status"><a href="ehireworkerstatusmodel">Status</a></div>
            <% }else { %>
                    <div class="status"><a href="WLogin">Status</a></div>
            <% }%>
            <div class="contact">Contact Us</div>
            
            <% if (isWorkerLoggedIn) { %>
            <div class="logout">
                <a href="wlogoutmodel">Logout</a>
            </div>
            <% } else if (isEmployerLoggedIn) { %>
            <div class="logout">
                <a href="elogoutmodel">Logout</a>
            </div>
            <% } else { %>
            <div class="logout">
                <a href="WLogin">Login</a>
            </div>
            <%}%>
        </div>
    </div>
</nav>--> --%>