/**
 * http://usejsdoc.org/
 */

function btnFunc(){

	
}

function deleteItem(item_code){
	
	Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  text: "",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제해주세요!',
		  cancelButtonText: '취소'
		}).then((result) => {
		  if (result.value) {
		    Swal.fire(
		      'Deleted!',
		      item_code+'가 성공적으로 삭제되었습니다.',
		      'success'
		    )
		  }
		})
}

let deleteF = function(item_code){
	let param = "item_code=" + item_code;
	
	$.post('delete_product_result.jsp', param, function(data) {
		Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제해주세요!',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value && data>0) {
			    Swal.fire(
			      'Deleted!',
			      '성공적으로 삭제되었습니다.',
			      'success'
			    )
			  }else if(result.value && data<1){
				  Swal.fire(
					'삭제 중 오류발생',
					'관리자에게 문의해주세요.',
					'warning'
				  )
			  }
			})
	});
}