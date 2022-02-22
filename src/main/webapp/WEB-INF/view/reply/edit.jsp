<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://malsup.github.io/jquery.form.js"></script> 
    <script>
    	function goSave() {
    		if ($("#title").val() == '') {
    			alert("제목을 입력하세요");
    			$("#title").focus();
    			return;
    		}
    		//$("#frm").submit();
    		// serialize : 직렬화
    		// boardno=2&title=aaaa21&content=aaaa21
    		var data = $("#frm").serialize();
    		
    		$("#frm").submit();
    	}
    	$(function(){
    		$("#frm").ajaxForm({
    			url:'update.do',
    			success:function(res) {
    				alert('정상적으로 수정되었습니다.');
    				location.href='view.do?replyno=${data.replyno}';
    			},
    			error : function(error) {
    				console.log(error);
    			}
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
                <form method="post" name="frm" id="frm" action="update.do" enctype="multipart/form-data" >
                <input type="hidden" name="replyno" value="${data.replyno }">
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title" class="wid100" value="${data.title }"/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" id="content">${data.content }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                            	<input type="checkbox" name="delCheck" value="1">기존파일삭제(${data.filename_org })<br>
                                <input type="file" name="file">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="btnSet"  style="text-align:right;">
                        <a class="btn" href="javascript:goSave();">저장 </a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>