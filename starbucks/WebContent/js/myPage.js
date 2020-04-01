/**
 * 마이페이지 관련 script
 * 작성자 : lje
 * 작성일 : 2020.03
 */


function btnClickEvent(){
	if($("#btnCheckOut") != null){
		$("#btnCheckOut").click(function(){
			$("#cartTotPriceHd").val($("#cartTotPrice").html());	// cart 주문 상품 전체 가격 세팅
			$("#cartFrm").attr("action", "order.my").submit();
		});
	}
	
	if($("#btnPay") != null){
		$("#btnPay").click(function(){
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
    if($("button[name='btnWrite']")!=null){
		$("button[name='btnWrite']").on('click',function(){
			let target=$(this).index();
			console.log(target);
			let itemCode=$("input[name='itemCode']").eq(i).attr("value");
			$('#review').attr('action', 'review_insert.uk').submit();
		});
		
	}
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
	
	if(price*ea >= price ){	// 전체 가격이 상품 가격과 동일하거나 클 경우만 감
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