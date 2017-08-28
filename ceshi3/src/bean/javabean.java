package bean;

import java.sql.*;


public class javabean {
    private
    String driverStr = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

    public
    Connection con = null;
    java.sql.Statement st = null;
    String[] id2=new String[10];
    String[] address2=new String[10];String[] phone2=new String[10];String[] referee2=new String[10];String[] sex2=new String[10];
    String[] date2=new String[10];String[] industry2=new String[10];String[] committee2=new String[10];String[] password2=new String[10];
    String[] biaohao3=new String[10];String []mingcheng3=new String[10];String[] date3=new String[10];
    String[] neirong3=new String[10];String [] zuozhe3=new String[10];

    String[] ID = new String[10];
    String[] address1 = new String[10];
    String[] phone1 = new String[10];
    String[] referee1 = new String[10];
    String[] sex1 = new String[10];
    String[] date1 = new String[10];
    String[] industry1 = new String[10];
    String[] committee1 = new String[10];
    String[] password1 = new String[10];

    String ID4;
    String address4 ;
    String phone4 ;
    String referee4 ;
    String sex4 ;
    String date4 ;
    String industry4 ;
    String committee4;
    String password4 ;

    String[] bianhao1=new String[10];
    String[] mingcheng1=new String[10];
    String[] zuozhe1=new String[10];
    String[] data1=new String[10];
    String[] neirong1=new String[10];

    String bianhao4;
    String mingcheng4;
    String zuozhe4;
    String data4;
    String neirong4;
    int h;

