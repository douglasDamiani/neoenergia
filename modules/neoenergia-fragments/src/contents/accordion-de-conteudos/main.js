const accordionBtn = fragmentElement.querySelector("button");

accordionBtn.addEventListener("click", () => {
    accordionBtn.classList.toggle("show");
    accordionBtn.nextElementSibling.classList.toggle("show");
})