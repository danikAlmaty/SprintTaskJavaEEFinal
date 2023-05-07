<%@ page import="danik.techorda.kz.classes.News" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <%@include file="head_bootstrap_version.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <%
        if (currentUser!=null){
    %>

    <%
        if (currentUser.getRole_id().getRole_description().equals("admin")){
    %>
    <div class="container align-content-center w-75 mb-2">
        <div class="row mt-3">
            <div class="col-12">
                <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addTask">
                    + ADD TASK
                </button>

                <div class="modal fade" id="addTask" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <%@include file="formadd.jsp"%>
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
    <%
        }
    %>

    <div class="container w-50 align-content-center align-items-center">

        <div class="row mt-3">
            <%
                ArrayList<News> newstar = (ArrayList<News>) request.getAttribute("zhanalyktar");

                for (News news : newstar) {


            %>

            <div class="col-4 mb-3">
                <div class="card h-100 text-center">
                    <div class="card-header"><h5><%=news.getCategory_id().getName()%>
                    </h5></div>
                    <div class="card-body d-flex flex-column">
                        <h2 class="card-title text-success"><%=news.getTitle()%>
                        </h2>
                        <p class="flex-grow-1 text-center px-5"><%=news.getPost_date().toString().substring(0, 19)%>
                        </p>
                        <a href="/details?new_id=<%=news.getId()%>" class="btn btn-success mt-auto">more</a>
                    </div>
                </div>
            </div>

            <%
                }
            %>
        </div>
    </div>

    <%
        }else{


    %>
        <div class="container w-75 mt-5">
            <div class="col-12">
                <input class="form-control" type="text" placeholder="To See News" aria-label="Disabled input example" disabled>
                <input class="form-control" type="text" value="Please Login" aria-label="Disabled input example" disabled readonly>
            </div>
        </div>
    <%
        }
    %>

</body>
</html>
