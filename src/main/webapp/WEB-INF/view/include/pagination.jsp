<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/project/css/reset.css"/>
    <link rel="stylesheet" href="/project/css/common.css"/>
    <link rel="stylesheet" href="/project/css/contents.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/project/js/common.js"></script>
    <script>
	    $(function() {
	    	paging('paging', );
		});
    </script>
</head>
<body>
						<ul class='paging'>
                        <c:if test="${startPage > pageRange }">
                        	<li><a href="index.do?page=${startPage-1}"> < </a>
                        </c:if>
                        <c:forEach var="rp" begin="${startPage }" end="${endPage}">
                            <li><a href='javascript:location.href="index.do?page=${rp}";' <c:if test="${rp==boardVo.page}">class='current'</c:if>>${rp}</a></li>
                        </c:forEach>
                        <c:if test="${totPage > endPage }">
                        	<li><a href="index.do?page=${endPage+1}"> > </a>
                        </c:if>
                        </ul>
</body>
</html>