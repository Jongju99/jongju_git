<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
   <title>직원용 예약</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<link rel="icon" type="image/x-icon" href="resources/assets1/favicon.ico" />
<!-- Simple line icons-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/simple-line-icons/2.5.5/css/simple-line-icons.min.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css"/>
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bitter:wght@300&family=Hahmlet:wght@300&display=swap" rel="stylesheet">
</head>
<style>
* {
   font-family: 'Bitter', serif;
font-family: 'Hahmlet', serif;
}

table { /*bound라는 class는 table 안에서만 쓸 수 있다.*/
   border-collapse: collapse;
   border: 1px solid white;
   --bs-text-opacity: 1;
   color: white;
    height: 600px; 
    width: 400px; 
/*    font-family: cursive; */
}
#tbl1 {
    width: 80%; 
}
#tblRoomList {
   border-collapse: collapse;
   border: 1px solid white;
   --bs-text-opacity: 1;
   color: rgba(255, 255, 255, 0.5) !important;
    height: 500px; 
    width: 80%; 
}

#tbl1 th, #tblRoomList th, #dlgRoom th, #dlgType th {
     padding: 1rem;
    text-align: center; 
    font-size: 20px;
    color: white !important;
}

.bound td { /*이 bound는 td 안에서는 아래의 의미가 된다.*/
   border-collapse: collapse;
   border: 1px solid white;
    text-align: center; 
    padding-bottom: 1rem;
}
.bound input, .bound select {
   width: 280px;
   height: 30px;
}

