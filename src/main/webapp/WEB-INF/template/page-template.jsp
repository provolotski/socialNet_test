<%--
  Created by IntelliJ IDEA.
  User: kpss
  Date: 10/1/21
  Time: 8:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>social network</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="../section/css.jsp"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
</head>
<body>
<jsp:include page="../section/header.jsp"/>
<jsp:include page="../section/nav.jsp"/>
<section class="main">
        <sitemesh:write property='body' />
</section>
<jsp:include page="../section/footer.jsp"/>
<jsp:include page="../section/js.jsp"/>
</body>
</html>