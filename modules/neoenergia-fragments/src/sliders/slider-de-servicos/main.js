var swiper = new Swiper('.neo_slider_services', {
    slidesPerView: 2.1,
    spaceBetween: 12,
    breakpoints: {
        480: {
            slidesPerView: 3.2,
            spaceBetween: 18
        },
        768: {
            slidesPerView: 4.3
        },
        1080: {
            slidesPerView: +configuration.quantityCards,
            spaceBetween: 24
        }

    }
});