function lockScroll(){
  this.scrollTopPosition = $(window).scrollTop();
  $("#wrap").css({ top: - (this.scrollTopPosition) });
  $("body").addClass('noScroll');
}

function unLockScroll(){
  $("#wrap").css({ top: '' });
  $("body").removeClass('noScroll');
  window.scrollTo(0, this.scrollTopPosition);
  window.setTimeout(function () {
      this.scrollTopPosition = null;
  }, 0);
}

// 타이틀 확인 팝업
function alertPopup(title, message, link) {
  popupElements =
    `<div class="popupBox">
    <h3 class="popup_title">${title}</h3>
    <p class="popup_message">${message}</p>
    <a href="javascript:;" class="popup_link confirm">확인</a>
    <div class="popup_close"><a href="javascript:;" class="close_button"></a></div>
    </div>`;
  $('.dimmed_black').html( popupElements );

  if( link !== undefined || link !== "" || link !== null ) {
    $('.popup_link').attr("href", link);
  }

  $('.dimmed_black').show();
  lockScroll();

  $('.popup_close, .popup_link').click(function() {
    $('.dimmed_black').hide();
    unLockScroll();
  });
}

// 확인&취소 팝업
function confirmPopup(message, link) {
  popupElements =
    `<div class="popupBox" class="noTitle">
    <p class="popup_message">${message}</p>
    <div class="popup_button_area">
    <a href="javascript:;" class="popup_link cancel">취소</a>
    <a href="javascript:;" class="popup_link confirm">확인</a>
    </div>
    <div class="popup_close"><a href="javascript:;" class="close_button"></a></div>
    </div>`;
  $('.dimmed_black').html( popupElements );

  if( link !== undefined || link !== "" || link !== null ) {
    $('.confirm').attr("href", link);
  }

  $('.dimmed_black').show();
  lockScroll();

  $('.confirm').click(function() {
    return true;
  });
  $('.cancel').click(function() {
    return;
  });

  $('.popup_close, .popup_link').click(function() {
    $('.dimmed_black').hide();
    unLockScroll();
  });
}