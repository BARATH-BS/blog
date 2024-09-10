<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="blog.edidgrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login/Signup</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat|Quicksand');

        * {
            font-family: 'Quicksand', Arial, Helvetica, sans-serif;
            box-sizing: border-box;
        }

        body {
            background: #fff;
        }

        .form-modal {
            position: relative;
            width: 450px;
            height: auto;
            margin-top: 4em;
            left: 50%;
            transform: translateX(-50%);
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 3px 20px 0 rgba(0, 0, 0, 0.1);
        }

        .form-modal button {
            cursor: pointer;
            position: relative;
            text-transform: capitalize;
            font-size: 1em;
            z-index: 2;
            outline: none;
            background: #fff;
            transition: 0.2s;
        }

        .form-modal .btn {
            border-radius: 20px;
            border: none;
            font-weight: bold;
            font-size: 1.2em;
            padding: 0.8em 1em;
            transition: 0.5s;
            border: 1px solid #ebebeb;
            margin: 0.5em 0;
        }

        .form-modal .login, .form-modal .signup {
            border: 1px solid#57b846;
            color: #57b846;
        }

        .form-modal .login:hover, .form-modal .signup:hover {
            background: #222;
        }

        .form-toggle {
            position: relative;
            width: 100%;
            height: auto;
        }

        .form-toggle button {
            width: 50%;
            float: left;
            padding: 1.5em;
            margin-bottom: 1.5em;
            border: none;
            transition: 0.2s;
            font-size: 1.1em;
            font-weight: bold;
            border-radius: 20px;
        }

        #login-toggle {
            background: #57b846;
            color: #fff;
        }

        .form-modal form {
            position: relative;
            width: 90%;
            left: 50%;
            transform: translateX(-50%);
        }

        #login-form, #signup-form {
            position: relative;
            width: 100%;
            height: auto;
            padding-bottom: 1em;
        }

        #signup-form {
            display: none;
        }

        #login-form input, #signup-form input {
            position: relative;
            width: 100%;
            font-size: 1em;
            padding: 1.2em 1.7em;
            margin: 0.6em 0;
            border-radius: 20px;
            border: none;
            background: #ebebeb;
            outline: none;
            font-weight: bold;
            transition: 0.4s;
        }

        #login-form input:focus, #signup-form input:focus {
            transform: scaleX(1.02);
        }

        .form-modal p {
            font-size: 16px;
            font-weight: bold;
        }

        .form-modal p a {
            color: #57b846;
            text-decoration: none;
            transition: 0.2s;
        }

        .form-modal p a:hover {
            color: #222;
        }
        .disable {
            cursor: not-allowed;
            pointer-events: none;
            background-color: #f5e3e3 !important;
            color: #f14a4a !important;
            border: 1px solid rgb(238, 135, 135) !important;
        }
        .d-none {
            display: none;
        }
        .error { color: red; }
        .valid { color: green; }
        .form-modal i {
            position: absolute;
            left: 10%;
            top: 50%;
            transform: translateX(-10%) translateY(-50%);
        }

        .fa-google {
            color: #dd4b39;
        }

        .fa-linkedin {
            color: #0077b5;
        }

        .fa-windows {
            color: #0078d4;
        }

        .-box-sd-effect:hover {
            box-shadow: 0 4px 8px hsla(210, 2%, 84%, .2);
        }

        @media only screen and (max-width: 500px) {
            .form-modal {
                width: 100%;
            }
        }

        @media only screen and (max-width: 400px) {
            i {
                display: none !important;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="form-modal">
            <div class="form-toggle">
                <button type="button" id="login-toggle" onclick="toggleLogin()">Log In</button>
                <button type="button" id="signup-toggle" onclick="toggleSignup()">Sign Up</button>
            </div>

            <div id="login-form">
                <input type="text" placeholder="Enter userid" runat="server" id="user" />
                <input type="password" placeholder="Enter password" runat="server" id="pass" />
                <asp:Button CssClass="btn login" Text="Login" runat="server" ID="btnlogin" OnClick="btnlogin_Click"></asp:Button>
                <hr />
            </div>

            <div id="signup-form">
                <input type="text" placeholder="Enter your Username" runat="server" id="Username" onkeyup="validateUsername()" />
                <div id="usernameError" class="error"></div>

                <input type="text" placeholder="Choose email" runat="server" id="email" onkeyup="validateEmail()" />
                <div id="emailError" class="error"></div>

                <input type="password" placeholder="Create password" runat="server" id="Password" onkeyup="validatePassword()" />
                <div id="passwordError" class="error"></div>

                <input type="text" placeholder="Choose Userid" runat="server" id="Userid" onkeyup="validateUserid()" />
                <div id="useridError" class="error"></div>

                <input type="text" placeholder="Choose Department" runat="server" id="Department" onkeyup="validateDepartment()" />
                <div id="departmentError" class="error"></div>

                <input type="text" placeholder="Choose Mobile No" runat="server" id="moblnum" onkeyup="validateMobile()" />
                <div id="mobileError" class="error"></div>

                <button class="btn signup disable" id="wrapper_reg" onclick="validateInputs()" style="width: 100%;">Create account</button>

                <asp:Button CssClass="btn signup d-none" Text="Create Account" runat="server" ID="reg" OnClick="reg_Click"></asp:Button>
                <hr />
            </div>
        </div>

        <script>
            function validateUsername(dispError = true, validateAll = true) {
                const username = document.getElementById('Username').value;
                const usernameError = document.getElementById('usernameError');
                if (username.length < 3) {
                    if(dispError) {
                        usernameError.textContent = "Username must be at least 3 characters long.";
                    }
                    if(validateAll) validateInputs(false, false);
                    return false;
                } else {
                    usernameError.textContent = "";
                    if(validateAll) validateInputs(false, false);
                    return true;
                }

            }

            function validateEmail(dispError = true, validateAll = true) {
                const email = document.getElementById('email').value;
                const emailError = document.getElementById('emailError');
                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(email)) {
                    if(dispError) {
                        emailError.textContent = "Please enter a valid email address.";
                    }
                    if(validateAll) validateInputs(false, false);
                    return false;
                } else {
                    emailError.textContent = "";
                    if(validateAll) validateInputs(false, false);
                    return true;
                }

            }

            function validatePassword(dispError = true, validateAll = true) {
                const password = document.getElementById('Password').value;
                const passwordError = document.getElementById('passwordError');
                if (password.length < 6) {
                    if(dispError) {
                        passwordError.textContent = "Password must be at least 6 characters long.";
                    }
                    if(validateAll) validateInputs(false, false);
                    return false;
                } else {
                    passwordError.textContent = "";
                    if(validateAll) validateInputs(false, false);
                    return true;
                }

            }

            function validateUserid(dispError = true, validateAll = true) {
                const userid = document.getElementById('Userid').value;
                const useridError = document.getElementById('useridError');
                if (userid.length < 3) {
                    if(dispError) {
                        useridError.textContent = "User ID must be at least 3 characters long.";
                    }
                    if(validateAll) validateInputs(false, false);
                    return false;
                } else {
                    useridError.textContent = "";
                    if(validateAll) validateInputs(false, false);
                    return true;
                }

            }

            function validateDepartment(dispError = true, validateAll = true) {
                const department = document.getElementById('Department').value;
                const departmentError = document.getElementById('departmentError');
                if (department.trim() === "") {
                    if(dispError) {
                        departmentError.textContent = "Department cannot be empty.";
                    }
                    if(validateAll) validateInputs(false, false);
                    return false;
                } else {
                    departmentError.textContent = "";
                    if(validateAll) validateInputs(false, false);
                    return true;
                }

            }

            function validateMobile(dispError = true, validateAll = true) {
                const mobile = document.getElementById('moblnum').value;
                const mobileError = document.getElementById('mobileError');
                const mobilePattern = /^[0-9]{10}$/;
                if (!mobilePattern.test(mobile)) {
                    if(dispError) {
                        mobileError.textContent = "Please enter a valid 10-digit mobile number.";
                    }
                    if(validateAll) validateInputs(false, false);
                    return false;
                } else {
                    mobileError.textContent = "";
                    if(validateAll) validateInputs(false, false);
                    return true;
                }

            }

            function validateInputs(dispError = true, validateAll = false,createAccount = false){
                let valid = true;
                valid &= validateUsername(dispError, validateAll);
                valid &= validateEmail(dispError, validateAll);
                valid &= validatePassword(dispError, validateAll);
                valid &= validateUserid(dispError, validateAll);
                valid &= validateDepartment(dispError, validateAll);
                valid &= validateMobile(dispError, validateAll);

                let reg = document.getElementById('reg');
                let wrapperReg = document.getElementById('wrapper_reg');
                if(valid){
                    wrapperReg.classList.remove('disable');
                    if(createAccount){
                        console.log("creating account")
                        reg.click();
                    }
                }
                else{
                    wrapperReg.classList.add('disable');
                }
            }
            function toggleSignup() {
                document.getElementById("login-toggle").style.backgroundColor = "#fff";
                document.getElementById("login-toggle").style.color = "#222";
                document.getElementById("signup-toggle").style.backgroundColor = "#57b846";
                document.getElementById("signup-toggle").style.color = "#fff";
                document.getElementById("login-form").style.display = "none";
                document.getElementById("signup-form").style.display = "block";
            }

            function toggleLogin() {
                document.getElementById("login-toggle").style.backgroundColor = "#57b846";
                document.getElementById("login-toggle").style.color = "#fff";
                document.getElementById("signup-toggle").style.backgroundColor = "#fff";
                document.getElementById("signup-toggle").style.color = "#222";
                document.getElementById("signup-form").style.display = "none";
                document.getElementById("login-form").style.display = "block";
            }
        </script>
    </form>
</body>
</html>
