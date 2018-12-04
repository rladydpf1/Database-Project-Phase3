<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join membership</title>
</head>
<body>
<h1>회원가입 페이지 입니다!</h1>
<hr>
<form action = "joinSession.jsp" method="post">
	<h3> 아래는 필수 입력사항 입니다.</h3> <br>
	아이디(5~10자): <input type = "text" name = "id"><br>
	패스워드(5~10자): <input type = "password" name = "passwd"><br>
	이름: <input type = "text" name = "name"><br>
	주소: <input type = "text" name = "address"><br>
<!--	주소: <select name = "c1" onChange = "c1Change(this.value,c2)">
			<option selected>-선택-</option>
			<option value="1">서울</option>
			<option value="2">경기</option>
			<option value="3">강원</option>
			<option value="4">충남</option>
			<option value="5">충북</option>
			<option value="6">경북</option>
			<option value="7">경남</option>
			<option value="8">전북</option>
			<option value="9">전남</option>
			<option value="10">제주</option>
			<option value="11">인천</option>
			<option value="12">대전</option>
			<option value="13">광주</option>
			<option value="14">대구</option>
			<option value="15">울산</option>
			<option value="16">부산</option>
			<option value="17">세종</option>
			</select>
		<select name = "c2" onChange = "c2Change(this.value,c3)">
			<option selected>-선택-</option>
			</select>
		<select name = "c3" onChange = "c3Change(this.value, c1, c2)">
			<option selected>-선택-</option>
			</select>
			
			<input type = "hidden" name = "c1name" value="c1name">
			<input type = "hidden" name = "c2name" value="c2name">
			<input type = "hidden" name = "c3name" value="c3name%">-->
			<br>
	휴대전화(- 포함해서 입력): <input type = "text" name = "phone"><br>
	<h3> 아래는 선택 입력사항 입니다.</h3> <br>
	성별: <select name = "sex" >
			<option value="0" selected>-선택-</option>
			<option value="M">남자</option>
			<option value="F">여자</option>
			</select> <br>
	나이: <input type = "number" name = "age"> <br>
	직업: <input type = "text" name = "job"> <br>
	<input type = "submit" value = "회원정보 등록">
	</form>

