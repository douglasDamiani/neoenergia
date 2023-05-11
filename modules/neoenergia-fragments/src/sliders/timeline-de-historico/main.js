const elSelectorDates = document.querySelectorAll('.neo-timeline__selector-date');
const elContent = document.querySelectorAll('.neo-timeline__content');
const elImage = document.querySelectorAll('.neo-timeline__image');
const elSelectorNext = document.querySelector(".neo-timeline__selector-next");
const elSelectorPrev = document.querySelector(".neo-timeline__selector-prev");
const numberSlide = elSelectorDates.length
let activeSlide = 0

//evento click por date/bullet
for (var i = 0; i < elSelectorDates.length; i++) {
    elSelectorDates[i].addEventListener('click', function (event) {
        activeSlide = event.target.dataset.index;

        elSelectorDates.forEach((element) => {
            element.classList.remove('active');
        });
        elContent.forEach((element) => {
            element.classList.remove('active');
        });
        elImage.forEach((element) => {
            element.classList.remove('active');
        });
        event.target.classList.add('active');
        elContent[activeSlide].classList.add('active');
        elImage[activeSlide].classList.add('active');
    });
}

//evento click next
elSelectorNext.addEventListener('click', function () {


    if (activeSlide <= numberSlide - 2) {
        activeSlide++
        elSelectorDates.forEach((element) => {
            element.classList.remove('active');
        });
        elContent.forEach((element) => {
            element.classList.remove('active');
        });
        elImage.forEach((element) => {
            element.classList.remove('active');
        });
        elSelectorDates[activeSlide].classList.add('active');
        elContent[activeSlide].classList.add('active');
        elImage[activeSlide].classList.add('active');


    }
});

//evento click prev
elSelectorPrev.addEventListener('click', function () {
    if (activeSlide > 0) {
        activeSlide--
        elSelectorDates.forEach((element) => {
            element.classList.remove('active');
        });
        elContent.forEach((element) => {
            element.classList.remove('active');
        });
        elImage.forEach((element) => {
            element.classList.remove('active');
        });
        elSelectorDates[activeSlide].classList.add('active');
        elContent[activeSlide].classList.add('active');
        elImage[activeSlide].classList.add('active');


    }
});


