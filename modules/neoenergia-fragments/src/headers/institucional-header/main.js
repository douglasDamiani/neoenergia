const elOpenMenu = fragmentElement.querySelector('.header__open-menu')
const elHeader = fragmentElement.querySelector('.header')
const elMenuItem = fragmentElement.querySelectorAll('.menu__link')
const elSearch = fragmentElement.querySelector('.header__search')
const elSearchBar = fragmentElement.querySelector('.search-bar')
const availableLanguages = fragmentElement.querySelectorAll(".header__language>ul>li");

const populateQuotas = (documentXML) => {
    const infos = ["Date", "Last_Price", "Time", "Difference_Percent"];

    infos.forEach(info => {
        const data = fragmentElement.querySelector(`#${info.toLocaleLowerCase()}`);
        const dataXML = documentXML.getElementsByTagName(info)[0];

        if (info === "Difference_Percent") {
            if (dataXML.innerHTML.includes("-")){
                data.classList.add("negative");
            } else {
                data.classList.add("positive");
            }
        }
        data.innerText = dataXML.innerHTML;
    })
}

const getQuotas = () => {
    fetch("https://ri.enfoque.com.br/RIWeb/wsQuotes/cotacoes.asmx/Quotes?login=Neoenergia&senha=NEOE", {
        "headers": {
            "accept": "*/*",
            "accept-language": "en-US,en;q=0.9",
            "sec-ch-ua": "\"Google Chrome\";v=\"113\", \"Chromium\";v=\"113\", \"Not-A.Brand\";v=\"24\"",
            "sec-ch-ua-mobile": "?1",
            "sec-ch-ua-platform": "\"Android\"",
            "sec-fetch-dest": "empty",
            "sec-fetch-mode": "cors",
            "sec-fetch-site": "cross-site"
        },
        "referrer": "https://www.neoenergia.com/",
        "referrerPolicy": "strict-origin-when-cross-origin",
        "body": null,
        "method": "GET",
        "mode": "cors",
        "credentials": "omit"
    }).then(response => response.text()).then(data => {
        const parser = new DOMParser();
        const xml = parser.parseFromString(data, "application/xml");
        populateQuotas(xml);
    })
        .catch(console.error);
}

getQuotas();

availableLanguages.forEach(language => {
    language.addEventListener('click', () => {
        let url = Liferay.currentURL;

        ['/pt/', '/en/', '/es/'].forEach(lang => {
            if (url.includes(lang)) {
                url = url.substring(4, url.length)
            }
        })

        url = `/${language.innerText.toLowerCase()}/${url}`;

        window.location.href = url;
    });
})

elOpenMenu.addEventListener('click', function () {
    elHeader.classList.toggle('open')
    if (elOpenMenu.innerHTML === 'close') {
        elOpenMenu.innerHTML = 'menu';
        return;
    }
    elOpenMenu.innerHTML = 'close';

})


for (let i = 0; i < elMenuItem.length; i++) {
    elMenuItem[i].addEventListener('click', function (event) {
        event.target.parentElement.classList.toggle('open')
    })

}

elSearch.addEventListener('click', function () {
    elSearchBar.classList.toggle('open')
})