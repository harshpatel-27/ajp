
<%@ page language="java" import="beans.BankAccount" %>
<jsp:useBean id="account" class="beans.BankAccount" scope="session" />

<%
    String action = request.getParameter("action");

    if ("Deposit".equals(action)) {
        double depositAmount = Double.parseDouble(request.getParameter("depositAmount"));
        account.deposit(depositAmount);
        out.println("<script>alert('Deposit Successful!');</script>");
    }
    
    else if ("Withdraw".equals(action)) {
        double withdrawAmount = Double.parseDouble(request.getParameter("withdrawAmount"));
        if (!account.withdraw(withdrawAmount)) {
            out.println("<script>alert('Insufficient Balance!');</script>");
        } else {
            out.println("<script>alert('Withdrawal Successful!');</script>");
        }
    }

    response.sendRedirect("index.jsp");
%>