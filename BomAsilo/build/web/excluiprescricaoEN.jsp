<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Prescricao"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "indexEN.html";
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
                    alert("You don't have the acess to this page!");
                    window.top.location.href = "menuEN.jsp";
                }
            }
        </script> 
    </header>
    <body>
         <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null) {
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");
        %>


        <%
            Integer idPrescricao = Integer.parseInt(request.getParameter("idPrescricao"));
            Prescricao p = new Prescricao();
            if (idPrescricao != 0) {
                p = p.consultarPrescricao(idPrescricao);
                if (p.excluirPrescricao()) {
                    response.sendRedirect("consultaprescricaoEN.jsp?pmensagem=" + URLEncoder.encode("Prescription Sucessfully Deleted", "UTF-8"));
                } else {
                    response.sendRedirect("consultaprescricaoEN.jsp?pmensagem=" + URLEncoder.encode("Error in Deleting Prescription", "UTF-8"));
                }
            }
        %>
        <hr /> 
    </body>
</html>

