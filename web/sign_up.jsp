
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head_bootstrap_version.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="container mt-3">
        <div class="row">
            <div class="col-6 mx-auto">
                <%
                    String emailerror = request.getParameter("emailerror");
                    if (emailerror!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Email is busy!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>

                <%
                    String passworderror = request.getParameter("passworderror");
                    if (passworderror!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Password are not same!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>

                <%
                    String success = request.getParameter("success");
                    if (success!=null){
                %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    Congratulations, You registered successful!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>
                <form action="/sign-up" method="post">
                    <div class="row">
                        <div class="col-12 mt-2">
                            <label>EMAIL : </label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="text" class="form-control" name="email" required placeholder="Insert Email">
                        </div>

                        <div class="col-12 mt-2">
                            <label>PASSWORD : </label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="password" class="form-control" name="password" required placeholder="Insert Password">
                        </div>

                        <div class="col-12 mt-2">
                            <label>REPEAT PASSWORD : </label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="password" class="form-control" name="re_password" required placeholder="Insert Password">
                        </div>

                        <div class="col-12 mt-2">
                            <label>FULL NAME : </label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="text" class="form-control" name="full_name" required placeholder="Insert full name">
                        </div>

                        <div class="col-12 mt-3">
                            <button class="btn btn-success">Sign Up</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>

    </div>

</body>
</html>
