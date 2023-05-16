const accordionBtn = fragmentElement.querySelector("button");

accordionBtn.addEventListener("click", () => {
    accordionBtn.nextElementSibling.classList.toggle("show");
})