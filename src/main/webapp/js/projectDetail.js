/*-----------------------------금액 세자리마다 ',' 표시--------------------------------------------------------*/
function addComma(num) {
  var regexp = /\B(?=(\d{3})+(?!\d))/g;
  return num.toString().replace(regexp, ',');
}

	
/*----------------------------------------슬라이드---------------------------------------------------------*/
$(document).ready(function() {
	$("#content-slider").lightSlider({
      loop:true,
    	auto:true,
      keyPress:true
  });
  $('#image-gallery').lightSlider({
      gallery:true,
      item:1,
      thumbItem:6,
      slideMargin: 0,
      speed:500,
      auto:true,
      loop:true,
      onSliderLoad: function() {
          $('#image-gallery').removeClass('cS-hidden');
      }  
  });
});

/*--------------preview header--------------------------------------------------------------------------------------*/
var preview = '${preview}';

if(preview == 'p'){
	$("#headDiv").hide();
}

/*--------------url링크 가져오기/공유하기-------------------------------------------------------------------------------*/
function url() {
	var link = location.href;
	$('.pjdtl-share-btn').next().children().find('.modal-body input').val(link);
}

function copyUrl() {
	var copyText = document.getElementById("myInput");
		copyText.select();
	document.execCommand("copy");

	var tooltip = document.getElementById("myTooltip");
	tooltip.innerHTML = "복사되었습니다.";
}
function outFunc() {
	  var tooltip = document.getElementById("myTooltip");
	  tooltip.innerHTML = "복사하기";
}