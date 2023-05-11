var swiper = new Swiper('.neo_slider_logos_instance', {
    navigation: {
        nextEl: '.neo_slider_logos_instance_actions_btn_next',
        prevEl: '.neo_slider_logos_instance_actions_btn_prev',
    },
    scrollbar: {
        el: '.swiper-scrollbar',
    },
    slidesPerView: 1.1,
    spaceBetween: 12,
    breakpoints: {
        480: {
            slidesPerView: 2.2,
            spaceBetween: 24
        },
        768: {
            slidesPerView: 4.3
        },
        1080: {
            slidesPerView: 6.3
        }

    }
});