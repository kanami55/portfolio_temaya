  /*topへ戻る*/
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
  	}, 500);
  	return false;
  });



$(document).ready(function () {
  $("#images").skippr({
    // スライドショーの変化 ("fade" or "slide")
    transition : 'slide',
    // 変化に係る時間(ミリ秒)
    speed : 1000,
    // easingの種類
    easing : 'easeOutQuart',
    // ナビゲーションの形("block" or "bubble")
    navType : 'block',
    // 子要素の種類("div" or "img")
    childrenElementType : 'div',
    // ナビゲーション矢印の表示(trueで表示)
    arrows : true,
    // スライドショーの自動再生(falseで自動再生なし)
    autoPlay : true,
    // 自動再生時のスライド切替間隔(ミリ秒)
    autoPlayDuration : 3000,
    // キーボードの矢印キーによるスライド送りの設定(trueで有効)
    keyboardOnAlways : true,
    // 一枚目のスライド表示時に戻る矢印を表示するかどうか(falseで非表示)
    hidePrevious : false
  });
});