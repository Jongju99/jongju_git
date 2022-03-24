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
    width: 1000px; 
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
   width:140px;
}
#selRoom {
   width:380px;
   height:320px;
}
#selSales {
   width:90%;
   height:320px;
}
.contact-section {
  padding-top: 5rem;
  background: linear-gradient(to top, #000 0%, rgba(0, 0, 0, 0.9) 75%, rgba(0, 0, 0, 0.8) 100%);
}
#dlgRoom table, #dlgType table {

   border-collapse: collapse;
   border: 1px solid white;
   --bs-text-opacity: 1;
   color: white;
   text-align: center; 
   height: 250px; 
/*     width: 300px;  */
}
#dlgRoom input, #dlgType input {
   width: 280px;
   height: 30px;
}
#dlgRoom, #dlgType {
   background: linear-gradient(to top, #000 0%, rgba(0, 0, 0, 0.9) 75%, rgba(0, 0, 0, 0.8) 100%);
}
.dlgtd {
	text-align: right; 
	font-size: 18px;
}

</style>
<body>
<jsp:include page="header.jsp"/>
<section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5"><div><div>
<input type=button id=btnRoom class="btnsmall btn-primary" value="객실관리">&nbsp;
<input type=button id=btnType class="btnsmall btn-primary" value="객실타입관리">
<br><br>
<h1 class="text-white mb-4">휴먼 호텔관리(직원용)</h1><hr>
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
            <option value="empty" selected>종류선택</option>
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
      <tr><td colspan=2 align=center><input type=hidden id=s1>
            <button class="btnsmall btn-primary" id=btnCancel>예약취소</button>
             <button class="btnsmall btn-primary" id=btnDone>예약완료</button>
            <button class="btnsmall btn-primary" id=btnUpdate>예약수정</button>
      </td></tr>
   </table>
   
   </td>
</tbody></table><br>
   
   
   <table class='tblRoomList' id=tblRoomList align=center>
   <tr><th>예약된 객실목록</th></tr>
      <tr><td align=center>
         <select id=selSales size=20></select>
      </td></tr>
   </table> <br><br>
    
    
    <div id=dlgRoom style='display:none;' title='객실관리'>
<table align=center>
<thead>
<tr><th>현재 객실정보</th><th>수정사항</th></tr>
</thead>
<tr><td>
   <table>
      <tr><td><select id=selDlgRoom size=7 style="width:350px"></select></td></tr>
   </table>
</td>
<td>
   <table>
   <tr><td><input type=hidden id=roomcode name=roomcode></td></tr>
   <tr><td class=dlgtd>객실명</td>
      <td><input type=text id=roomname  name=roomname></td></tr>
   <tr><td class=dlgtd>타입</td>
      <td><select id=roomtype3 name=roomtype3 style="width: 280px; height: 30px;"></select></td></tr>
   <tr><td class=dlgtd>인원</td>
      <td><input type=number name=howmany1 id=howmany1></td></tr>
   <tr><td class=dlgtd>요금</td>
      <td><input type=number name=howmuch id=howmuch></td></tr>
   <tr><td colspan=2 align=center>
      <button class="btnsmall btn-primary" id=btnAdd>추가</button>
      <button class="btnsmall btn-primary" id=btnDelete>삭제</button>
      <button class="btnsmall btn-primary" id=btnReset>비우기</button></td></tr>
   </table>
</td></tr></table>
   </div>
   
   <div id=dlgType style='display:none;' title='객실타입관리'>
      <table align=center>
      <tr><th>현재 객실</th><th>수정사항</th></tr>
      <tr><td>
         <table>
            <tr><td><select id=selType size=7 style="width:250px"></select></td></tr>
         </table>
      <td>
         <table>
         <tr><td colspan=2><input type=hidden id=TypeCode name=TypeCode></td></tr>
         <tr><td class=dlgtd>객실명</td><td><input type=text id=TypeName name=TypeName></td></tr>
         <tr><td colspan=2 align=center>
            <button class="btnsmall btn-primary" id=btnAdd2>추가</button>&nbsp;&nbsp;
            <button class="btnsmall btn-primary" id=btnDelete2>삭제</button>&nbsp;&nbsp;
            <button class="btnsmall btn-primary" id=btnReset2>비우기</button></td></tr>
         </table>
      </td></tr>
      </table>
   </div>

                    </div>
                </div>
            </div>
        </section>
        <section class="contact-section" id=signup>
        <jsp:include page="footer.jsp"/>
        </section>
                 <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5">Copyright &copy; Your Website 2021</div></footer>
</body>
   <!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js' />"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src='https://code.jquery.com/ui/1.13.0/jquery-ui.js'></script>

