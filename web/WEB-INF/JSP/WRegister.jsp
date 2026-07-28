<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Worker Registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WNavBar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/WRegister.css">
</head>

<body>
    <%@include file="WNavBar.jsp" %>

    <% String error = request.getParameter("error"); %>

    <div class="register-wrapper">
        <div class="register-card">

            <h2 class="register-title">Create Worker Account</h2>
            <p class="register-subtitle">Fill in your details to get started on Smart Job Portal</p>

            <% if (error != null) { %>
            <div class="register-alert">
                <% if ("email".equals(error)) { %>
                    Email already registered!
                <% } else if ("phone".equals(error)) { %>
                    Phone already registered!
                <% } else if ("account".equals(error)) { %>
                    Account already exists!
                <% } else if ("server".equals(error)) { %>
                    Something went wrong. Please try again!
                <% } %>
            </div>
            <% } %>

            <form action="wregistermodel" method="post" enctype="multipart/form-data" id="register-form">

                <%-- ===================== Personal Information ===================== --%>
                <p class="register-section-title">Personal Information</p>

                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" name="name" id="name" required placeholder="Enter your full name">
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" name="phone" id="phone" required maxlength="10" placeholder="10-digit mobile number">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" required placeholder="you@example.com">
                    </div>
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <div class="chip-group">
                        <label class="chip-label">
                            <input type="radio" name="gender" id="male" value="Male" required>
                            <span>Male</span>
                        </label>
                        <label class="chip-label">
                            <input type="radio" name="gender" id="female" value="Female">
                            <span>Female</span>
                        </label>
                        <label class="chip-label">
                            <input type="radio" name="gender" id="other" value="Other">
                            <span>Other</span>
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="dob">Date of Birth</label>
                    <input type="date" name="dob" id="dob" required>
                </div>

                <%-- ===================== Identity Verification ===================== --%>
                <p class="register-section-title">Identity Verification</p>

                <div class="form-row">
                    <div class="form-group">
                        <label for="idcard-front">ID Card — Front</label>
                        <div class="upload-box" data-preview-target="preview-front">
                            <input type="file" name="idcard_front" id="idcard-front" accept="image/*" required>
                            <div class="upload-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
                                <span>Click to upload front side</span>
                            </div>
                            <img class="upload-preview" id="preview-front" alt="ID front preview" hidden>
                        </div>
                        <span class="field-hint">JPG or PNG, max 5MB</span>
                    </div>

                    <div class="form-group">
                        <label for="idcard-back">ID Card — Back</label>
                        <div class="upload-box" data-preview-target="preview-back">
                            <input type="file" name="idcard_back" id="idcard-back" accept="image/*" required>
                            <div class="upload-placeholder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
                                <span>Click to upload back side</span>
                            </div>
                            <img class="upload-preview" id="preview-back" alt="ID back preview" hidden>
                        </div>
                        <span class="field-hint">JPG or PNG, max 5MB</span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="profile-pic">Profile Picture</label>
                    <div class="upload-box upload-box-avatar" data-preview-target="preview-avatar">
                        <input type="file" name="profile_pic" id="profile-pic" accept="image/*" required>
                        <div class="upload-placeholder">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="4"/><path d="M6 21v-2a4 4 0 0 1 4-4h4a4 4 0 0 1 4 4v2"/></svg>
                            <span>Click to upload a clear headshot</span>
                        </div>
                        <img class="upload-preview" id="preview-avatar" alt="Profile picture preview" hidden>
                    </div>
                    <span class="field-hint">JPG or PNG, max 5MB</span>
                </div>

                <%-- ===================== Account Security ===================== --%>
                <p class="register-section-title">Account Security</p>

                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="pass-wrapper">
                            <input type="password" name="password" id="password" required placeholder="Create a password" minlength="8">
                            <button class="eye-btn" type="button" data-target="password">👁</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="confirm-password">Confirm Password</label>
                        <div class="pass-wrapper">
                            <input type="password" id="confirm-password" required placeholder="Re-enter your password" minlength="8">
                            <button class="eye-btn" type="button" data-target="confirm-password">👁</button>
                        </div>
                    </div>
                </div>
                <span class="field-hint" id="password-match-hint"></span>

                <%-- ===================== Address ===================== --%>
                <fieldset class="address-fieldset">
                    <legend class="register-section-title">Address</legend>

                    <div class="form-group">
                        <label for="street">Street Address</label>
                        <input type="text" name="street" id="street" placeholder="House no., street name" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="city">City</label>
                            <input type="text" name="city" id="city" required placeholder="Enter city">
                        </div>
                        <div class="form-group">
                            <label for="state">State / Province</label>
                            <input type="text" name="state" id="state" required placeholder="Enter state">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="zip">PIN / ZIP Code</label>
                            <input type="tel" name="zip" id="zip" required maxlength="6" placeholder="6-digit code">
                        </div>
                        <div class="form-group">
                            <label for="country">Country</label>
                            <select id="country" name="country" required>
                                <option disabled selected>Select country</option>
                                <option value="IN">India</option>
                                <option value="US">United States</option>
                                <!-- more countries -->
                            </select>
                        </div>
                    </div>
                </fieldset>

                <input class="register-submit-btn" type="submit" id="submit" value="Create Account">
            </form>

            <p class="register-login-link">
                Already have an account? <a href="WLogin">Login</a>
            </p>

        </div>
    </div>

    <script>
        // Password show/hide toggle (shared by password + confirm password)
        document.querySelectorAll('.eye-btn').forEach(function (btn) {
            btn.addEventListener('click', function () {
                var input = document.getElementById(btn.dataset.target);
                input.type = input.type === 'password' ? 'text' : 'password';
            });
        });

        // Live password-match feedback
        var pw = document.getElementById('password');
        var confirmPw = document.getElementById('confirm-password');
        var matchHint = document.getElementById('password-match-hint');

        function checkPasswordMatch() {
            if (!confirmPw.value) {
                matchHint.textContent = '';
                matchHint.className = 'field-hint';
                return true;
            }
            var matches = pw.value === confirmPw.value;
            matchHint.textContent = matches ? 'Passwords match.' : 'Passwords do not match.';
            matchHint.className = matches ? 'field-hint success' : 'field-hint error';
            return matches;
        }

        pw.addEventListener('input', checkPasswordMatch);
        confirmPw.addEventListener('input', checkPasswordMatch);

        document.getElementById('register-form').addEventListener('submit', function (e) {
            if (!checkPasswordMatch()) {
                e.preventDefault();
                confirmPw.focus();
            }
        });

        // File preview thumbnails
        document.querySelectorAll('.upload-box').forEach(function (box) {
            var input = box.querySelector('input[type="file"]');
            var placeholder = box.querySelector('.upload-placeholder');
            var preview = document.getElementById(box.dataset.previewTarget);

            input.addEventListener('change', function () {
                var file = input.files[0];
                if (!file) return;
                var reader = new FileReader();
                reader.onload = function (e) {
                    preview.src = e.target.result;
                    preview.hidden = false;
                    placeholder.hidden = true;
                };
                reader.readAsDataURL(file);
            });
        });
    </script>
</body>

</html>