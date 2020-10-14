<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animalTagSuccess.css">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!-- google font -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&family=Sunflower:wght@500&display=swap" rel="stylesheet">
<script>
$(function(){
	
	$(".ani-info-tag1").each(function () {
		var $color = $(this).attr('value');

        if ($color == 'silver') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_silver_2.png)');
        } else if ($color == 'gold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_gold_2.png)');
        } else if ($color == 'rosegold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_rosegold_2.png)');
        }
    });

	$(".ani-info-tag2").each(function () {
		var $color = $(this).attr('value');

        if ($color == 'silver') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_silver_2.png)');
        } else if ($color == 'gold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_gold_2.png)');
        } else if ($color == 'rosegold') {
            $($(this)).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/aniTag_rosegold_2.png)');
        }
    });

    $(".aniaml-tag-img").each(function() {
    	var $kind = $(this).attr('value');
        
		if($kind == '포메라니안'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_pome.png)');
		} else if($kind == '진돗개'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_jindo.png)');
		} else if($kind == '시바견'){
			$(this).css('background-image', 'url(${pageContext.request.contextPath}/resources/images/ani_siba.png)');
		}
    });

     $(".animal-tag-font").each(function() {
          var $font = $(this).attr('value');
          console.log($font);
          $(this).attr('style', 'font-family : '+ $font +'!important'); 
     });
});

     function animalTagList() {
         console.log(111);
         if(${ empty loginUser }) {
				alert("로그인 후 사용해주세요.");
				return;
         }
			location.href="${ pageContext.request.contextPath }/animalTag/animalTagList.do?userId=${ loginUser.userId }";
     }

	    
</script>
    <div id="main-wrap">
        <section class="main"></section>
        <section class="content-wrap">
            <h1>동물 인식표(결제내역)</h1>
            <p>펫에버에서는 이러한 일들을 합니다.</p>
            <div class="content">

	        <div class="drawsvg">
				<svg version="1.1" viewBox="0 0 700 300">
				  <symbol id="fade-text">
				    <text x="40%" y="35%" text-anchor="middle">동물 인식표 ♥</text>
				    <text x="55%" y="65%" text-anchor="middle">구매 감사합니다.</text>
				  </symbol>
				  <g>
				    <use class="stroke" xlink:href="#fade-text"/>
				    <use class="fill" xlink:href="#fade-text"/>
				  </g>
				</svg>                  
			</div>

                <div class="tag-wrap">
                    <div class="animal-tag-preview">
                    	<div class="ani-tag-front">
	                        <div class="ani-info-tag1" value="${ list.tagColor }">
	                        	<div class="aniaml-tag-img" id="ani-kind-${ list.tagAniKind }" value="${ list.tagAniKind }" ></div><br />
	                        	<label class="animal-tag-font" id="preview-name" value="${ list.tagFont }" for="">${ list.tagAniName }</label>
	                        </div>
                        <label class="preview-label preview-front" for="">앞면</label>
                    	</div>
                    	<div class="ani-tag-front">
	                        <div class="ani-info-tag2" value="${ list.tagColor }">
	                            <label class="animal-tag-font" id="preview-ssn" value="${ list.tagFont }" for="">${ list.tagAniSsn }</label><br>
	                            <label class="animal-tag-font" id="preview-person-name" value="${ list.tagFont }" for="">${ list.tagPersonName }</label><br>
	                            <label class="animal-tag-font" id="preview-person-phone" value="${ list.tagFont }" for="">${ list.tagPersonPhone }</label><br>
	                        </div>
	                        <label class="preview-label preview-back" for="">뒷면</label>
                    	</div>
	                    <div class="ani-tag-ssg">
	                    	<label class="ani-ssg1">수령인: </label><label class="ani-ssg2">${ list.ssgName }</label>
	                    	<label class="ani-ssg1">연락처: </label><label class="ani-ssg2">${ list.ssgTel }</label>
	                    	<label class="ani-ssg1">수령지: </label><label class="ani-ssg2"style="margin-bottom: 0px;">(${ list.ssgAddr0 }) ${ list.ssgAddr1 }</label>
	                    	<label class="ani-ssg1"></label><label class="ani-ssg2" style="margin: 0px;">${ list.ssgAddr2 }</label>
	                    	<label class="ani-ssg1">결제일시: </label><label class="ani-ssg2">${ list.buyDate }</label>
	                    </div>
                    </div>
                </div>
                <div class="div-pay-success">
                	<button type="button" class="btn-pay-success" onclick="location.href='${ pageContext.request.contextPath }/'">Home</button>
                	<button type="button" class="btn-pay-success" onclick="animalTagList();" style="margin-left: 55px;">구매내역</button>
                </div>
            </div>
        </section>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>