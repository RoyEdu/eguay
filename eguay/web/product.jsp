<%-- 
    Document   : product
    Created on : 12-abr-2022, 21:24:03
    Author     : Parsa zendehdel nobari
--%>

<%@page import="eguay.dto.AuctionDTO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="eguay.entity.Auction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EGUAY</title>
    </head>
    
    <%
        AuctionDTO auction = (AuctionDTO) request.getAttribute("auction");
        
        SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss", Locale.ENGLISH);
        String closeDate = "";
        if(auction.getCloseDate() != null){ 
            closeDate = sdf.format(auction.getCloseDate());
        }
    %>
    
    <jsp:include page="cabecera.jsp"/>
    
    <body>
        <h1 style="margin-left: 100px;"><%= auction.getName() %></h1>
        <br>
        <img style="margin-left: 100px;" src="<%= auction.getFotourl() %>">
        <br>
        <br>
        <h2 style="margin-left: 100px;">Cierre(s) de puja:</h2>
        <br>
        <% if(auction.getCloseDate()!=null)
        { %>
        <p style="margin-left: 100px;" class="description" id="cd_<%= closeDate %>"></p>
        <% } %>
        <% if(auction.getCloseNumberofBids()!=null)
        { %>
        <p style="margin-left: 100px;" class="description">¡Sólo quedan <%= auction.getCloseNumberofBids() %> pujas disponibles!</p>
        <% } %>
        <% if(auction.getClosePrice()!=null)
        { %>
        <p style="margin-left: 100px;" class="description" >¡Puja <%= auction.getClosePrice() %>$ y te lo llevas!</p>
        <% } %>
        <br>
        <hr>
        <br>
        <button style="margin-left: 100px;" onclick="window.location.href='DirectPurchaseServlet?id=<%= auction.getId() %>';">
         Puja Directa</button>
        <button  onclick="window.location.href='SubmitBidServlet?id=<%= auction.getId() %>';"> Puja </button>
        
        
    <script>
            function TimeRemaining(){
                var els = document.querySelectorAll('[id^="cd_"]');
                for (var i=0; i<els.length; i++) {
                      var el_id = els[i].getAttribute('id');
                      var end_time = el_id.split('_')[1];
                      var deadline = new Date(end_time);
                  var now = new Date();
                  var t = Math.floor(deadline.getTime() - now.getTime());
                  var days = Math.floor(t / (1000 * 60 * 60 * 24));
                  var hours = Math.floor((t % (1000 * 60 * 60 * 24))/(1000 * 60 * 60));
                  var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
                  var seconds = Math.floor((t % (1000 * 60)) / 1000);
                  if (t < 0) {
                     document.getElementById("cd_" + end_time).innerHTML = 'EXPIRED';
                  }else{
                     document.getElementById("cd_" + end_time).innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s";
                  }
                }
             }

        function StartTimeRemaining(){
            TimeRemaining();
                setInterval(function(){
                        TimeRemaining();
                }, 1000)
        }


        StartTimeRemaining();
        </script>
    </body>
</html>