<script>
$(document)
.ready(function(){
   loadRoom();
   loadRoom1();
//    $.ajax({
// 	    url:"/team/posit1",
// 	    data:{},
// 	    method:"GET",
// 	    datatype:'json',
// 	    beforeSend:function(){
// 	       $('#selRoom').empty();
// 	    },
// 	    success:function(data){
// 	       for(i=0; i<data.length; i++){
// 	          let str='<option value='+data[i]['code']+'>'+'</option>';
// 	          $('#selRoom').append(str);
// 	          //'<option value='+data[i]['code']+'>
// 	       }
// 	    }
// 	 });
   
})

.on('click','#btnUpdate',function(){
   let selNum=$('#selNum').val();
   let date3=$('#date3').val();
    let date4=$('#date4').val();
    let howmany=$('#howmany').val();
    let guest=$('#guest').val();
    let mobile1=$('#mobile1').val();
    let howmuch=$('#price1').val();
    
    $('#selSales option:selected').each(function(){
    	let s2=$(this).text();
    	let s=s2.split(' ');
//     	console.log(s);	
        $('#s1').val(s[18]);
    	   });
    let roomcode=$('#s1').val();
//     console.log($('#selSales').val()+'roomtype2벨류');
   //  let selNum=$('#selNum').val();
    console.log(date3,date4,howmany,guest,mobile1,howmuch,roomcode);
    $.ajax({
       url:"/team/updateBook",
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
           loadRoom1();
           alert("예약이 변경되었습니다.");
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
          url:"/team/deleteBook",
          data:{selNum:selNum},
          method:"GET",
          datatype:'json',
          beforeSend:function(){
          },
          success:function(data){
             $('#selNum').val('');
             loadRoom1();
             alert("예약이 취소되었습니다.");
             $('#date3,#date4,#nameroom,#howmany,#guest,#mobile1,#price1').val('');
             $("#roomtype2").find("option:eq(0)").prop('selected','true');


             
        
          }
       });
       return false;
    })


.on('click','#selSales option',function(){
   $('#selNum').val($(this).val());
   let selSales1=$(this).text();
   let selSales=selSales1.split(' ');
   $('#nameroom').val(selSales[0]);
   $('#date3').val(selSales[3]);
   $('#date4').val(selSales[5]);
   $('#guest').val(selSales[8]);
   $('#mobile1').val(selSales[11]);
   $('#price1').val(selSales[13]);
   $('#howmany').val(selSales[15]);
   let roomtype=selSales[1];
   console.log($('#roomtype2 option').val());
   $('#roomtype2 option').each(function(){
   if($(this).val()==roomtype) {
       $(this).prop('selected','selected');
       return false;
    }
   });
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
    if($('input[name=mobile1]').val()==''){
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
    url:"/team/insertbook",
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
       alert("예약이 완료되었습니다.");
        document.location='/team/home';
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
    let d11=$('#date1').val();
    console.log(d11);
    let d1=d11.split('-');
    
    let d22=$('#date2').val();
    let d2=d22.split('-');
//     var now=newDate();
    var stDate=new Date(d1[0],d1[1],d1[2]);
    var endDate=new Date(d2[0],d2[1],d2[2]);
    var btMs = endDate.getTime() - stDate.getTime();
    var btDay = btMs / (1000*60*60*24);
    console.log(endDate);
    btDay1=parseInt(btDay);
 let str=$(this).text();
 $('#selNum').val('');
 console.log(str);
 let str1=str.split(' ');
 prc=parseInt(str1[3]);
 $('#nameroom').val(str1[0]);
 $('#price1').val(parseInt(prc*btDay1)); // NaN뜸
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
    url:"/team/posit1",
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
          //'<option value='+data[i]['code']+'>
       }
    }
 });
 return false;
})

.on('click', '#btnRoom', function () {
   $('#dlgRoom').dialog({
       width: 900,
       height: 400,
       modal: true,
       draggable: true,
       position: { my: "center", at: "center", of: "#tbl1" },
       open: function () {
          loadRoom();
       }
   });
})
.on('click', '#btnType', function () {
   $('#dlgType').dialog({
       width: 900,
       height: 400,
       modal: true,
       draggable: true,
       position: { my: "center", at: "center", of: "#tbl1" },
       open: function () {
          loadType();   
       },
       close: function () {
          loadRoom();
       }
   });
})

