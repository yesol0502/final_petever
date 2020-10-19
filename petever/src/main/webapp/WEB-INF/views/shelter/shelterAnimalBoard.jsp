<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shelterAnimalBoard.css">

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<script>
$(function(){
	var area0 = ["서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];
    var area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
    var area2 = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
    var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
    var area4 = ["광산구", "남구", "동구", "북구", "서구"];
    var area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
    var area6 = ["남구", "동구", "북구", "중구", "울주군"];
    var area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];
    var area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
    var area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
    var area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];
    var area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"];
    var area12 = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
    var area13 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
    var area14 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
    var area15 = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
    var area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];

    $("select[name=city]").each(function(){
        console.log(this);
        $selectCity = $(this);
        $selectCity.append("<option value=>시/도 선택</option>");
        $.each(eval(area0), function() {
        	$selectCity.append("<option value=" + this + " "+ (this == '${param.city}' ? 'selected' : '') + ">" + this + "</option>");
        })
        $selectCity.next().next().append("<option value=''>구/군 선택</option>");
    });

    $("select[name=city]").change(function() {
        var area = "area" + $("option", $(this)).index($("option:selected", $(this))); //선택지역의 구군 Array
        console.log(area);
        var $province = $(this).next().next(); //성택영역 구군 객체
        // console.log($gugun);
        $("option", $province).remove();

        if(area == "area0"){
            $province.append("<option value=''>구/군 선택</option>");
        }else {
        	$province.append("<option value=''>구/군 선택</option>");
            $.each(eval(area), function() {
            	$province.append("<option value=" + this + " "+ (this == '${param.province}' ? 'selected' : '') + ">" + this + "</option>");
            });
        }
    });

    $("select[name=city]").each(function() {
        var area = "area" + $("option", $(this)).index($("option:selected", $(this))); //선택지역의 구군 Array
        console.log(area);
        var $province = $(this).next().next(); //성택영역 구군 객체
        // console.log($gugun);
        $("option", $province).remove();

        if(area == "area0"){
            $province.append("<option value=''>구/군 선택</option>");
        }else {
            $.each(eval(area), function() {
            	$province.append("<option value=''>구/군 선택</option>");
            	$province.append("<option value=" + this + " "+ (this == '${param.province}' ? 'selected' : '') + ">" + this + "</option>");
            });
        }
    });
});

function shelterAniDetail(shelterNo) {
	console.log(shelterNo);
	location.href="${ pageContext.request.contextPath }/shelter/shelterAnimalBoardDetail.do?shelterNo="+shelterNo;
}
</script>

   <div id="main-wrap">
       <section class="main"></section>
 	      <section class="content-wrap">
           <h1>유기동물 보호소</h1>
           <p>전국 동물 보호 센터 입니다. </p>
           <div class="content">
			<form action="${pageContext.request.contextPath}/shelter/shelterAnimalBoardXml.do" method="POST">
				<input type="submit" value="전송" style="" />
			</form>
           		<!-- 여기에 작성하시면 됩니다.! -->
            <div class="shelter-search-wrap">
                <form action="" method="GET">
                    <label for="city">시도</label>
                    <select name="city" id="city"></select>
                    <label for="province">구/군</label>
                    <select name="province" id="province"></select>
                    <label for="shelterName">보호소명</label>
                    <input type="text" name="shelterName" id="shelterName" value="${ param.shelterName }">
                    <input type="submit" value="검색" id="search-btn">
                </form>
            </div>
            <div class="sehlter-board-wrap">
                <table>
                    <tr>
                        <th class="tbl-th1">관할구역</th>
                        <th class="tbl-th2">보호센터명</th>
                        <th class="tbl-th3">전화번호</th>
                        <th class="tbl-th4">보호센터주소</th>
                    </tr>
                    <c:forEach items="${ list }" var="list">
                   	<tr>
                        <td class="tbl-th1">${ list.orgName }</td>
                        <td class="tbl-th2" onclick="shelterAniDetail(${ list.shelterNo })" style="cursor: pointer;">${ list.careName }</td>
                        <td class="tbl-th3">${ list.careTel}</td>
                        <td class="tbl-td4">${ list.careAddr }</td>
                    </tr>
                    </c:forEach>
                    <c:if test="${ empty list }">
                    	<td colspan="4" >조회된 유기 동물 보호소가 없습니다.</td>
                    </c:if>
                </table>
            </div>
            <div class="pageBar">
                ${ pageBar }
            </div>
            <c:if test="${ empty pageBar }">
            	<div class="pageBar" style="display: inline-block;"></div>
            </c:if>
           </div>
       </section>
   </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>