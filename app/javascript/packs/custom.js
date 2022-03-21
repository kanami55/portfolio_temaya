  //topへ戻る
    jQuery(window).on("scroll", function($) {
      //10pxスクロールしたらボタンが登場
  	if (jQuery(this).scrollTop() > 10) {
  		jQuery('#page_top').show();
  	} else {
  		jQuery('#page_top').hide();
  	}
  });

  //ボタンをクリックしたら0.5秒かけて上に戻る
  jQuery('#page_top').click(function () {
  	jQuery('body,html').animate({
  		scrollTop: 0
  	}, 800);
  	return false;
  });

  //ボタンを押したら指定位置までスクロール
  $(function() {
      var home_about = $("#home_about");
      var body = $("body");

      home_about.click(function() {
        var  = $(this).attr("href");
        var scroll_point = $().offset().top;
        body.animate({
          scrollTop: scroll_point
        }, 300);
      });
  });
