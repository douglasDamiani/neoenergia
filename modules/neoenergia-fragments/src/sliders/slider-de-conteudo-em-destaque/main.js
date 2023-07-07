const isEditClass = document.querySelector('body').classList.contains('has-edit-mode-menu') 

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

if (!isEditClass){
  const placeholderLinks = fragmentElement.querySelectorAll('.neo-slider_highlight__link-placeholder');
  const realLinks = fragmentElement.querySelectorAll('.neo-slider_highlight__link');

  placeholderLinks.forEach((cur_placeholderLink, index) => {
	  realLinks[index].href = cur_placeholderLink.href;
	  cur_placeholderLink.remove();
  })
}
