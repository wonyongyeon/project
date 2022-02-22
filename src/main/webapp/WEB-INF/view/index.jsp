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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script src="/project/js/common.js"></script>
    <script src="/project/js/main.js"></script>
    <script>
    	$(function() {
    		console.log(document.cookie.indexOf("mainPopup=popup"));
    		if (document.cookie.indexOf("mainPopup=popup") < 0) {
    			$(".divPop").show();
    		}
    	});
    </script>
</head>
<body>
<div class="divPop">
    <img src="/project/img/event_popup.png">
    <div style="text-align:right;background-color:#000;">
    	<a href="javascript:popupCookie('divPop');" style="color:#fff;">[오늘하루열지않기]</a> &nbsp;&nbsp;&nbsp;
    	<a href="javascript:$('.divPop').hide();" style="color:#fff;">[닫기]</a>
    </div>
</div>
    <div class="wrap">
        <%@ include file="/WEB-INF/view/include/header.jsp" %>
        <div class="visual">
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                  <div class="swiper-slide" style="background-image: url('/project/img/visual1.png');"></div>
                  <div class="swiper-slide" style="background-image: url('/project/img/visual2.png');"></div>
                  <div class="swiper-slide" style="background-image: url('/project/img/visual3.png');"></div>
                  <div class="swiper-slide" style="background-image: url('/project/img/visual4.png');"></div>
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>
        <div class="container">
            <div class="size">
                <div class="section">
                    <img src="/project/img/section1_1.png">
                </div>
                <div class="section">
                    <img src="/project/img/section1_2.png">
                </div>
                <div class="section">
                    <img src="/project/img/section1_3.png">
                </div>
                <div class="section">
                    <img src="/project/img/section1_4.png">
                </div>
                <div class="section">
                    <img src="/project/img/section1_5.png">
                </div>
                <div class="section">
                    <img src="/project/img/section1_6.png">
                </div>
            </div>
        </div>
        <div class="info">
            <div class="content">
                <div class="board_area">
                    <div class="board_title on">공지사항</div>
                    <div class="board_title">자료실</div>
                    <div class="board_content" id="board_notice">
                        <ul>
                            <li>공지사항입니다.<span>2021-12-09</span></li>
                            <li>공지사항입니다.<span>2021-12-09</span></li>
                            <li>공지사항입니다.<span>2021-12-09</span></li>
                            <li>공지사항입니다.<span>2021-12-09</span></li>
                            <li>공지사항입니다.<span>2021-12-09</span></li>
                            <li>공지사항입니다.<span>2021-12-09</span></li>
                            <li>공지사항입니다.<span>2021-12-09</span></li>
                            <li>공지사항입니다.<span>2021-12-09</span></li>
                        </ul>
                    </div>
                    <div class="board_content" id="board_data">
                        <ul>
                            <li>자료실입니다.<span>2021-12-09</span></li>
                            <li>자료실입니다.<span>2021-12-09</span></li>
                            <li>자료실입니다.<span>2021-12-09</span></li>
                            <li>자료실입니다.<span>2021-12-09</span></li>
                            <li>자료실입니다.<span>2021-12-09</span></li>
                            <li>자료실입니다.<span>2021-12-09</span></li>
                            <li>자료실입니다.<span>2021-12-09</span></li>
                            <li>자료실입니다.<span>2021-12-09</span></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="content">
                <div class="youtube_area">
                    <iframe width="100%" height="400" src="https://www.youtube.com/embed/41zk2bV0pAA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
            </div>
        </div>
        <div class="banner">
            <div class="swiper partner_slide">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                      <div class="img">
                          <img src="/project/img/partner_1.png">
                      </div>
                  </div>
                  <div class="swiper-slide">
                    <div class="img">
                        <img src="/project/img/partner_2.png">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="img">
                        <img src="/project/img/partner_3.png">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="img">
                        <img src="/project/img/partner_4.png">
                    </div>
                </div>
                <div class="swiper-slide">
                    <div class="img">
                        <img src="/project/img/partner_5.png">
                    </div>
                </div>
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>
</body>
</html>