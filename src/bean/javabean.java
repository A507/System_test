package bean;

import  java.sql.*;

public class javabean {
    private
    String driverStr = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    private
    Connection con = null;
    java.sql.Statement st = null;
    ResultSet rs = null;



        public void  connection(){
            try

    {
        Class.forName("com.mysql.jdbc.Driver");

    }catch(
    ClassNotFoundException e)

    {
        System.out.println("无法加载数据库驱动");
        e.printStackTrace();
    }

    String user = "root";
    String url = "jdbc:mysql://localhost:3306/message";
    try

    {
        con = DriverManager.getConnection(url, user, "1234");
    }catch(
    SQLException e)

    {
        System.out.println("创建数据库连接出错");
        e.printStackTrace();
    }
    if(con==null)

    {
        System.out.println("无法创建数据连接");
    }else

    {
        System.out.println("创建数据链结成功");

    }
  }

  public void insert(String id1, String address1,String phone1,String referee1,String sex1,
          String date1,String industry1,String committee1,String password1){
      PreparedStatement ps = null;

      try {





          //String sql = "INSERT INTO information VALUES('\" + id + \"','\" + address + \"','\" + phone + \"','\" + referee + \"','\" + sex + \"','\" + date + \"','\" + industry + \"','\" + committee + \"','\" + password + \"')";
          String sql = "INSERT INTO information VALUES(?,?,?,?,?,?,?,?,?)";
          ps = con.prepareStatement(sql);
          ps.setString(1, id1);
          ps.setString(2, address1);
          ps.setString(3, phone1);
          ps.setString(4, referee1);
          ps.setString(5, sex1);
          ps.setString(6, date1);
          ps.setString(7, industry1);
          ps.setString(8, committee1);
          ps.setString(9, password1);
          ps.executeUpdate();


          System.out.println("运行成功");
      }catch (Exception e) {
          System.out.println(e);
      }
  }
}
