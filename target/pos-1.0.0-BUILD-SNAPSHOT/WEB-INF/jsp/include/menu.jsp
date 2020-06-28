<%@page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- /. NAV TOP  -->
		<div class="collapse navbar-collapse" id="main_menu">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" aria-expanded="false" href="#" data-toggle="dropdown">암호관리<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${baseURL}/">암호관리</a></li>
                        <li><a href="${baseURL}/center_pwd_list">중앙서버 암호현황</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" aria-expanded="false" href="#" data-toggle="dropdown">Report<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${baseURL}/sco_report">SCO 레포트</a></li>
                    </ul>
                </li>    
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" aria-expanded="false" href="#" data-toggle="dropdown">공통코드<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${baseURL}/comm_code_view">공통코드</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" aria-expanded="false" href="#" data-toggle="dropdown">업무이력<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${baseURL}/work_history">업무이력</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" role="button" aria-expanded="false" href="#" data-toggle="dropdown">운영업무<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${baseURL}/make_newstore">신규점포등록</a></li>
                    </ul>
                </li>                                
            </ul>
        </div>
		