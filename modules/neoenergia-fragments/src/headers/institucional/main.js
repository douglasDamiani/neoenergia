const elOpenMenu = fragmentElement.querySelector('.header__open-menu')
const elHeader = fragmentElement.querySelector('.header')
const elMenuItem = fragmentElement.querySelectorAll('.menu__link')
const elSearch = fragmentElement.querySelector('.header__search')
const elSearchBar = fragmentElement.querySelector('.search-bar')

elOpenMenu.addEventListener('click',function(){
    elHeader.classList.toggle('open')
    if(elOpenMenu.innerHTML === 'close'){
        elOpenMenu.innerHTML = 'menu';
        return ;
    }
    elOpenMenu.innerHTML = 'close';

})


for (let i = 0; i < elMenuItem.length; i++) {
    elMenuItem[i].addEventListener('click',function(event){
        event.target.parentElement.classList.toggle('open')
    })
    
}

elSearch.addEventListener('click',function(){
    elSearchBar.classList.toggle('open')
})