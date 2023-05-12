<%@ page import="danik.techorda.kz.classes.News" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="danik.techorda.kz.classes.Category" %>
<%@ page import="danik.techorda.kz.classes.Comment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News</title>
    <%@include file="head_bootstrap_version.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container mt-5 pb-5">
    <%
        News news = (News) request.getAttribute("newsOne");
        if (news!=null && currentUser!=null){
    %>
    <div class="row">
        <div class="col-6 mx-auto">
            <div class="row">
                <div class="col-12">
                    <label>Title: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="text" class="form-control" readonly value="<%=news.getTitle()%>">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <label>Content: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <textarea class="form-control" readonly rows="10"><%=news.getContent()%></textarea>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12">
                    <label>Category: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="text" class="form-control" readonly value="<%=news.getCategory_id().getName()%>">
                </div>
            </div>



            <div class="row mt-3">
                <div class="col-12">
                    <label>Post Date: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="text" class="form-control" readonly value="<%=news.getPost_date().toString().substring(0, 19)%>">
                </div>
            </div>

            <%
                if (currentUser.getRole_id().getRole_description().equals("admin")){
            %>

            <div class="row mt-3">
                <div class="col-12">
                    <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#editNews">
                        EDIT NEWS
                    </button>
                    <button type="button" class="btn btn-danger btn-sm ms-3" data-bs-toggle="modal" data-bs-target="#deleteNews">
                        Delete NEWS
                    </button>

                </div>
            </div>

            <div class="modal fade" id="deleteNews" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="/delete-news" method="post">
                            <input type="hidden" value="<%=news.getId()%>" name="id">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" >Confirm Delete</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <h5 class="text-center">Are you senimdi?</h5>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                <button class="btn btn-danger">Yes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="editNews" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/save-news" method="post">
                                <input type="hidden" name="news_id" value="<%=news.getId()%>">
                                <div class="row">
                                    <div class="col-12">
                                        <label>Title: </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text" class="form-control" name="news_title" value="<%=news.getTitle()%>">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Content: </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text" class="form-control" name="news_content" value="<%=news.getContent()%>">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Post Date: </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input type="text" class="form-control" name="post_date_news" readonly value="<%=news.getPost_date().toString().substring(0, 19)%>">
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Category: </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <select class="form-select" name="select_category">
                                            <%
                                                ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
                                                if (categories!=null){
                                                    for(Category category: categories){


                                            %>
                                            <option <%=(category.getId() == news.getCategory_id().getId()) ? "selected" : "" %> value="<%=category.getId()%>"><%=category.getName()%></option>
                                            <%
                                                    }
                                                }

                                            %>
                                        </select>
                                    </div>
                                </div>





                                <div class="row mt-3">
                                    <div class="col-12">
                                        <button class="btn btn-primary">Edit news</button>
                                    </div>
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
    <%
        }
    %>

    <%
    }else {

    %>
    <h3 class="text-center">I can't find this news</h3>
    <%
        }
    %>

    <%
        if (currentUser!=null){
    %>

    <div class="container">
        <div class="row">
            <form action="/add-comment" method="post">
                <input type="hidden" name="add_news_id" value="<%=news.getId()%>">

                <div class="row mt-5">
                    <div class="col-12">
                        <label>Content: </label>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-12">
                        <textarea name="comment" class="form-control" rows="5"></textarea>
                    </div>
                </div>



                <div class="row mt-3">
                    <div class="col-12">
                        <button class="btn btn-success">ADD COMMENT</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-12">
            <div class="list-group">
                <%
                    ArrayList<Comment> comments = (ArrayList<Comment>) request.getAttribute("commentter");
                    if (comments!=null){

                    for (Comment com : comments){
                %>

                <a href="JavaScript:void(0)" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><%=com.getUser().getFull_name()%></h5>
                        <small class="text-body-secondary"><%=com.getPost_date().toString().substring(0, 19)%></small>
                    </div>
                    <p class="mb-1"><%=com.getComment()%></p>
                </a>

                <%
                        }
                    }
                %>

            </div>

        </div>
    </div>

    <%
        }
    %>
</div>

</body>
</html>
