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

 //ホーム画面のアニメーション
$(function(){
  $(window).on('load scroll',function (){
    $('.about_box').each(function(){
      //ターゲットの位置を取得
      var target = $(this).offset().top;
      //スクロール量を取得
      var scroll = $(window).scrollTop();
      //ウィンドウの高さを取得
      var height = $(window).height();
      //ターゲットまでスクロールするとフェードインする
      if (scroll > target - height){
        //クラスを加える
        $(this).addClass('active');
      }
    });
  });
});