    public void connection() {
        try

        {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (
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
            st = con.createStatement();
        } catch (
                SQLException e)

        {
            System.out.println("创建数据库连接出错");
            e.printStackTrace();
        }
        if (con == null)

        {
            System.out.println("无法创建数据连接");
        } else

        {
            System.out.println("创建数据链结成功");

        }

    }
    public void connectionpinglun() {
        try

        {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (
                ClassNotFoundException e)

        {
            System.out.println("无法加载数据库驱动");
            e.printStackTrace();
        }

        String user = "root";
        String url = "jdbc:mysql://localhost:3306/pinglun";
        try

        {
            con = DriverManager.getConnection(url, user, "1234");
        } catch (
                SQLException e)

        {
            System.out.println("创建数据库连接出错");
            e.printStackTrace();
        }
        if (con == null)

        {
            System.out.println("无法创建数据连接");
        } else

        {
            System.out.println("创建数据链结成功");

        }
    }
    public void connectionwendang() {
        try

        {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (
                ClassNotFoundException e)

        {
            System.out.println("无法加载数据库驱动");
            e.printStackTrace();
        }

        String user = "root";
        String url = "jdbc:mysql://localhost:3306/wendang";
        try

        {
            con = DriverManager.getConnection(url, user, "1234");
        } catch (
                SQLException e)

        {
            System.out.println("创建数据库连接出错");
            e.printStackTrace();
        }
        if (con == null)

        {
            System.out.println("无法创建数据连接");
        } else

        {
            System.out.println("创建数据链结成功");

        }
    }
    public void connectionyonghu() {
        try

        {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (
                ClassNotFoundException e)

        {
            System.out.println("无法加载数据库驱动");
            e.printStackTrace();
        }

        String user = "root";
        String url = "jdbc:mysql://localhost:3306/yonghu";
        try

        {
            con = DriverManager.getConnection(url, user, "1234");
        } catch (
                SQLException e)

        {
            System.out.println("创建数据库连接出错");
            e.printStackTrace();
        }
        if (con == null)

        {
            System.out.println("无法创建数据连接");
        } else

        {
            System.out.println("创建数据链结成功");

        }
    }


    public void connectiondenglu() {
        try

        {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (
                ClassNotFoundException e)

        {
            System.out.println("无法加载数据库驱动");
            e.printStackTrace();
        }

        String user = "root";
        String url = "jdbc:mysql://localhost:3306/denglu";
        try

        {
            con = DriverManager.getConnection(url, user, "1234");
        } catch (
                SQLException e)

        {
            System.out.println("创建数据库连接出错");
            e.printStackTrace();
        }
        if (con == null)

        {
            System.out.println("无法创建数据连接");
        } else

        {
            System.out.println("创建数据链结成功");

        }
    }


    public void insert(String id1, String address1, String phone1, String referee1, String sex1,
                       String date1, String industry1, String committee1, String password1) {
        PreparedStatement ps = null;

        try {


            //String sql = "INSERT INTO information VALUES('\" + id + \"','\" + address + \"','\" + phone + \"','\" + referee + \"','\" + sex + \"','\" + date + \"','\" + industry + \"','\" + committee + \"','\" + password + \"')";
            String sql = "INSERT INTO information VALUES(?,?,?,?,?,?,?,?,?,?)";
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
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void insertwendang( String mingcheng1, String zuozhe1, String data1, String neirong1) {
        PreparedStatement ps = null;

        try {


            //String sql = "INSERT INTO information VALUES('\" + id + \"','\" + address + \"','\" + phone + \"','\" + referee + \"','\" + sex + \"','\" + date + \"','\" + industry + \"','\" + committee + \"','\" + password + \"')";
            String sql = "INSERT INTO wendangxinxi VALUES(?,?,?,?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, mingcheng1);
            ps.setString(2, zuozhe1);
            ps.setString(3, data1);
            ps.setString(4, neirong1);
            ps.executeUpdate();


            System.out.println("运行成功");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void search(String id1) {            //查询函数
        String sql = "SELECT * FROM yonghuxinxi";


        h = 0;

        try {

            st = con.createStatement();//创建查询语句类
            ResultSet rs = null;

            rs = st.executeQuery(sql); //执行SQL,取得结果
           // System.out.println("运行中");

            while (rs.next()) {

                ID[h] = rs.getString("id");
                address1[h] = rs.getString("address");
                phone1[h] = rs.getString("phone");
                referee1[h] = rs.getString("referee");
                sex1[h] = rs.getString("sex");
                date1[h] = rs.getString("date");
                industry1[h] = rs.getString("industry");
                committee1[h] = rs.getString("committee");
                password1[h] = rs.getString("password");

                h++;
            }
            //System.out.println("ID:" + ID[0]);
            int h = 0;//判断是否找到此ID
            for(int i=0;i<10;i++) {
                if (ID[h].equals(id1)) {
                    System.out.println("ID:" + ID[h]);
                    System.out.println("地址:" + address1[h]);
                    System.out.println("电话:" + phone1[h]);
                    System.out.println("推荐人:" + referee1[h]);
                    System.out.println("性别:" + sex1[h]);
                    System.out.println("出生日期:" + date1[h]);
                    System.out.println("行业分会:" + industry1[h]);
                    System.out.println("工会:" + committee1[h]);
                    System.out.println("密码:" + password1[h]);
                    ID4=ID[h];
                    address4=address1[h];
                    phone4=phone1[h];
                    referee4=referee1[h];
                   sex4=sex1[h];
                    date4=date1[h];
                    industry4=industry1[h];
                    committee4=committee1[h];
                    password4=password1[h];



                    break;


                }else{
                    h++;
                }


            }
        System.out.println(h);


        } catch (Exception e) {
            System.out.println(e);
        }


    }

    public void search2(String bianhao) {            //查询函数
        String sql = "SELECT * FROM wendangxinxi";


        h = 0;
        //System.out.println(bianhao);
        try {

            st = con.createStatement();//创建查询语句类
            ResultSet rs = null;

            rs = st.executeQuery(sql); //执行SQL,取得结果
            // System.out.println("运行中");

            while (rs.next()) {

                bianhao1[h] = rs.getString("bianhao");
                mingcheng1[h] = rs.getString("mingcheng");
                zuozhe1[h] = rs.getString("zuozhe");
                data1[h] = rs.getString("data");
                neirong1[h] = rs.getString("neirong");
               // System.out.println(bianhao1[h]);

                h++;
            }
            //System.out.println("ID:" + ID[0]);
            int h = 0;//判断是否找到此ID
            for(int i=0;i<10;i++) {
                if (bianhao1[h].equals(bianhao)) {
                    bianhao4=bianhao1[h];
                    mingcheng4=mingcheng1[h];
                    zuozhe4=zuozhe1[h];
                    data4=data1[h];
                    neirong4=neirong1[h];





                    break;


                }else{
                    h++;
                }


            }
            System.out.println(h);


        } catch (Exception e) {
            System.out.println(e);
        }


    }

    public int login(String id1,String password1){
        String[] Id=new String[10];
        String[] Password=new String[10];
        ResultSet rs = null;
        int i=0;

        try{


            st=con.createStatement();//创建查询语句类

            String sql="select id,password from dengluxinxi";
            rs=st.executeQuery(sql); //执行SQL,取得结果
           // System.out.println(id1);

           while(rs.next()){

                Id[i]=rs.getString("id");


                Password[i]=rs.getString("password");

                i++;

            }

          // System.out.println("chenggong");






        }catch(Exception e){
            System.out.println("读取ACCESS数据库数据出错了");

        }
        int a=0;
        //System.out.println(i);
        for(a=0;a<=i;a++){
            //System.out.println("xunhuan");
            //System.out.println(id1);
            //System.out.println(Id[a]);
            if (id1.equals(Id[a])) {

                if (password1.equals(Password[a])){
                    System.out.println("登陆成功");

                    return 1;
                }
                else {
                    System.out.println("密码错误，请重新输入");

                    return 0;
                }

            }
        }
        return 0;
    }

    public void delete(String id1){
        String sql="DELETE FROM information WHERE id = ?" ;



      System.out.println(id1);

        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id1);
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e);

        }

    }
    public void Updata(String id1, String address1, String phone1, String referee1, String sex1,
                       String date1, String industry1, String committee1 ,String password1){
        try{
            st=con.createStatement();//创建查询语句类
            String sql = "update yonghuxinxi set address = ?,phone = ?,referee = ?,sex=?,date=?,industry=?,committee=?, password=? where id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,address1);
            ps.setString(2, phone1);
            ps.setString(3, referee1);
            ps.setString(4, sex1);
            ps.setString(5, date1);
            ps.setString(6,industry1);
            ps.setString(7,committee1);
            ps.setString(8, id1);
            ps.setString(9, password1 );
            ps.executeUpdate();



        }catch(Exception e){
            System.out.println(e);

        }
    }
    public void output(){


        int i=0;

        try {

            ResultSet rs = null;
            st = con.createStatement();//创建查询语句类


            String sql="select * from information";
            rs=st.executeQuery(sql); //执行SQL,取得结果

            while (rs.next()) {

                id2[i] = rs.getString("id");
                address2[i] = rs.getString("address");
                phone2[i] = rs.getString("phone");
                referee2[i] = rs.getString("referee");
                sex2[i] = rs.getString("sex");
                date2[i] = rs.getString("date");
                industry2[i] = rs.getString("industry");
                committee2[i] = rs.getString("committee");
                password2[i] = rs.getString(" password");
                i++;

            }
        }catch(Exception e){
            System.out.println(e);

        }

    }
    public void outputwendang(){


        int i=0;

        try {

            ResultSet rs = null;
            st = con.createStatement();//创建查询语句类


            String sql="select * from wendangxinxi";
            rs=st.executeQuery(sql); //执行SQL,取得结果

            while (rs.next()) {

                biaohao3[i] = rs.getString("biaohao");
                mingcheng3[i] = rs.getString("mingcheng");
                zuozhe3[i] = rs.getString("zuozhe");
                date3[i] = rs.getString("data");
                neirong3[i] = rs.getString("neirong");
                i++;

            }
        }catch(Exception e){
            System.out.println(e);

        }

    }


    public String getwendang(int i){
        return biaohao3[i];
    }
    public String getming(int i){
        return mingcheng3[i];
    }
    public String getzuo(int i){
        return zuozhe3[i];
    }
    public String getda(int i){
        return date3[i];
    }
    public String getnei(int i){
        return neirong3[i];
    }
    public String getID(int i){
        return id2[i];
    }

    public String getwendang(){
        return bianhao4;
    }//重载函数
    public String getming(){
        return mingcheng4;
    }
    public String getzuo(){
        return zuozhe4;
    }
    public String getda(){ return data4; }
    public String getnei(){
        return neirong4;
    }



    public String getadd(int i){ return address2[i]; }
    public String getpho(int i){return phone2[i];}
    public String getref(int i){return referee2[i];}
    public String getsex(int i){return sex2[i];}
    public String getdate(int i){return date2[i];}
    public String getind(int i){return industry2[i];}
    public String getcom(int i){return committee2[i];}
    public String getpassword(int i){return password2[i];}


    public String getID1(){ return ID4; }
    public String getadd1(){ return address4; }
    public String getpho1(){return phone4;}
    public String getref1(){return referee4;}
    public String getsex1(){return sex4;}
    public String getdate1(){return date4;}
    public String getind1(){return industry4;}
    public String getcom1(){return committee4;}
    public String getpassword1(){return password4;}




}
