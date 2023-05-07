<%@ page import="danik.techorda.kz.classes.Category" %>
<form action="/add-news" method="post">
  <div class="row">
    <div class="col-12">
      <label>Category: </label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <select class="form-select" name="category_name">
        <%
          ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
          if (categories!=null){
            for(Category cat : categories){


        %>
        <option value="<%=cat.getId()%>"><%=cat.getName()%></option>
        <%
            }
          }
        %>

      </select>
    </div>
  </div>

  <div class="row mt-3">
    <div class="col-12">
      <label>Title: </label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <input type="text" class="form-control" name="news_title">
    </div>
  </div>

  <div class="row mt-3">
    <div class="col-12">
      <label>Content: </label>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <textarea name="news_content" class="form-control" rows="5"></textarea>
    </div>
  </div>



  <div class="row mt-3">
    <div class="col-12">
      <button class="btn btn-success">ADD NEWS</button>
    </div>
  </div>
</form>