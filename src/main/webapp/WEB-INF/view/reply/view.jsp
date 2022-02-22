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
    	function del() {
    		if (confirm("삭제하시겠습니까?")) {
    			$.ajax({
    				url:'deleteAjax.do',
    				data:{replyno:${data.replyno}},
    				success:function(res) {
    					if (res.trim() == '1') {
	    					alert('정상적으로 삭제되었습니다.');
	    					location.href='index.do';
    					} else {
    						alert('삭제 오류');
    					}
    				}
    			});

    		}
    	}
    	
    	function goSave() {
    		$.ajax({
    			url:'/project/comment/insert.do',
    			type:'post',
    			data:$("#frm").serialize(),
    			success:function(res) {
    				if (res.trim() == '1') {
    					alert('댓글이 등록되었습니다.');
    					$("#content").val("");
    					commentList('reply', ${data.replyno});
    				} else {
    					alert('댓글 등록 오류');
    				}
    			}
    		})
    	}
    	function commentList(tablename, boardno) {
    		$.ajax({
    			url : '/project/comment/list.do',
    			data : {tablename:tablename, boardno:boardno},
    			success:function(res) {
    				$("#commentArea").html(res);
    			}
    		})
    	}
    	$(function() {
    		commentList('reply', ${data.replyno});
    	});
    	function goDel(c_no) {
    		if (confirm('댓글을 삭제하시겠습니까?')) {
    			$.ajax({
    				url:"/project/comment/delete.do",
    				data:{c_no : c_no},
    				success : function(res) {
    					if (res.trim() == '1') {
    						alert('정상적으로 삭제되었습니다.');
    						commentList('reply', ${data.replyno});
    					} else {
    						alert('삭제 오류');
    					}
    				}
    			})
    		}
    	}
    </script>
</head>
<body>
    <div class="wrap">
        <%@ include file="/WEB-INF/view/include/header.jsp" %>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">답변게시판</h3>
                <div class="bbs">
                    <div class="view">
                        <div class="title">
                            <dl>
                                <dt>${data.title }</dt>
                                <dd class="date">작성일 : ${data.regdate } </dd>
                            </dl>
                        </div>
                        <div class="cont"><p>${data.content }</p> </div>
                        <dl class="file">
                            <dt>첨부파일 </dt>
                            <dd>
                            <a href="/project/common/download.jsp?path=/upload/&org=${data.filename_org}&real=${data.filename_real}" 
                            target="_blank">${data.filename_org } </a></dd>
                        </dl>
                                    
                        <div class="btnSet clear">
                            <div class="fl_l">
                            	<a href="index.do" class="btn">목록으로</a>
                            	<a href="edit.do?replyno=${data.replyno }" class="btn">수정</a>
                            	<a href="reply.do?replyno=${data.replyno }" class="btn">답변</a>
                            	<a href="javascript:del();" class="btn">삭제</a>
                            </div>
                        </div>
                
                    </div>
                    <div>
                    <c:if test="${!empty userInfo}">
                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
                    	<input type="hidden" name="tablename" value="reply">
                    	<input type="hidden" name="boardno" value="${data.replyno}">
                    	<input type="hidden" name="userno" value="${userInfo.userno }">
                        <table class="board_write">
                            <colgroup>
                                <col width="*" />
                                <col width="100px" />
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>
                                    <textarea name="content" id="content" style="height:50px;"></textarea>
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn" href="javascript:goSave();">저장 </a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                    </c:if>
                    <div id="commentArea"></div>
                    
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>