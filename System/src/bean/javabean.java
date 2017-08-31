package bean;

import Sha.Sha;
import java.text.*;

import java.sql.*;
import java.time.LocalTime;
import java.util.Date;

public class javabean {
    private String driverStr = "com.mysql.jdbc.Driver";
    public Connection con=null;
    java.sql.Statement st = null;
    private int Count;
    private ResultSet resultSet=null;
    private PreparedStatement preparedStatement=null;
    static final private String url="jdbc:mysql://192.168.1.104:3306/lurenwei";
    static final private String user="root";
    static final private String password="1234";
    private Statement statement;

    public int getCount() {
        return Count;
    }

    //插入复议
    public boolean insertFuyi(String tian_id,String xingming){
        try {
            preparedStatement=con.prepareStatement("INSERT  INTO fuyi VALUES (?,?)");
            preparedStatement.setString(1,xingming);
            preparedStatement.setString(2,tian_id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return  false;
        }
        deleteFandui(xingming,tian_id);
        return true;
    }


    //插入反对
    public boolean insertFandui(String tian_id,String xingming){
        try {
            preparedStatement=con.prepareStatement("INSERT  INTO fandui VALUES (?,?)");
            preparedStatement.setString(1,xingming);
            preparedStatement.setString(2,tian_id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return  false;
        }
        deleteFuyi(xingming,tian_id);
        return true;
    }

    //检查是否反对过
    public ResultSet checkFandui(String xingming,String tian_id){
        try {
            preparedStatement=con.prepareStatement("SELECT COUNT(*) FROM fandui WHERE tian=? AND xingming=?");
            preparedStatement.setString(1,tian_id);
            preparedStatement.setString(2,xingming);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return null;
        }
        return resultSet;
    }



    //检查是否点复议过
    public ResultSet checkFuyi(String xingming,String tian_id){
        try {
            preparedStatement=con.prepareStatement("SELECT COUNT(*) FROM fuyi WHERE tian=? AND xingming=?");
            preparedStatement.setString(1,tian_id);
            preparedStatement.setString(2,xingming);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return null;
        }
        return resultSet;
    }

    //获得复议总数
    public ResultSet getFuyiCount(String tian){
        try {
            preparedStatement=con.prepareStatement("SELECT COUNT(*) FROM fuyi WHERE tian=?");
            preparedStatement.setString(1,tian);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return null;
        }
        return resultSet;

    }

    //获得反对总数
    public ResultSet getfanduiCount(String tian){
        try {
            preparedStatement=con.prepareStatement("SELECT COUNT(*) FROM fandui WHERE tian=?");
            preparedStatement.setString(1,tian);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return null;
        }
        return resultSet;
    }

    //取消复议
    public boolean deleteFuyi(String xingming,String tian){
        try {
            preparedStatement=con.prepareStatement("DELETE FROM fuyi WHERE tian=? AND xingming=?");
            preparedStatement.setString(1,tian);
            preparedStatement.setString(2,xingming);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return false;
        }
        return true;
    }


    //取消反对
    public boolean deleteFandui(String xingming,String tian){
        try {
            preparedStatement=con.prepareStatement("DELETE FROM fandui WHERE tian=? AND xingming=?");
            preparedStatement.setString(1,tian);
            preparedStatement.setString(2,xingming);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return false;
        }
        return true;
    }

    //读取权限
    public ResultSet getQuanxian(String id){
        try {
            preparedStatement=con.prepareStatement("SELECT * FROM quanxian WHERE id=?");
            preparedStatement.setString(1,id);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return null;
        }
        return resultSet;
    }

    //删除过期cookie
    public boolean deleteCookie(){
        Date date=new Date();
        String time=String.valueOf(date.getTime());
        try {
            preparedStatement=con.prepareStatement("DELETE FROM cookie WHERE time<?");
            preparedStatement.setString(1,time);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return false;
        }
        return true;
    }

    //查询cookie,验证状态
    public ResultSet checkCookie(String hash){
        Date date=new Date();
        String time=String.valueOf(date.getTime());
        try {
            preparedStatement=con.prepareStatement("SELECT * FROM cookie WHERE hash=? AND time>?");
            preparedStatement.setString(1,hash);
            preparedStatement.setString(2,time);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return null;
        }
        return resultSet;
    }

    //插入cookie
    public boolean insertCookie(String id,String time){
        String str=id+ time;
        str=Sha.getSha1(str);
        try {
            preparedStatement=con.prepareStatement("INSERT INTO cookie VALUES (?,?,?)");
            preparedStatement.setString(1,str);
            preparedStatement.setString(2,id);
            preparedStatement.setString(3,time);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return false;
        }
        return true;
    }

    //读取用户信息
    public ResultSet getYonghu(String name){
        try {
            preparedStatement=con.prepareStatement("SELECT * FROM yonghu WHERE xingming=?");
            preparedStatement.setString(1,name);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return null;
        }
        return resultSet;
    }

    //插入权限表
    public boolean insertQuanxian(String id,String quanxian){
        try {
            preparedStatement=con.prepareStatement("INSERT INTO quanxian VALUES (?,?)");
            preparedStatement.setString(1,id);
            preparedStatement.setString(2,quanxian);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return false;
        }
        return true;
    }

    //连接数据库
    public boolean connect(){
        try {
            Class.forName(driverStr);
            con= DriverManager.getConnection(url,user,password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print("Class错误");
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("Connect错误");
            return false;
        }
        return true;
    }

    //获取所有提案,时间排列
    public ResultSet getTianSuoyou(){
        try {
            preparedStatement=con.prepareStatement("SELECT * FROM tian");
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return null;
        }
        return resultSet;
    }

    //获取提案通过用户名
    public ResultSet getTianByName(String name){
        try {
            preparedStatement=con.prepareStatement("SELECT * FROM tian WHERE zuozhe=?");
            preparedStatement.setString(1,name);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return null;
        }
        return resultSet;
    }


    //保存草稿
    public boolean insertTianCaogao(String biaoti,String neirong,String zuozhe){
        try {
            preparedStatement=con.prepareStatement("INSERT INTO tian VALUES (?,?,?,?,?,?)");
            preparedStatement.setString(1,null);
            preparedStatement.setString(2,biaoti);
            SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();
            preparedStatement.setString(3,dateFormater.format(date));
            preparedStatement.setString(4,neirong);
            preparedStatement.setString(5,zuozhe);
            preparedStatement.setString(6,"草稿");
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return false;
        }
        return true;
    }

    //删除提案通过id
    public  boolean deleteTianById(String id){
        try {
            preparedStatement=con.prepareStatement("DELETE FROM tian WHERE id=?");
            preparedStatement.setString(1,id);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return false;
        }
        return true;
    }

    //评论数量
    public String getPinglunShu(String tian_id){
        try {
            preparedStatement=con.prepareStatement("SELECT COUNT(*) FROM pinglun WHERE tian=?");
            preparedStatement.setString(1,tian_id);
            resultSet=preparedStatement.executeQuery();
            resultSet.last();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return "";
        }
        try {
            return resultSet.getString("COUNT(*)");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "";
    }


    //获取评论通过提案id
    public ResultSet getPinglunByTianId(String tianId){
        try {
            preparedStatement=con.prepareStatement("SELECT * FROM pinglun WHERE tian=?");
            preparedStatement.setString(1,tianId);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return  null;
        }
        return resultSet;
    }

    //添加评论,通过用户
    public boolean insertPinglun(String mingzi,String tianId,String pinglun){
        try {
            preparedStatement=con.prepareStatement("INSERT INTO pinglun VALUES (?,?,?,?)");
            preparedStatement.setString(1,pinglun);
            SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();
            preparedStatement.setString(2,dateFormater.format(date));
            preparedStatement.setString(3,mingzi);
            preparedStatement.setString(4,tianId);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return false;
        }
        return true;
    }

    //获取提案，通过id
    public ResultSet getTianById(String id){
        try {
            preparedStatement=con.prepareStatement("SELECT * FROM tian WHERE id=?");
            preparedStatement.setString(1,id);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
        }
        return resultSet;
    }

    //删除指定cookie
    public boolean deleteTheCookie(String hash){
        try {
            preparedStatement=con.prepareStatement("DELETE FROM cookie WHERE hash=?");
            preparedStatement.setString(1,hash);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
        }
        return true;
    }

    //插入提案
    public boolean insertTian(String biaoti,String neirong,String zuozhe,String zhuangtai){
        try {
            preparedStatement=con.prepareStatement("INSERT INTO tian VALUES (?,?,?,?,?,?)");
            preparedStatement.setString(1,null);
            preparedStatement.setString(2,biaoti);
            SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
            Date date=new Date();
            preparedStatement.setString(3,dateFormater.format(date));
            preparedStatement.setString(4,neirong);
            preparedStatement.setString(5,zuozhe);
            preparedStatement.setString(6,zhuangtai);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return false;
        }
        return true;
    }

    //获取用户信息by id
    public ResultSet getYonghuById(String id){
        try {
            preparedStatement=con.prepareStatement("SELECT * FROM yonghu WHERE id=?");
            preparedStatement.setString(1,id);
            resultSet=preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql错误");
            return null;
        }
        return resultSet;
    }

    //延长cookie时间
    public  boolean addCookieTime(String hash){
        Date date=new Date();
        String time=String.valueOf(date.getTime()+1000*60*20);
        try {
            preparedStatement=con.prepareStatement("UPDATE cookie SET time=? WHERE hash=?");
            preparedStatement.setString(1,time);
            preparedStatement.setString(2,hash);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return false;
        }
        return true;
    }

    //插入数据
    public boolean inertTest(String id,String name){
        try {
            preparedStatement=con.prepareStatement("INSERT INTO test VALUES (?,?)");
            preparedStatement.setString(1,id);
            preparedStatement.setString(2,name);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //关闭数据库
    public boolean closeDatabase(){
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean insertYonghu(String xingming,String jiatingzhuzhi,String lianxifangshi,String tuijianren,String xingbie,String chushengriqi,String hangyefenhui,String zhuanweihui,String mima,String danwei,String zhicheng,String youxiang,String weixin,String zhiwu){
        try {
            preparedStatement=con.prepareStatement("INSERT INTO yonghu VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            preparedStatement.setString(1,xingming);
            preparedStatement.setString(2,jiatingzhuzhi);
            preparedStatement.setString(3,lianxifangshi);
            preparedStatement.setString(4,tuijianren);
            preparedStatement.setString(5,xingbie);
            preparedStatement.setString(6,chushengriqi);
            preparedStatement.setString(7,hangyefenhui);
            preparedStatement.setString(8,zhuanweihui);
            preparedStatement.setString(9,mima);
            preparedStatement.setString(10,danwei);
            preparedStatement.setString(11,zhicheng);
            preparedStatement.setString(12,youxiang);
            preparedStatement.setString(13,null);
            preparedStatement.setString(14,weixin);
            preparedStatement.setString(15,zhiwu);

            //插入
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("sql语句错误");
            return false;
        }
        return true;
    }
    class yonghu{
        String xingming;
        String jiatingzhuzhi;
        String lianxifangshi;
        String tuijianren;
        String xingbie;
        String chushengriqi;
        String hangyefenhui;
        String zhuanweihui;
        String mima;
        String danwei;
        String zhicheng;
        String youxiang;
        String weixin;
        String zhiwu;
        String id;

        }
}
