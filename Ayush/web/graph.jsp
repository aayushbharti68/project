<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baby Graph</title>
    </head>
 
 <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
 <style>
#id {
    background: url(images/cuty.jpg);
    background-size:1380px 800px;
    background-repeat: no-repeat;
    background-attachment:fixed; 
} 
    </style>
    <body id="id" >

       <%
         String name=request.getParameter("bname");
         
         String yr=request.getParameter("year");
         String gen=request.getParameter("sex");
         int maxyr=2013;
         int yrs=Integer.parseInt(yr);
            
         PreparedStatement ps=null;
         Connection con;
         ResultSet rs=null;
     
         //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         Class.forName("com.mysql.jdbc.Driver");
         //con=DriverManager.getConnection("jdbc:odbc:geit","","");
         
         con=DriverManager.getConnection("jdbc:mysql://localhost/geit","root","root");
         
         out.println("<h2><i>The popularity of the name "+name+" is as follows</h2>");
         %>
         <div id="myfirstchart" style="height: 250px;"></div>
         <script>
        new Morris.Bar({
  // ID of the element in which to draw the chart.
  element: 'myfirstchart',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: [
  <%
            while(yrs<=maxyr)
         {
                //ps=con.prepareStatement("select * from baby_names where gender='"+gen+"' and year="+yrs+" and name='"+name+"'");
         ps=con.prepareStatement("select * from baby_names where gender='"+gen+"' and year="+yrs+" and name='"+name+"'");
         rs=ps.executeQuery();
         if(rs.next())
         {
            String val = rs.getString(4);
            
  %>
         
                  { year:'<%=yrs%>', value:<%=val%> },
         <%
         }
         yrs++;
         rs=null;
         
         }
 
        %>
  
   
    
  ],
  // The name of the data record attribute that contains x-values.
  xkey: 'year',
  // A list of names of data record attributes that contain y-values.
  ykeys: ['value'],
  // Labels for the ykeys -- will be displayed when you hover over the
  // chart.
  labels: ['Value']
});
        
        </script>
      
        
        <%@include file="footer.html"%>
        
    </body>
    
</html>
