let total,menuprice,idx;

function loadMenu(){
	$('#tblMenu tbody').empty();
	$.get('SelectMenu',{},function(txt){
 		
 		if(txt=='') return false;
		
 		let rec=txt.split(';');
		for(i=0;i<rec.length;i++){
			let field=rec[i].split(',');
			let html='<tr><td>'+field[0]+'</td><td>'+field[1]+'</td><td>'+field[2]+'</td></tr>';
			$('#tblMenu tbody').append(html);
		}
		console.log(html);
	},'text');
}

$(document)
.ready(function(){
	$('#selMenu').empty();
	$.get('SelectMenu',{},function(txt){
 		
 		if(txt=='') return false;
		
 		let rec=txt.split(';');
		for(i=0;i<rec.length;i++){
			let field=rec[i].split(',');
			let html='<option>'+field[1]+'  '+field[2]+'</option>';
			$('#selMenu').append(html);
		}
	},'text');
	
	$('#menutbl tbody').empty();
	$.get('SelectMenu',{},function(txt){
 		
 		if(txt=='') return false;
		
 		let rec=txt.split(';');
		for(i=0;i<rec.length;i++){
			let field=rec[i].split(',');
			let html='<tr><td>'+field[1]+'</td><td>'+field[2]+'</td></tr>';
			$('#menutbl tbody').append(html);
		}
	},'text');
	
	$('#selSales tbody').empty();
	$.get('SelectSales',{},function(txt){
 	
		if(txt=='') return false;
	
		let rec=txt.split(';');
		for(i=0;i<rec.length;i++){
			let field=rec[i].split(',');
			let ju='<tr><td>'+field[0]+'</td><td>'+field[1]+'</td><td>'+field[2]+'</td><td>'+field[3]+'</td></tr>';
			$('#selSales tbody').append(ju);
		}
	},'text');
	
    menuprice=total=idx=0;
    $('#total').val(0);
})

.on('click','#selMenu',function(){

        str=$('#selMenu option:selected').text();
        ar=str.split('  ')
        
        $('#menuname').val(ar[0]);
        $('#count').val(1);
        $('#menuprice').val(ar[1]);
    })

.on('change','#count',function(){

        count=$('#count').val();
        $('#menuprice').val(count*ar[1]);
        menuprice=$('#menuprice').val();

    })

.on('click','#btnReset',function(){
        $('#menuname,#count,#menuprice').val('');
    })

.on('click','#btnAdd',function(){
         count=$('#count').val();
         menuprice=parseInt($('#menuprice').val());

         total=parseInt(total)+menuprice;
        $('#total').val(total);

        strOrder='<option>'+ar[0]+'  '+count+'  '+menuprice+' 원</option>';
        $('#selOrder').append(strOrder);
        $('#btnReset').trigger('click');
    })

.on('click','#btnDone',function(){
	
	mobile=$('#mobile').val();
    total=$('#total').val();
	
	$('#selOrder option').each(function(){
		str=$(this).text();
		
		let Order=str.replace(' 원','');
				
		let jo=Order.split('  ');
		arparam={mobile:$('#mobile').val(),menuname:jo[0],qty:jo[1],total:jo[2]};
		$.get("InsertSales",arparam,function(txt){},'text');
		
	});
	
	$('#selSales tbody').empty();
	$.get('SelectSales',{},function(txt){
 	
		if(txt=='') return false;
	
		let rec=txt.split(';');
		for(i=0;i<rec.length;i++){
			let field=rec[i].split(',');
			let ju='<tr><td>'+field[0]+'</td><td>'+field[1]+'</td><td>'+field[2]+'</td><td>'+field[3]+'</td></tr>';
			$('#selSales tbody').append(ju);
		}
	},'text');
		
    $('#btnCancel').trigger('click');
})

.on('click','#btnCancel',function(){

        $('#selOrder').empty();
        $('#total,#mobile').val('');
        total=0;
    })

.on('click','#btnSum',function(){
	$('#dlgSum').dialog({
		width:600,
		modal:true,
		open:function(){
			$('#selSumMenu tbody').empty();
			$.get('SalesMenus',{},function(txt){
 				
 				if(txt=='') return false;
		
 				let rec=txt.split(';');
				for(i=0;i<rec.length;i++){
					let field=rec[i].split(',');
					let html='<tr><td>'+field[0]+'</td><td>'+field[1]+'</td><td>'+field[2]+'</td></tr>';
					$('#selSumMenu tbody').append(html);
				}
			},'text');
			
			$('#selSumCust tbody').empty();
			$.get('SalesCustm',{},function(txt){
 				
 				if(txt=='') return false;
		
 				let rec=txt.split(';');
				for(i=0;i<rec.length;i++){
					let field=rec[i].split(',');
					let html='<tr><td>'+field[0]+'</td><td>'+field[1]+'</td></tr>';
					$('#selSumCust tbody').append(html);
				}
			},'text');
		}})
})


//--------------------------------------------------메뉴관리
.on('click','#btnMenu',function(){
        $('#dlgMenu').dialog({
            width:540,
            modal:true,
            open:function(){
            	loadMenu();
            },
            close:function(){
            	$('#selMenu').empty();
            	$.get('SelectMenu',{},function(txt){
             		
             		if(txt=='') return false;
            		
             		let rec=txt.split(';');
            		for(i=0;i<rec.length;i++){
            			let field=rec[i].split(',');
            			let html='<option>'+field[1]+'  '+field[2]+'</option>';
            			$('#selMenu').append(html);
            		}
            	},'text');
            }
        });
    })
.on('click','#btnPlus',function(){
	let operation='';
	
	if($('#code').val()!=''){
		if($('#name').val()!='' && $('#price').val()!=''){	//update
			operation="UpdateMenu";
		} else {
			operation="DeleteMenu";
		}
	} else {
		if($('#name').val()!='' && $('#price').val()!=''){	//just insert
			operation="AddMenu";
		} else {
			alert('메뉴이름을 입력하세요.');
			return false;
		}	
	}
	
	$.get(operation,{code:$('#code').val(),name:$('#name').val(),price:$('#price').val()},
		function(txt){
			$('#name,#price,#code').val('');
			loadMenu();
		},'text');
}) 
