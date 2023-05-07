
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
                <form action="/login" method="post">
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

                        <div class="col-12 mt-3">
                            <button class="btn btn-success">Sign In</button>
                        </div>

                    </div>
                </form>
            </div>
        </div>

    </div>

</body>
</html>