<!--
var c1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17);
var c1_name = new Array('서울','경기','강원','충남','충북','경북','경남','전북','전남','제주','인천','대전','광주','대구','울산','부산','세종');
var c2_num = new Array();
var c2_name = new Array();
c2_num[1] = new Array(18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42);
c2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
c2_num[2] = new Array(43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73);
c2_name[2] = new Array('고양시','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안성시','안양시','양주시','여주시' ,'오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','포천시','하남시','화성시','가평군','양평군','연천군');
c2_num[3] = new Array(74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91);
c2_name[3] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
c2_num[4] = new Array(92,93,94,95,96,97,98,99,100,101,102,103,104,105,106);
c2_name[4] = new Array('계룡시','공주시','논산시','당진시','보령시','서산시','아산시','천안시','금산군','부여군','서천군','예산군','청양군','태안군','홍성군');
c2_num[5] = new Array(107,108,109,110,111,112,113,114,115,116,117);
c2_name[5] = new Array('제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','증평군','진천군');
c2_num[6] = new Array(118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140);
c2_name[6] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','예천군','영덕군','영양군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
c2_num[7] = new Array(141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158);
c2_name[7] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');
c2_num[8] = new Array(159,160,161,162,163,164,165,166,167,168,169,170,171,172);
c2_name[8] = new Array('전주시','군산시','김제시','남원시','익산시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
c2_num[9] = new Array(173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194);
c2_name[9] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','해남군','함평군','화순군');
c2_num[10] = new Array(195,196);
c2_name[10] = new Array('서귀포시','제주시');
c2_num[11] = new Array(197,198,199,200,201,202,203,204,205,206);
c2_name[11] = new Array('계양구','남동구','동구','미추홀구','부평구','서구','연수구','중구','강화군','옹진군');
c2_num[12] = new Array(207,208,209,210,211);
c2_name[12] = new Array('대덕구','동구','서구','유성구','중구');
c2_num[13] = new Array(212,213,214,215,216);
c2_name[13] = new Array('광산구','남구','동구','북구','서구');
c2_num[14] = new Array(217,218,219,220,221,222,223,224);
c2_name[14] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');
c2_num[15] = new Array(225,226,227,228,229);
c2_name[15] = new Array('남구','동구','북구','중구','울주군');
c2_num[16] = new Array(230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245);
c2_name[16] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
var c3_num = new Array();
var c3_name = new Array();
c3_num[18] = new Array(246,247,248,249,250,251,252,253,254,255); /*강남구*/
c3_name[18] = new Array('개포동','논현동','대치동','도곡동','삼성동','세곡동','수서동','신사동','압구정동','역삼동');
c3_num[19] = new Array(260,261,262,263,264,265,266,267,268);
c3_name[19] = new Array('강일동','고덕동','길동','둔촌동','명일동','상일동','성내동','암사동','천호동');
c3_num[20] = new Array(269,270,271,272);
c3_name[20] = new Array('미아동','번동','수유동','우이동');
c3_num[24] = new Array(273,274,275,276); /*구로구*/
c3_name[24] = new Array('온수동','궁동','고척동','신도림동');
c3_num[26] = new Array(277,278,279,280,281); /*노원구*/
c3_name[26] = new Array('월계동','공릉동','하계동','상계동','중계동');
c3_num[30] = new Array(282,283,284,285); /*마포구*/
c3_name[30] = new Array('공덕동','구수동','노고산동','당인동');
c3_num[32] = new Array(286,287,288); /*서초구*/
c3_name[32] = new Array('반포동','양재동','잠원동');
c3_num[52] = new Array(289,290,291); /*부천시*/
c3_name[52] = new Array('내동','상동','원미동');
c3_num[53] = new Array(292,293,294); /*성남시*/
c3_name[53] = new Array('구미동','성남동','야탑동');
c3_num[54] = new Array(295,296,297); /*수원시*/
c3_name[54] = new Array('송죽동','영화동','하동');
c3_num[56] = new Array(298,299,230); /*안산시*/
c3_name[56] = new Array('사동','월피동','초지동');
c3_num[74] = new Array(231,232,233); /*강릉시*/
c3_name[74] = new Array('교동','포남동','홍제동');
c3_num[78] = new Array(234,235,236); /*원주시*/
c3_name[78] = new Array('개운동','단구동','무실동');
c3_num[77] = new Array(237,238,239); /*속초시*/
c3_name[77] = new Array('금호동','장사동','청호동');
c3_num[99] = new Array(240,241,242); /*천안시*/
c3_name[99] = new Array('봉명동','일봉동','중앙동');
c3_num[98] = new Array(243,244,245); /*아산시*/
c3_name[98] = new Array('신동','온천동','풍기동');
c3_num[93] = new Array(246,247,248); /*공주시*/
c3_name[93] = new Array('금학동','신관동','주미동');
c3_num[108] = new Array(249,250,251); /*청주시*/
c3_name[108] = new Array('강서동','복대동','신봉동');
c3_num[109] = new Array(252,253,254); /*충주시*/
c3_name[109] = new Array('교현동','금릉동','직동');
c3_num[120] = new Array(255,256,257); /*구미시*/
c3_name[120] = new Array('사곡동','원평동','형곡동');
c3_num[124] = new Array(258,259,260); /*안동시*/
c3_name[124] = new Array('노하동','옥동','태화동');
c3_num[127] = new Array(261,262,263); /*포항시*/
c3_name[127] = new Array('대잠동','우현동','청림동');
c3_num[147] = new Array(264,265,266); /*진주시*/
c3_name[147] = new Array('동성동','신안동','인사동');
c3_num[144] = new Array(267,268,269); /*밀양시*/
c3_name[144] = new Array('교동','내이동','삼문동');
c3_num[145] = new Array(270,271,272); /*사천시*/
c3_name[145] = new Array('동림동','이금동','좌룡동');
c3_num[159] = new Array(273,274,275); /*전주시*/
c3_name[159] = new Array('금암동','만성동','진북동');
c3_num[160] = new Array(276,277,278); /*군산시*/
c3_name[160] = new Array('개정동','영동','조촌동');
c3_num[163] = new Array(279,280,281); /*익산시*/
c3_name[163] = new Array('동산동','송학동','어양동');
c3_num[174] = new Array(282,283,284); /*나주시*/
c3_name[174] = new Array('대호동','송월동','영산동');
c3_num[175] = new Array(285,286,287); /*목포시*/
c3_name[175] = new Array('부주동','삼향동','옥암동');
c3_num[177] = new Array(288,289,290); /*여수시*/
c3_name[177] = new Array('국동','둔덕동','여서동');
c3_num[195] = new Array(291,292,293); /*서귀포시*/
c3_name[195] = new Array('동홍동','서홍동','토평동');
c3_num[196] = new Array(294,295,296); /*제주시*/
c3_name[196] = new Array('건입동','도남동','이도2동');
c3_num[199] = new Array(297,298,299); /*동구*/
c3_name[199] = new Array('금곡동','만석동','송림동');
c3_num[202] = new Array(300,301,302); /*서구*/
c3_name[202] = new Array('가좌동','불로동','청라동');
c3_num[204] = new Array(303,304,305); /*중구*/
c3_name[204] = new Array('관동','사동','운서동');
c3_num[207] = new Array(306,307,308); /*대덕구*/
c3_name[207] = new Array('대화동','법동','송촌동');
c3_num[208] = new Array(309,310,311); /*동구*/
c3_name[208] = new Array('대동','소제동','효동');
c3_num[210] = new Array(312,313,314); /*유성구*/
c3_name[210] = new Array('궁동','덕명동','송강동');
c3_num[213] = new Array(315,316,317); /*남구*/
c3_name[213] = new Array('노대동','서동','행암동');
c3_num[214] = new Array(318,319,320); /*동구*/
c3_name[214] = new Array('불로동','용산동','학동');
c3_num[215] = new Array(321,322,323); /*북구*/
c3_name[215] = new Array('누문동','삼각동','오치동');
c3_num[220] = new Array(324,325,326); /*북구*/
c3_name[220] = new Array('검단동','대현동','읍내동');
c3_num[222] = new Array(327,328,329); /*수성구*/
c3_name[222] = new Array('두산동','만촌동','범어동');
c3_num[223] = new Array(330,331,332); /*중구*/
c3_name[223] = new Array('남산동','달성동','수동');
c3_num[225] = new Array(333,334,335); /*남구*/
c3_name[225] = new Array('고사동','두왕동','옥동');
c3_num[226] = new Array(336,337,338); /*동구*/
c3_name[226] = new Array('방어동','서부동','화정동');
c3_num[227] = new Array(339,340,341); /*북구*/
c3_name[227] = new Array('대안동','송정동','연암동');
c3_num[237] = new Array(342,343,344); /*사상구*/
c3_name[237] = new Array('감전동','덕포동','삼락동');
c3_num[238] = new Array(345,346,347); /*사하구*/
c3_name[238] = new Array('감천동','구평동','당리동');
c3_num[244] = new Array(348,349,350); /*해운대구*/
c3_name[244] = new Array('반송동','우동','중동');
function c1Change(key,sel){
if(key == '') return;
else if(key == 17) { /* 세종시는 기초자치단체 없음! */
sel.option[0] = new Option('-None-','', '', 'true');
return;
}
var name = c2_name[key];
var val = c2_num[key];
for(i=sel.length-1; i>=0; i--)
 sel.options[i] = null;
sel.options[0] = new Option('-선택-','', '', 'true');
for(i=0; i<name.length; i++){
 sel.options[i+1] = new Option(name[i],val[i]);
}
}
function c2Change(key,sel){
if(key == '') return;
var name = c3_name[key];
var val = c3_num[key];
for(i=sel.length-1; i>=0; i--)
 sel.options[i] = null;
sel.options[0] = new Option('-선택-','', '', 'true');
for(i=0; i<name.length; i++){
 sel.options[i+1] = new Option(name[i],val[i]);
}
}
-->
</body>
</html>