.on('click', '#btnAdd', function () {
console.log($('#roomcode').val());
 if($('input[name=roomname]').val()==''){
       alert('객실명을 입력해주십시오.');
       return false;
    }
 if($('#roomtype').val()==''){
    alert('객실타입을 선택해주십시오.');
    return false;
 }
 if($('input[name=howmany1]').val()==''){
    alert('인원을 입력해주십시오.');
    return false;
 }
$('#selDlgRoom').empty();
 $.ajax({url:'/team/RoomAdd',
     data:{roomcode:$('#roomcode').val(),roomname:$('#roomname').val(),roomtype:$('#roomtype3').val(),
        howmany:$('#howmany1').val(),howmuch:$('#howmuch').val()},
     datatype:'text',
     method:'get',
     success:function(txt){
         console.log(txt);
          loadRoom();
 
     }   
  });   
 
})
.on('click', '#btnAdd2', function () {

 if($('input[name=TypeName]').val()==''){
       alert('객실타입을 입력해주십시오.');
       return false;
    }
 
$('#selType').empty();
 $.ajax({url:'/team/typeAdd',
     data:{typecode:$('#TypeCode').val(), typename:$('#TypeName').val()},
     datatype:'text',
     method:'get',
     success:function(txt){
         console.log(txt);
         loadType();   
 
     }   
  });   
})
.on('click', '#btnDelete', function () {
$('#selDlgRoom').empty();
 $.ajax({url:'/team/RoomDelete',
     data:{roomcode:$('#roomcode').val()},
     datatype:'text',
     method:'get',
     success:function(txt){
         console.log(txt);
          loadRoom();
 
     }   
  });   
})
.on('click', '#btnDelete2', function () {
$('#selType').empty();
 $.ajax({url:'/team/typeDelete',
     data:{typecode:$('#TypeCode').val()},
     datatype:'text',
     method:'get',
     success:function(txt){
         console.log(txt);
         loadType();   
 
     }   
  });   
})
.on('click', '#btnReset', function () {
 $('#roomcode,#roomname,#roomtype3,#howmany1,#howmuch').val('');
})
.on('click', '#btnReset2', function () {
 $('#TypeCode,#TypeName').val('');
})
.on('click','#selDlgRoom option',function(){
console.log($(this).val()+','+$(this).text());
$('#roomcode').val($(this).val());
let str=$(this).text();
let ar=str.split(',');
$('input[name=roomname]').val($.trim(ar[0]));
$('input[name=howmany1]').val(ar[2]);
$('input[name=howmuch]').val(ar[3]);
let roomtype3=$.trim(ar[1]);
$('#roomtype3').val('');
$('#roomtype3 option').each(function(){
 if($(this).text()==roomtype3) {
    $(this).prop('selected','selected')
    return false;
 }
});
return false;
})
.on('click','#selType option',function(){
console.log($(this).val()+','+$(this).text());
$('#TypeCode').val($(this).val());
let str=$(this).text();
let ar=str.split(',');
$('input[name=TypeName]').val($.trim(ar[0]));
return false;
})
function loadType() {
$('#TypeCode,#TypeName').val('');
$('#selType').empty();
$.ajax({url:'/team/typelist',
 data:{},
 datatype:'json',
 method:'get',
 success:function(txt){
    for(i=0; i<txt.length; i++){
       let str='<option value='+txt[i]['typecode']+'>'+txt[i]['typename']+'</option>'
       console.log(str);
//        $('#roomtype3').append()
       $('#selType').append(str);
    }
 }

});
}
function loadRoom1(){
$('#selSales').empty();
$.ajax({
   url:"/team/getBook",
   data:{},
   method:"GET",
   datatype:'json',
   beforeSend:function(){
      $('#selSales').empty();
   },
   success:function(data){
         for(i=0; i<data.length; i++){
            let date1=data[i]['sdt'].split(' ');
            let date2=date1[0];
            let date3=data[i]['edt'].split(' ');
            let date4=date3[0];
            let price=data[i]['howmuch'];
                let str='<option value='+data[i]['bid']+'>'+data[i]['name']+' '+data[i]['type']+' 방 '+date2+' ~ '+date4+' , 예약자명: '+data[i]['guest']+' , 전화번호: '+data[i]['mobile']+' , '+data[i]['howmuch']+' 원 '+data[i]['howmany']+' 명, id:'+data[i]['mid']+' '+data[i]['code']+'</option>';
                $('#selSales').append(str);
      }
   }
})
}
function loadRoom() {
$('#roomcode,#roomname,#roomtype3,#howmany1,#howmuch').val('');
$('#selDlgRoom,#roomtype3,#roomtype2,#roomtype1').empty();
$.ajax({url:'/team/roomlist',
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
$.ajax({url:'/team/typelist',
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
       $('#roomtype3').append(str);
    }
 }

});
};


</script>

</html>