/**
 * 마이페이지 관련 script
 * 작성자 : lje
 * 작성일 : 2020.03
 */

let orderListSort = function(status){
	$("#selectedStatus").val(status);
	$("#review").attr("action", "orderListPage.my").submit();
	
	$(".dropdown-item").click(function(){
		$(".btnOrderSort").html($(this).html());
		
		
		/*
		let param = $("#review").serialize();
		$.ajax({
			url : "order_sort_result.jsp",
			type : "post",
			data : param , 
			success : function(result){
				if(result == 1){
					
				}else{
					
				}
			}	// end of success 
		}).fail(function() {
	    	
	    })
	    
	    */
	})
	
	
}


let orderCancle = function (index){
	// serial 값 세팅 
	$("#cancleSerial").val($("#serial_"+index).val());
	
	Swal.fire({
        title: '주문을 취소하시겠습니까?',
        text: "확인 버튼을 누르시면 관리자 승인 후 주문 취소가 완료됩니다.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#006633',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
    	if (result.value) {
    		let param = $("#review").serialize();
    		$.ajax({
    			url : "order_cancle_result.jsp",
    			type : "post",
    			data : param , 
    			success : function(result){
    				if(result == 1){
    					Swal.fire(
                            'Deleted!',
                            '관리자에게 주문 취소 요청을 하였습니다.',
                            'success'
                        );
                        
    					// 버튼 상태 변경 
                        $("#btnCancle_"+index).html("승인대기");
    					$("#btnCancle_"+index).addClass("disabled");
    					$("#btnCancle_"+index).attr('disabled', true);
    				}else{
    					Swal.fire({
    		   				icon: 'error',
    		   				text: '오류가 발생했습니다.' 
    		   			});
    				}
    			}	// end of success 
    		}).fail(function() {
            	Swal.fire({
       				icon: 'error',
       				text: '오류가 발생했습니다.' 
       			});
            })
        }else{	// 취소버튼 클릭 시 
        	
        }
    });
}

// 주문내역 페이지 네이게이션  
let orderListPageNav=function (nowPage, mId){
	$('#nowPage').val(nowPage);
	$('#mId').val(mId);
	$('#review').attr('action','orderListPage.my').submit();
}




function btnClickEvent(){
	
	// 주문하기 버튼 클릭 이벤트 
	if($("#btnCheckOut") != null){
		$("#btnCheckOut").click(function(){
			$("#cartTotPriceHd").val($("#cartTotPrice").html());	// cart 주문 상품 전체 가격 세팅
			$("#cartFrm").attr("action", "order.my").submit();
		});
	}
	
	
	// 결제하기 버튼 클릭 이벤트 
	if($("#btnPay") != null){
		$("#btnPay").click(function(){
			// 적립금 값 세팅 
			$("#usePoint").val($("#savedMoney").val());
			
			$("#itemSize").val($('.item-list').length);
			$("#prodOrderFrm").attr("action", "orderResult.my").submit();
		});
	}   
}
function userInfoUpdate() {
    // 	회원정보 수정 버튼
    if ($("#btnSave") != null) {
        $("#btnSave").click(function () {
            $("#userInfoFrm").attr("action", "accountResult.my").submit();
        });
    }


    // 회원 탈퇴 버튼 
    if ($("#btnDelUser") != null) {
        $("#btnDelUser").click(function () {
            if (deleteUserFrm.userPwd.value == "") {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: '비밀번호를 입력해주세요.'
                });
            } else if (deleteUserFrm.userPwd.value != "") {
                $("#deleteUserFrm").attr("action", "outResult.my").submit();
            }

        })
    }
    /*김관욱이 만든 클릭이벤트*/
    if($("button[name='btnWrite']")!=null){
    	$("button[name='btnWrite']").on('click',function(){
    		$ind=$("button[name='btnWrite']").index($(this));
    		/*itemCode 밸류 가져오기*/
    		let itemCode=$("input[name='itemCode']").eq($ind).attr("value");
    		reviewItemCode(itemCode);
    	});
	}
}


/*김관욱이 만든 펑션*/
let reviewItemCode=function(itemCode){
	console.log('fung');
	$('#reviewItemCode').attr('value',itemCode);
	$('#review').attr('action','review_insert.uk').submit();
}



// 장바구니 전체 가격 관련 
function cartTotPrice(){
	var tot = 0;
	
	for(var i=0; i<$("tbody tr").length; i++){
		if($("#chkCnt_"+i).is(":checked")){
			var totPrice = Number($("#totPrice_"+i).html());
			tot = tot + totPrice;
			$("#chkFlag_"+i).val("1");
		}else{
			$("#chkFlag_"+i).val("0");
		}
		
	}

	$("#cartTotPrice").html(tot);
	
}

$
// 장바구니 상품 개수 클릭 이벤트 (+)
function pricePlus(i){
	
	var price = Number($("#price_"+i).html());
	var ea = Number($("#itemEa_"+i).val())+1;
	
	$("#totPrice_"+i).html(price*ea);
	cartTotPrice();
	
	// value 업데이트
	$("#itemEaVal_"+i).val(ea);
	$("#totPriceVal_"+i).val($("#totPrice_"+i).html());
}


//장바구니 상품 개수 클릭 이벤트 (-)
function priceMinus(i){
	var price = Number($("#price_"+i).html());
	var ea = Number($("#itemEa_"+i).val());
	
	if(price*ea >= price ){	// 전체 가격이 상품 가격과 동일하거나 클 경우만 감소 
		$("#totPrice_"+i).html(price*ea);
		$("#itemEa_"+i).val(ea);
		
		cartTotPrice();
	}else if(ea == 0){
		$("#totPrice_"+i).html(0);
	}
	
	
	// value 업데이트 
	$("#itemEaVal_"+i).val(ea);
	$("#totPriceVal_"+i).val($("#totPrice_"+i).html());

}

// 상품상제 상품 개수 클릭 이벤트 
function pricePlus2(){
	
	var price = Number($("#oriPrice").val());
	var ea = Number($("#itemEa").val())+1;
	
	$("#price").html(price*ea);
	
	// value 업데이트
	$("#itemEaVal").val(ea);
	$("#totPrice").val($("#price").html());
}


function priceMinus2(){
	var price = Number($("#oriPrice").val());
	var ea = Number($("#itemEa").val()-1);
	
	if(price*ea >= price ){	// 전체 가격이 상품 가격과 동일하거나 클 경우만 감소 
		$("#price").html(price*ea);
		$("#itemEaVal").val(ea);
		
	}else if(ea == 0){
		$("#price").html(0);
	}
	
	// value 업데이트 
	$("#itemEaVal").val(ea);
	$("#totPrice").val($("#price").html());
	
	
	
}

// 다음 우편번호 서비스
function openDaumZipAddress() {
    new daum.Postcode({
        oncomplete: function (data) {
            jQuery("#postcode1").val(data.postcode1);
            jQuery("#postcode2").val(data.postcode2);
            jQuery("#zonecode").val(data.zonecode);
            jQuery("#address").val(data.address);
            jQuery("#address2").focus();
            console.log(data);
        }
    }).open();
}