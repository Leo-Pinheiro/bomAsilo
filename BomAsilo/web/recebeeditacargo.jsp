
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Cargo" %>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
  <header>
             <script>
                function validaAcesso(p1){
                   if(p1 === ""){
                     alert("Realize o acesso!");
                     window.top.location.href = "index.html";
                   } else if(p1 !== "adm"){
                    alert("Você não possui acesso a esta página!"); 
                    window.top.location.href = "menu.jsp";
                   }
                }   
            </script> 
    </header>
    <body>
            <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null){
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);            
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");  
        %>
        <h1>Cargo Editado</h1>
        
    <%
        //recebe os valores da tela HTML  
            String descCargo  = request.getParameter("descCargo");
            Integer idCargo  = Integer.parseInt(request.getParameter("idCargo"));               
            //instancia o Cargo
            Cargo car = new Cargo();
            car.setDescCargo(descCargo);
            car.setIdCargo(idCargo);
                      
            if(car.alterarCargo()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultacargo.jsp?pmensagem=" +URLEncoder.encode("Cargo editado com sucesso", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultacargo.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar cargo", "UTF-8"));
            }          
        %>        
      </body>
</html>

