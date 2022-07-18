<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Familiar"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                   } else if(p1 !== "familiar"){
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
        //recebe os valores da tela HTML 
         
            //instancia o Paciente
            Familiar familiar = new Familiar();
            familiar.setIdFamiliar       (Integer.parseInt(request.getParameter("idFamiliar")));
            familiar.setNome             (request.getParameter("nome"));
            familiar.setCpfFamiliar      (request.getParameter("cpfFamiliar"));
            familiar.setRg               (request.getParameter("rg"));
            familiar.setFoneFixo         (request.getParameter("foneFixo"));
            familiar.setFoneCelular      (request.getParameter("foneCelular"));
            familiar.setLoginFamiliar    (request.getParameter("loginFamiliar"));
            familiar.setEnderecoFamiliar (Integer.parseInt(request.getParameter("enderecoFamiliar")));
            familiar.setCpfPaciente      (request.getParameter("cpfPaciente"));
          
            if(familiar.alterarFamiliar()){
                response.sendRedirect("familiarvisualizarfamiliarEN.jsp?pmensagem=Family Member Saved");
            } else {
                response.sendRedirect("familiarvisualizarfamiliarEN.jsp?pmensagem=Error in Saving Family Member");
            }          
        %>        
       <hr />
    </body>
</html>
