const positionPins = () => {
    const positionSectionMap = fragmentElement.querySelector(".neo_interative_map").getBoundingClientRect();
    
    fragmentElement.querySelectorAll("span[data-state]").forEach(pin => {
        const stateLocation = fragmentElement.querySelector(`a[*|href="#${pin.dataset.state}"]`).getBoundingClientRect();

        pin.style.top = ((stateLocation.top - positionSectionMap.top) + +pin.dataset.y) + "px";

        pin.style.left = ((stateLocation.left - positionSectionMap.left) + +pin.dataset.x) + "px";
    });
}

positionPins();
document.addEventListener('resize', positionPins);