#date1,#date2,#date3,#date4 {
   width:130px;
}
#selRoom {
   width:380px;
   height:320px;
}
.contact-section {
  padding-top: 5rem;
  background: linear-gradient(to top, #000 0%, rgba(0, 0, 0, 0.9) 75%, rgba(0, 0, 0, 0.8) 100%);
}
</style>
<body>
<jsp:include page="header.jsp"/>
<section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5"><div><div>
<h1 class="text-white mb-4">휴먼 호텔관리(고객용)</h1><hr>
<table align=center id=tbl1>
<thead>
   <tr><th>예약선택</th><th>예약입력</th></tr>
</thead>
<tbody>
<tr><td valign=top>
   <table class='bound' id=tblMenu align=center>
      <tr><td>예약기간</td>
         <td><input type=date id=date1>&nbsp;~&nbsp;<input type=date id=date2></td></tr>
      <tr><td>객실종류</td>
         <td><select id=roomtype1 name=roomtype1 style='width:280px;'>
            <option selected>종류선택</option>
               <c:forEach items="${alType}" var="type">
                  <option value=${type.typecode}>${type.name}</option>
               </c:forEach>
            </select></td></tr>
      <tr><td>숙박인원</td>
         <td><input type=number id=count min=0 style='width: 190px; text-align:right;' value=1>&nbsp;명&nbsp;&nbsp;
            <button class="btnsmall btn-primary" id=find>찾기</button></td>
      <tr><td colspan=2 align=center><select id=selRoom size=10>
            <c:forEach items="${alRcode}" var="Rcode">
                     <option value=${Rcode.code}></option>
                </c:forEach>
      </select></td></tr>
   </table>

</td><td valign=top>

   <table class='bound' id=tbl2 align=center>
      <tr><td>예약번호</td>
         <td><input type=text id=selNum name=selNum></td></tr>
      <tr><td>숙박기간</td>
         <td><input type=text class='as' id=date3 name=date3 >&nbsp;~&nbsp;
            <input type=text class='as' id=date4 name=date4></td></tr>
      <tr><td>객실명</td>
         <td><input type=text size=13 readonly id=nameroom name=nameroom></td></tr>
      <tr><td>객실종류</td>
         <td><select id=roomtype2 name=roomtype2 readonly></select></td></tr>
      <tr><td>숙박인원</td>
         <td><input type=number size=13 id=howmany name=howmany></td></tr>
      <tr><td>대표자명</td>
         <td><input type=text size=13 id=guest name=guest></td></tr>
      <tr><td>모바일</td>
         <td><input type=text size=13 id=mobile1 name=mobile1></td></tr>
      <tr><td>숙박비</td>
         <td><input type=text id=price1 name=price1 readonly></td></tr>
      <tr><td colspan=2 align=center>
            <button class="btnsmall btn-primary" id=btnCancel>주문취소</button>
             <button class="btnsmall btn-primary" id=btnDone>주문완료</button>
            <button class="btnsmall btn-primary" id=btnUpdate>주문수정</button>
      </td></tr>
   </table>
   
   </td>
</tbody></table><br>
    
                    </div>
                </div>
            </div>
        </section>
<section class="contact-section" id=signup>
    <jsp:include page="footer.jsp"/>
</section>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>
<script>
$(document)
.ready(function(){
   loadRoom();
})

.on('click','#btnUpdate',function(){
   let selNum=$('#selNum').val();
   let date3=$('#date3').val();
    let date4=$('#date4').val();
    let howmany=$('#howmany').val();
    let guest=$('#guest').val();
    let mobile1=$('#mobile1').val();
    let howmuch=$('#price1').val();
    let roomcode=$('#selRoom').val();
   //  let selNum=$('#selNum').val();
    console.log(date3,date4,howmany,guest,mobile1,howmuch,roomcode);
    $.ajax({
       url:"/team/updateBook1",
       data:{selNum:selNum,
          date3:date3,
            date4:date4,
            howmany:howmany,
            guest:guest,
            mobile1:mobile1,
            howmuch:howmuch,
            roomcode:roomcode},
       method:"GET",
       datatype:'json',
       beforeSend:function(){
       },
       success:function(data){
          $('#date3,#date4,#nameroom,#howmany,#guest,#mobile1,#price1').val('');
       }
    });
    return false;
})

.on('click','#btnCancel',function(){
   if($('input[name=selNum]').val()==''){
          alert('예약번호를 입력해주십시오.');
          return false;
   }
   let selNum=$('#selNum').val();
   $.ajax({
          url:"/team/deleteBook1",
          data:{selNum:selNum},
          method:"GET",
          datatype:'json',
          beforeSend:function(){
          },
          success:function(data){
             $('#selNum').val('');
          }
       });
       return false;
    })


 .on('click','#btnDone',function(){
	 
	 if($('#roomtype2').val()==''){
		    alert('종류를 선택해주십시오.');
		    return false;
		}
    if($('input[name=date3]').val()=="" || $('input[name=date4]').val()==""){
          alert('날짜를 입력해주십시오.');
          return false;
   }
    if($('input[name=howmany]').val()==''){
          alert('인원수를 입력해주십시오.');
          return false;
   }
    if($('input[name=mobile1]').val()==""){
        alert('전화번호를 입력해주십시오.');
        return false;
 }
    
 let date3=$('#date3').val();
 let date4=$('#date4').val();
 let howmany=$('#howmany').val();
 let guest=$('#guest').val();
 let mobile1=$('#mobile1').val();
 let howmuch=($('#price1').val());
 
 let roomcode=$('#selRoom').val();
 console.log(date3,date4,howmany,guest,mobile1,howmuch,roomcode);
 $.ajax({
    url:"/team/insertbook1",
    data:{date3:date3,
         date4:date4,
         howmany:howmany,
         guest:guest,
         mobile1:mobile1,
         howmuch:howmuch,
         roomcode:roomcode},
    method:"GET",
    datatype:'json',
    beforeSend:function(){
    },
    success:function(data){
       $('#date3,#date4,#nameroom,#howmany,#guest,#mobile1,#price1').val('');
     		alert("주문이 완료됐습니다.");
    }
 });
 return false;
})

.on('focus','#mobile1',function(){
   $('#mobile1').val('');
})

.on('click','#selRoom option',function(){
	 $('#howmany0').val($(this).val());
	 console.log($('#howmany0').val());
	 let d11=$('#date3').val();
	 let d1=d11.split('/');
	 
	 let d22=$('#date4').val();
	 let d2=d22.split('/');
// 	 var now=newDate();
	 var stDate=new Date(d1[0],d1[1],d1[2]);
	 var endDate=new Date(d2[0],d2[1],d2[2]);
	 var btMs = endDate.getTime() - stDate.getTime();
	 var btDay = btMs / (1000*60*60*24);
	 console.log(btDay);
 let str=$(this).text();
 $('#selNum').val('');
 console.log(str);
 let str1=str.split(' ');
 $('#nameroom').val(str1[0]);

 $('#price1').val("");
 $('#price1').val(str1[3]*btDay);
 $('#howmany').val(str1[2]);
 let date111= $('#date1').val();
 let date11=date111.split('-');
 let date1=date11[0]+'/'+date11[1]+'/'+date11[2];
 let date222= $('#date2').val();
 let date22=date222.split('-');
 let date2=date22[0]+'/'+date22[1]+'/'+date22[2];
 $('#date3').val(date1);
 $('#date4').val(date2);
 let roomtype2=$.trim(str1[1]);
 $('#roomtype2').val('');
 $('#roomtype2 option').each(function(){
    if($(this).text()==roomtype2) {
       $(this).prop('selected','selected')
       return false;
    }
 });
})

.on('click','#find',function(){
 if($('input[name=date1]').val()=="" || $('input[name=date2]').val()==""){
      alert('날짜를 선택해주십시오.');
      return false;
}
if($('input[name=count]').val()==''){
      alert('인원수를 입력해주십시오.');
      return false;
}
if($('#roomtype1').val()==''){
    alert('종류를 선택해주십시오.');
    return false;
}

  let date3=$('#date1').val();
   let date4=$('#date2').val();
   console.log(date4);
   let type=$('#roomtype1').val();
   let howmany=$('#count').val();
 $.ajax({
    url:"/team/posit2",
    data:{date3:date3,date4:date4,type:type,howmany:howmany},
    method:"GET",
    datatype:'json',
    beforeSend:function(){
       $('#selRoom').empty();
    },
    success:function(data){
       for(i=0; i<data.length; i++){
          let str='<option value='+data[i]['code']+'>'+data[i]['name']+' '+data[i]['tname']+' '+data[i]['howmany']+' '+data[i]['howmuch']+'</option>';
          $('#selRoom').append(str);
          let str1=data[i]['sbook'];
          $('#bookid').val(str1);
       }
    }
 });
 return false;
})



.on('click', '#btnRoom', function () {
   $('#dlgRoom').dialog({
       width: 560,
       open: function () {
          loadRoom();
       },
       close: function () {
       }
   });
})
.on('click', '#btnType', function () {
   $('#dlgType').dialog({
       width: 560,
       open: function () {
          loadType();   
       },
       close: function () {
    	   loadRoom();
       }
   });
})



function loadRoom() {
$('#roomcode,#roomname,#roomtype3,#howmany1,#howmuch').val('');
$('#selDlgRoom,#roomtype3,#roomtype2,#roomtype1').empty();
$.ajax({url:'/team/roomlist1',
 data:{},
 datatype:'json',
 method:'get',
 success:function(txt){
    for(i=0; i<txt.length; i++){
       let str='<option value='+txt[i]['roomcode']+'>'
       +txt[i]['roomname']+','+txt[i]['roomtype']+','
       +txt[i]['howmany']+','+txt[i]['howmuch']+'</option>'
       console.log(str);
       $('#selDlgRoom').append(str);
    }
 }

});
$.ajax({url:'/team/typelist1',
 data:{},
 datatype:'json',
 method:'get',
 success:function(txt){
    let notype='<option value="">'+'종류선택'+'</option>'
    $('#roomtype2,#roomtype1,#roomtype3').append(notype);
    for(i=0; i<txt.length; i++){
       let str='<option value='+txt[i]['typecode']+'>'+txt[i]['typename']+'</option>'
       console.log(str);
       $('#roomtype1').append(str);
       $('#roomtype2').append(str);
    }
 }

});
};

</script>
</html>