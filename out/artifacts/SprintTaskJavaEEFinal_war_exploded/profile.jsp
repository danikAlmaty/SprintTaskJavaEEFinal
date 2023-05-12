
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head_bootstrap_version.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<%
    User superUser = (User) request.getAttribute("superUser");
%>
<div class="container mt-3">
    <div class="row">
        <div class="col-6 mx-auto">
            <h1>Profile Page <%=superUser.getFull_name()%></h1>

                <div class="row">
                    <div class="col-12 mt-2">
                        <label>EMAIL : </label>
                    </div>
                    <div class="col-12 mt-3">
                        <input type="text" class="form-control" name="email" required readonly value="<%=superUser.getEmail()%>">
                    </div>

                    <div class="col-12 mt-2">
                        <label>PASSWORD : </label>
                    </div>
                    <div class="col-12 mt-3">
                        <input type="password" class="form-control" name="password" required readonly value="<%=superUser.getPassword()%>">
                    </div>

                    <div class="col-12 mt-2">
                        <label>FULL NAME : </label>
                    </div>
                    <div class="col-12 mt-3">
                        <input type="text" class="form-control" name="full_name" required readonly value="<%=superUser.getFull_name()%>">
                    </div>
                    <div class="col-12 mt-2">
                        <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addTask">
                            Change Data
                        </button>
                    </div>

                </div>
        </div>
    </div>
    <div class="container align-content-center w-75 mb-2">
        <div class="row mt-3">
            <div class="col-12">







                <%
                    String newandoldsame = request.getParameter("newandoldsame");
                    if (newandoldsame!=null){
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    New password that you entered are the same as last!
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
                    Congratulations, You changed data!
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <%
                    }
                %>

                <div class="modal fade" id="addTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="/profile" method="post">
                                <div class="col-12 mt-2">
                                    <label>EMAIL : </label>
                                </div>
                                <div class="col-12 mt-3">
                                    <input type="text" class="form-control" name="email" required readonly value="<%=superUser.getEmail()%>">
                                </div>

                                <div class="col-12 mt-2">
                                    <label>PASSWORD : </label>
                                </div>
                                <div class="col-12 mt-3">
                                    <input type="password" class="form-control" name="password" required value="<%=superUser.getPassword()%>">
                                </div>

                                <div class="col-12 mt-2">
                                    <label>REPEAT PASSWORD : </label>
                                </div>
                                <div class="col-12 mt-3">
                                    <input type="password" class="form-control" name="re_password" required value="<%=superUser.getPassword()%>">
                                </div>

                                <div class="col-12 mt-2">
                                    <label>FULL NAME : </label>
                                </div>
                                <div class="col-12 mt-3">
                                    <input type="text" class="form-control" name="full_name" required value="<%=superUser.getFull_name()%>">
                                </div>

                                <div class="col-12 mt-3">
                                    <button class="btn btn-success">Change</button>
                                </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
