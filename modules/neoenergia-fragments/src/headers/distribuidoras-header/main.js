const btnsSubmenu = fragmentElement.querySelectorAll('.neo_mobile_menu_list>li>a');
const btnsBack = fragmentElement.querySelectorAll('.neo_mobile_menu_list_second_level>li:first-child>button');

const btnDistributors = fragmentElement.querySelector('#btn-distributors-mobile-menu');
const menuDistributorsMobile = fragmentElement.querySelector('.neo_mobile_menu_distributors');

btnsSubmenu.forEach(btn => {
    if (btn.nextElementSibling) {
        btn.addEventListener('click', () => {
            btn.nextElementSibling.classList.toggle('show')
        });
    }
});

btnsBack.forEach(btnBack => {
    btnBack.addEventListener('click', () => {
        btnBack.closest('ul').classList.remove('show');
    })
});

btnDistributors.addEventListener('click', () => {
    menuDistributorsMobile.classList.toggle('show');
});