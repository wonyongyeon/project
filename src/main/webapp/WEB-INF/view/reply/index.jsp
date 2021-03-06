<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="util.CommonUtil1" %>
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
    	$(function(){
    		$(".board_tr").click(function(){
    			location.href='view.do?replyno='+$(this).data("replyno");
    			//console.log($(this).data("boardno"));
    		});
    	});
    </script>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/view/include/header.jsp" %>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">답변게시판</h3>
    
                <div class="bbs">
                    <table class="list">
                    <p><span><strong>총 ${totCount }개</strong>  |  ${replyVo.page }/${totPage }페이지</span></p>
                        <caption>게시판 목록</caption>
                        <colgroup>
                            <col width="80px" />
                            <col width="*" />
                            <col width="80px" />
                            <col width="100px" />
                            <col width="200px" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>조회수</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
						<c:if test="${empty list}">
                            <tr>
                                <td class="first" colspan="5">등록된 글이 없습니다.</td>
                            </tr>
						</c:if>
                        <c:if test="${!empty list}">
                        	<c:forEach var="vo" items="${list}" varStatus="status">
                            <tr class="board_tr" data-replyno="${vo.replyno}" style="cursor:pointer;">
                                <td>${(totCount-status.index) - ((replyVo.page-1)*10)} </td>
                                <td class="txt_l" style="text-align:left;">
                                    <c:if test="${vo.nested > 0 }">
                                    	<c:forEach begin="1" end="${vo.nested}">&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
                                    	<img src="/project/img/admin/answer_icon.gif">
                                    </c:if>
                                    ${vo.title } [${vo.c_count }]
                                </td>
                                <td>${vo.readcount }</td>
                                <td class="writer">
                                    ${vo.name }
                                </td>
                                <%-- <td class="date"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td> --%>
                                <td class="date">${vo.regdate}</td>
                            </tr>
                            </c:forEach>
                       </c:if>
                        </tbody>
                    </table>
                    <div class="btnSet"  style="text-align:right;">
                    <c:if test="${!empty userInfo}">
                        <a class="btn" href="write.do">글작성 </a>
                    </c:if>
                    <c:if test="${empty userInfo}">
                        <a class="btn" href="javascript:alert('로그인후 사용가능합니다.');location.href='/project/user/login.do';">글작성 </a>
                    </c:if>
                    </div>
                    <!-- 페이지처리 -->
                    ${CommonUtil.getPageArea("index.do", boardVo.page, totPage, 10)}
                    <!-- /페이지처리 -->                
                    <div class="bbsSearch">
                        <form method="get" name="searchForm" id="searchForm" action="">
                            <span class="srchSelect">
                                <select id="stype" name="searchType" class="dSelect" title="검색분류 선택">
                                    <option value="">전체</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                            </span>
                            <span class="searchWord">
                                <input type="text" id="sval" name="searchWord" value=""  title="검색어 입력">
                                <input type="button" id="" value="검색" title="검색">
                            </span>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/footer.jsp"%>
    </div>
</body>
</html>