<%-- 
    Document   : searchbyyear.jsp
    Created on : Nov 13, 2015, 7:51:36 PM
    Author     : Archit
--%>
<html xmlns="http://www.w3.org/1999/xhtml">
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
  <h1><img src="baby_collage-708632.jpg" width="800" height="600" allign="middle" />
                            
                        </h1>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baby Names</title>
    </head>
    <body>
    <center> 
        <h1>Baby Names</h1>
    <%
    
    try{
        String sql="";
        int i=1;
        String syear=request.getParameter("syear");
        String eyear="2013";
        String sname=request.getParameter("sname");
        String sex=request.getParameter("sex"); 
       // out.println(year+","+top+","+sex);
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        if(sex.equals("M") || sex.equals("F"))
        sql="select syear,sname,gender,amount from hospital where syear between "+Integer.parseInt(syear)+" and "+Integer.parseInt(eyear)+" and sname like '"+sname+"' and gender='"+sex+"'"+" order by syear,position desc";
        else
        sql="select syear,sname,gender,amount from hospital where syear between "+Integer.parseInt(syear)+" and "+Integer.parseInt(eyear)+" and sname like '"+sname+"' order by syear,position desc";          
          // out.println(sql);       
        Connection con=DriverManager.getConnection("jdbc:odbc:geit");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        out.println("<table border=1"+" width='50%'>");
        out.print("<tr><th>Year</td><th>Name</th><th>Sex</th><th>Amount</th></tr>");
        int flag=0;
        while(rs.next())
                       {
            flag=1;
            out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td></tr>");
                       }
        out.println("</table>");
        if (flag==0)
            out.println("no record available");
        out.println("<a href=index.html>Back</a>");
    }catch(Exception e){
    out.println(e);
    }
            %>
</html>
