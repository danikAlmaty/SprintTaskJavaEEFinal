package danik.techorda.kz.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBConnection {
    private static Connection connection;

    static {
        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/news_portal",
                    "postgres",
                    "123");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<News> getNews(){
        ArrayList<News> newsArrayList = new ArrayList<>();

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT ne.id, ne.post_date, ne.category_id, ne.title, ne.content, cat.name FROM public.news as ne " +
                    "inner join " +
                    "public.news_categories as cat on ne.category_id = cat.id ");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                News news = new News();
                news.setId(resultSet.getLong("id"));
                news.setPost_date(resultSet.getTimestamp("post_date"));

                news.setTitle(resultSet.getString("title"));
                news.setContent(resultSet.getString("content"));

                Category category = new Category();
                category.setId(resultSet.getLong("category_id"));
                category.setName(resultSet.getString("name"));
                news.setCategory_id(category);


                newsArrayList.add(news);
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        return newsArrayList;
    }

    public static ArrayList<Category> getCategories(){
        ArrayList<Category> categories = new ArrayList<>();

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM public.news_categories");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()){
                Category category = new Category();

                category.setId(resultSet.getLong("id"));
                category.setName(resultSet.getString("name"));

                categories.add(category);
            }
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
        return categories;
    }

    public static Category getCategoryById(long id){
        Category category = null;

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT * FROM public.news_categories " +
                    "WHERE id = ?");

            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                category = new Category();
                category.setName(resultSet.getString("name"));
                category.setId(resultSet.getLong("id"));

            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        return category;
    }
    public static News getNewsById(long id){
        News news = null;

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT ne.id, ne.post_date, ne.category_id, ne.title, ne.content, cat.name FROM public.news as ne " +
                    "inner join " +
                    "public.news_categories as cat on ne.category_id = cat.id " +
                    "WHERE ne.id = ?");

            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                news = new News();
                news.setId(resultSet.getLong("id"));
                news.setPost_date(resultSet.getTimestamp("post_date"));

                news.setTitle(resultSet.getString("title"));
                news.setContent(resultSet.getString("content"));

                Category category = new Category();
                category.setId(resultSet.getLong("category_id"));
                category.setName(resultSet.getString("name"));
                news.setCategory_id(category);

            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        return news;
    }

    public static void addNews(News news){
        try{
            PreparedStatement  statement = connection.prepareStatement("" +
                    "INSERT INTO public.news (post_date, category_id, title, content) " +
                    "VALUES (NOW()::timestamp, ?, ?, ?)");
            statement.setLong(1, news.getCategory_id().getId());
            statement.setString(2, news.getTitle());
            statement.setString(3, news.getContent());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void updateNews(News news){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE public.news " +
                    "SET post_date = ?, " +
                    "category_id = ?, " +
                    "title = ?, " +
                    "content = ? " +
                    "WHERE id = ?");

            statement.setTimestamp(1, news.getPost_date());
            statement.setLong(2, news.getCategory_id().getId());
            statement.setString(3, news.getTitle());
            statement.setString(4, news.getContent());
            statement.setLong(5, news.getId());

            statement.executeUpdate();
            statement.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteNews(long id){
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "DELETE FROM public.news " +
                    "WHERE id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static User getUser(String email){
        User user = null;

        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT us.id, us.email, us.password, us.role_id, us.full_name, ro.role_description " +
                    "FROM public.users as us " +
                    "inner join public.role as ro on us.role_id = ro.id " +
                    "WHERE email = ?");
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()){
                user = new User();

                user.setId(resultSet.getLong("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFull_name(resultSet.getString("full_name"));

                Role role = new Role();
                role.setRole_description(resultSet.getString("role_description"));
                role.setId(resultSet.getLong("role_id"));
                user.setRole_id(role);

            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public static void addUser(User user){
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO public.users (email, password, full_name, role_id) " +
                    "VALUES (?, ?, ?, ?)");
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFull_name());
            statement.setLong(4, user.getRole_id().getId());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public static void updateUser(User user){
        try{
            PreparedStatement statement = connection.prepareStatement("" +
                    "UPDATE public.users " +
                    "SET password = ?, " +
                    "full_name = ? " +
                    "WHERE id = ?");

            statement.setString(1, user.getPassword());
            statement.setString(2, user.getFull_name());
            statement.setLong(3, user.getId());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addComment(Comment comment){
        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "INSERT INTO public.comments (comment, post_date, user_id, news_id) " +
                    "VALUES (?, NOW()::timestamp, ?, ?)");
            statement.setString(1, comment.getComment());
            statement.setLong(2, comment.getUser().getId());
            statement.setLong(3, comment.getNews().getId());

            statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }




    }

    public static ArrayList<Comment> getComments(Long id){
        ArrayList<Comment> comments = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement("" +
                    "SELECT c.id, c.comment, c.user_id, c.news_id, c.post_date, us.full_name " +
                    "FROM public.comments as c INNER JOIN public.users as us ON " +
                    "c.user_id = us.id " +
                    "WHERE c.news_id = ?");
            statement.setLong(1, id);


            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                Comment comment = new Comment();
                comment.setComment(resultSet.getString("comment"));
                comment.setId(resultSet.getLong("id"));
                comment.setPost_date(resultSet.getTimestamp("post_date"));

                User user = new User();
                user.setFull_name(resultSet.getString("full_name"));

                comment.setUser(user);
                comments.add(comment);
            }

            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        return comments;
    }
}


