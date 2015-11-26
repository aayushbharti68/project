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
    background-size:1300px 800px;
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
     
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
         out.println("<center><h2><i>Popularity of the "+name+" is</h2></center>");
         %>
         <div id="myfirstchart" style="height: 250px;"></div>
         <script>
        new Morris.Line({
  // ID of the element in which to draw the chart.
  element: 'myfirstchart',
  // Chart data records -- each entry in this array corresponds to a point on
  // the chart.
  data: [
  <%
            while(yrs<=maxyr)
         {
         ps=con.prepareStatement("select * from "+gen+""+yrs+" where Given_Name='"+name+"'");
         rs=ps.executeQuery();
         if(rs.next()){%>
                     
                  { year:'<%=yrs%>', value:<%=rs.getString(3)%> },
                      
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

