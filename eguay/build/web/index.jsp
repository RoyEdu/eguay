<%-- 
    Document   : index
    Created on : 28-mar-2022, 10:54:36
    Author     : Roy Caro Jean Edouard 70% Parsa zendehdel nobari 30%
--%>

<%@page import="eguay.dto.UserDTO"%>
<%@page import="eguay.dto.AuctionDTO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="cabecera.jsp"/>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EGUAY - Inicio</title>
    </head>
    
    <style>

.dislike-button {
  display: inline-block;
  position: relative;
  font-size: 32px;
  cursor: pointer;
  color: #ffffff;
  background : #7d7373;
   
  &::before {
    font-size: 3em;
     color: #ffffff;
    content: '♥';
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
  }
  &::after {
    font-size: 3em;
    content: '♥';
    position: absolute;
    left: 50%;
    top: 50%;
    color: #ffffff;
    transform: translate(-50%, -50%) scale(0);
    transition: transform 0.2s;
  }
}
.like-button {
  display: inline-block;
  position: relative;
  font-size: 32px;
  cursor: pointer;
  color: #ffffff;
  background : #7d7373;
   
  &::before {
    font-size: 3em;
     color: #ff3252;
    content: '♥';
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
  }
  &::after {
    font-size: 3em;
    content: '♥';
    position: absolute;
    left: 50%;
    top: 50%;
    color: #ff3252;
    transform: translate(-50%, -50%) scale(0);
    transition: transform 0.2s;
  }
  
  .botones{
      display: inline-block;
      margin-right: 20px;
    }
  }



</style>

    <% 
        List<AuctionDTO> auctionList = (List) request.getAttribute("auctionList");
        SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss", Locale.ENGLISH);
        UserDTO user = (UserDTO) session.getAttribute("user");
        List<AuctionDTO> auctionFavList = null;
        
        if(user!=null){
            auctionFavList = (List<AuctionDTO>) request.getAttribute("favAuctions");
        }
    %>
    
    <body>   
        <div class="title">
            <p>¡Últimos productos!</p>
        </div>
                <%
                int cantidad = 0;
                
                for(AuctionDTO a : auctionList)
                {
                    if(a.isActive()){ 
                        if(cantidad == 0)
                        {
                %>
            <div class="flex-container">
                <%
                        }
                    String closeDate = "";
                    if(a.getCloseDate() != null){ 
                        closeDate = sdf.format(a.getCloseDate());
                    }
                %>
                <div class="card">
                    <% if(!a.getFotourl().equals("") )
                    { %>
                    <img src="<%= a.getFotourl() %>" style="width:100%; height: 50%">
                    <% }else { %>
                    <img src="img/placeholder.png" style="width:100%; height: 50%">
                    <% } %>
                    <% if(user != null) { %> 
                    <h4><a href="ProductServlet?id=<%= a.getId()%>"><%= a.getName() %></a></h4>
                    <% }else {  %>
                    <h4><a href="LoginServlet"><%= a.getName() %></a></h4>
                    <% } %>
                    <p class="description" style="margin: 5px"><%= a.getName() %></p>
                    <hr style="margin: 5px">
                    <p class="price">Precio Inicial: <%= a.getStartPrice() %>€</p>
                    <hr style="margin: 5px">
                    <% if(a.getCloseDate()!=null)
                    { %>
                    <p class="description" id="cd_<%= closeDate %>"></p>
                    <% } %>
                    <% if(a.getCloseNumberofBids()!=null)
                    { %>
                    <p class="description">¡Sólo quedan <%= a.getCloseNumberofBids() %> pujas disponibles!</p>
                    <% } %>
                    <% if(a.getClosePrice()!=null)
                    { %>
                    <p class="description" >¡Puja <%= a.getClosePrice() %>€ y te lo llevas!</p>
                    <% } %>
                    
                    <% if (user!=null) {
                        
                        %>
                        <div><button onclick="location.href='ProductServlet?id=<%= a.getId() %>'"/>Pujar
                        <%
                        if( auctionFavList.contains(a)){
                    %>    
                    <button onclick="location.href='RegisterFavAuction?id=<%= a.getId() %>'" class="like-buttonlike-button"/>♥ </div>
                    <% } else{ %>
                    <button onclick="location.href='RegisterFavAuction?id=<%= a.getId() %>'" class="dislike-button"/>x</div>
                    <% }} %>
                </div>
            <%
                cantidad++;
                    if(cantidad == 4)
                    {
            %>
            </div>
            <%
                    cantidad = 0;
                    }
                }}
                if(cantidad > 0){
            %>
            </div>
            <%
                }
            %>
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