document.addEventListener("DOMContentLoaded", function() {
  var swiper = new Swiper('.neo_swiper_banner', {
    loop: true,
    slidesPerView: 1.1,
    centeredSlides: true,
    pagination: {
      el: '.swiper-pagination',
      clickable: true
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    watchSlidesProgress: true
  });
  })
