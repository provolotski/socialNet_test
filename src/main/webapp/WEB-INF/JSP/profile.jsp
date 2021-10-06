<%--
  Created by IntelliJ IDEA.
  User: kpss
  Date: 10/1/21
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="socialNetwork" tagdir="/WEB-INF/tags" %>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <socialNetwork:profile-main />
            <socialNetwork:profile-languages />
            <socialNetwork:profile-hobbies />
            <socialNetwork:profile-info />
        </div>
        <div class="col-md-8 col-sm-6">
            <socialNetwork:profile-objective/>
            <socialNetwork:profile-skills />
            <socialNetwork:profile-practics />
            <socialNetwork:profile-certificates/>
            <socialNetwork:profile-cources/>
            <socialNetwork:profile-education />
        </div>
    </div>
</div>