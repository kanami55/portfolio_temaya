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

 //

jQuery('#about_down').click(function() {
  //headerの高さの値を取得
  let navbar = jQuery(".navbar").innerHeight();
  let down_btn = jQuery(".down_btn").innerHeight();
  let speed = 1000;
  let id = jQuery(this).atter("href");
  let target = jQuery("#" == id ? "html": id);
  //headerの高さ分だけ引く
  let position = jQuery(target).offset().top - navbar - down_btn;
  jQuery("html, body").animate(
    {
      scrollTop: position
    },
    speed
    );
    return false
});