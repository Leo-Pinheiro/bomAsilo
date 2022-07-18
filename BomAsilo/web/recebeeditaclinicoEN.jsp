<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Especialidade" %>
<%@page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
  <header>
             <script>
                function validaAcesso(p1){
                   if(p1 === ""){
                     alert("You need to login first!");
                     window.top.location.href = "indexEN.html";
                   } else if(p1 !== "adm"){
                    alert("You don't have the acess to this page!"); 
                    window.top.location.href = "menuEN.jsp";
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
        
       <%   
            Clinico cli = new Clinico();
            cli.setIdClinico(Integer.parseInt(request.getParameter("idClinico")));
            cli.setNomeClinico(request.getParameter("nomeClinico"));
            cli.setIdEspecialidade(Integer.parseInt(request.getParameter("idEspecialidade")));
            cli.setCodRegistro(request.getParameter("codRegistro"));
          
                                      
            if(cli.alterarClinico()){
                response.sendRedirect("consultaclinicoEN.jsp?pmensagem=" +URLEncoder.encode("Doctor Saved", "UTF-8"));
            } else {
                response.sendRedirect("consultaclinicoEN.jsp?pmensagem=" +URLEncoder.encode("Error in Saving Doctor", "UTF-8"));
            }          
        %>             
       <hr />
    </body>
</html>

