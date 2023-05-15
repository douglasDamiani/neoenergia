var swiper = new Swiper('.neo_slider_highlight_content_instance', {
  navigation: {
    nextEl: '.neo_slider_highlight_content_instance_actions_btn_next',
    prevEl: '.neo_slider_highlight_content_instance_actions_btn_prev',
  },
  scrollbar: {
    el: '.swiper-scrollbar',
  },
  slidesPerView: 1.1,
  spaceBetween: 24,
  breakpoints: {
    768: {
      slidesPerView: 2.2,
      spaceBetween: 20
    }
  }
});