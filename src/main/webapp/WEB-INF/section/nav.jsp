<%--
  Created by IntelliJ IDEA.
  User: kpss
  Date: 10/1/21
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>

<nav class="navbar navbar-default bg-primary ">
    <div class="navbar-header">
        <a class="navbar-brand mb-0 h1" href="/welcome">Social network</a>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
    <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            мой профиль
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a href="/${CURRENT_PROFILE.username}"><i class="fa fa-eye"></i>Мой профиль</a></li>
            <li><a href="/edit"><i class="fa fa-pencil"></i>Изменить</a></li>
            <li><a href="/edit/password"><i class="fa fa-unlock-alt"></i>Пароль</a></li>
            <li><a href="/remove"><i class="fa fa-trash-o"></i>Удалить</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="javascript:resume.logout('${_csrf.token}');"><i class="fa fa-sign-out"></i>Выйти</a>
            </li>
        </div>
    </div>
</nav>