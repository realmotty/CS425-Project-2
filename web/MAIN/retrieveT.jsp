<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="edu.jsu.mcis.scheduleplannerproject2.dao.*"%>
<jsp:useBean id="projBean" class="edu.jsu.mcis.scheduleplannerproject2.Bean" scope="session"/>


<%
    DAOFactory daoFactory = null;
    ServletContext context = request.getServletContext();

    if (context.getAttribute("daoFactory") == null) {
        System.err.println("*** Creating new DAOFactory ...");
        daoFactory = new DAOFactory();
        context.setAttribute("daoFactory", daoFactory);
    }
    else {
        daoFactory = (DAOFactory) context.getAttribute("daoFactory");
    }
    
    SearchDAO searchDAO = daoFactory.getSearchDAO();
        
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dynamic Schedule</title>
        <script type="text/javascript" src="<%= request.getContextPath() %>/MAIN/scripts/p2JS.js"></script>
        <script type="text/javascript" src="<%= request.getContextPath() %>/MAIN/scripts/jquery-3.6.1.min.js"></script>
    </head>
    <body>
        <a href="landing.jsp">Back</a>
        <form action="<%= request.getContextPath() %>/MAIN/search.jsp" method="GET">
            <fieldset>
                <legend>Search by Term:</legend>
                <p>
                        <%= searchDAO.getTermListAsHTML() %>
                <p>

                <input type="submit" value="Submit">

                <p>
                    <input type="button" value="Logout" onclick="window.open('<%= request.getContextPath() %>/main/logout.jsp', '_self', false);" />
                </p>
            </fieldset>
        </form>
        
    </body>
</html>
