/**
 * 마이페이지 관련 script
 * 작성자 : lje
 * 작성일 : 2020.03
 */



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