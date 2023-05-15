document.addEventListener("DOMContentLoaded", function () {
    var swiper = new Swiper(".neo_swiper_slider_conteudo", {
      slidesPerView: 1.1,
      spaceBetween: 24,
      breakpoints: {
        480: {
          slidesPerView: 2.1,
        },
        768: {
          slidesPerView: 3.1,
        },
        1080: {
          slidesPerView: 4,
        },
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
  });
  