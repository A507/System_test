package Check;

import Sha.Sha;
import bean.javabean;

//import javax.servlet.http.Cookie;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Check {
    private javabean bean;
    public Check(){
        bean=new javabean();
    }

    public String checkQuanxian(String id){
        if(!bean.connect()){
            return null;
        }
        ResultSet resultSet=bean.getQuanxian(id);
        if(resultSet==null){
            return null;
        }
        try {
            resultSet.first();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if(resultSet.getRow()==0){
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            return resultSet.getString("quanxian");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        bean.closeDatabase();
        return null;
    }

    public boolean setCookie(String id,String time){
        if(!bean.connect()){
            return false;
        }
        Date date=new Date();
        if(!bean.insertCookie(id,time)){
            bean.closeDatabase();
            return false;
        }
        return true;
    }
}
