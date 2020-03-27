/**
 * http://usejsdoc.org/
 */
  

//네브바 상단 고정 이벤트 jquery ready start
$(document).ready(function() {
	// jQuery code

	///////////////// fixed menu on scroll for desctop
    if ($(window).width() > 992) {
        
        var navbar_height =  $('#navbar').outerHeight();

        $(window).scroll(function(){  
            if ($(this).scrollTop() > 300) {
				 $('#navbar').css('height', navbar_height + 'px');
				 $('#navbar').css('background-color', '#fff');
                 $('#navbar').addClass("fixed-top");
                 
            }else{
                $('#navbar').removeClass("fixed-top");
                $('#navbar').css('height', 'auto');
            }   
        });
    } // end if

	
}); // jquery end