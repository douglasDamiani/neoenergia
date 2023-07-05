const eventsCalendar = fragmentElement.querySelector(".neoenergia_events-calendar");


if(eventsCalendar){  
  const swiper = new Swiper('.neoenergia_events-calendar', {
    speed: 400,
    slidesPerView: 1,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
      renderBullet: function (index, className) {
        const dates = fragmentElement.querySelectorAll("[data-event-date]");
        const datesArray = [];
        dates.forEach(date => {
          datesArray.push(date.dataset.eventDate);
        });
        return '<span class="' + className + '">' + datesArray[index] + '</span>';
      }
    }
  });

}