<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<div class="header">
            <div class="size">
                <div><a href="/project/index.do"><img src="<c:url value="/img/logo.png"></c:url>"></a></div>
                <div class="login">
                <c:if test="${empty userInfo }">
                    <a href="/project/user/login.do">로그인</a> | 
                    <a href="/project/user/join.do">회원가입</a>
                </c:if>
                <c:if test="${!empty userInfo }">
                    <a href="/project/user/logout.do">로그아웃</a> | 
                    <a href="/project/user/mypage.do">마이페이지</a>
                </c:if>
                </div>
            </div>
        </div>
        <div class="menu">
            <ul class="depth1">
                <li>
                    <a href="/project/company/index.do">회사소개</a>
                    <ul class="depth2">
                        <li><a href="/project/company/index.do">회사소개</a></li>
                        <li><a href="/project/company/map.do">오시는길</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">MENU2</a>
                    <ul class="depth2">
                        <li><a href="">MENU2-1</a></li>
                        <li><a href="">MENU2-2</a></li>
                        <li><a href="">MENU2-3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">MENU3</a>
                    <ul class="depth2">
                        <li><a href="">MENU3-1</a></li>
                        <li><a href="">MENU3-2</a></li>
                        <li><a href="">MENU3-3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="">MENU4</a>
                    <ul class="depth2">
                        <li><a href="">MENU4-1</a></li>
                        <li><a href="">MENU4-2</a></li>
                        <li><a href="">MENU4-3</a></li>
                    </ul>
                </li>
                <li>
                    <a href="/project/board/index.do">게시판</a>
                    <ul class="depth2">
                        <li><a href="/project/board/index.do">게시판</a></li>
                        <li><a href="/project/reply/index.do">답변게시판</a></li>
                        <li><a href="">MENU5-3</a></li>
                    </ul>
                </li>
            </ul>
        </div>