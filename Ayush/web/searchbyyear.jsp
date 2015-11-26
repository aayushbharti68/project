<%-- 
    Document   : searchbyyear.jsp
    Created on : Nov 13, 2015, 7:51:36 PM
    Author     : Archit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baby Names</title>
    </head>
    <body>
    <center><h1>Baby Names</h1>
        <%
    try{
        String sql="";
        int i=1;
        String year=request.getParameter("syear");
        String top=request.getParameter("stop");
        String sex=request.getParameter("sex");
        //out.println(year+","+top+","+sex);
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        if(sex.equals("M") || sex.equals("F"))
            sql="select syear,sname,gender from hospital where syear="+Integer.parseInt(year)+" and gender='"+sex+"' order by amount desc";
                else if(sex.equals("B"))
                  sql="select syear,sname,gender from hospital where syear="+Integer.parseInt(year)+" order by amount desc";
          // out.println(sql);       
        Connection con=DriverManager.getConnection("jdbc:odbc:geit");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        out.println("<table border=1 width='50%'>");
        out.print("<tr><th>Year</th><th>Name</th><th>Sex</th></tr>");
        int flag=0;
        while(i<=Integer.parseInt(top))
                       {
            flag=1;
            rs.next();
            out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");
            i++;
                     }
        out.println("</table>");
        if(flag==0)
            out.println("Record not Available");
        out.println("<a href=index.html>Home</a>");
        out.println("<a href=searchbyyear.html>Back</a>");
    }catch(Exception e){
    out.println(e);
    }
   %>
</html>
