const newsPublicationDates = fragmentElement.querySelectorAll(".publication-date");

newsPublicationDates.forEach((cur_newsPublicationDates) => {
  const date = new Date(cur_newsPublicationDates.innerText);
	const [day, month, year] = [date.getDate()+1, date.getMonth()+1, date.getFullYear()];
	
	if(Liferay.ThemeDisplay.getLanguageId() == "en_US"){
	  cur_newsPublicationDates.innerText = `${month}/${day}/${year}`;
	} else {
	  cur_newsPublicationDates.innerText = `${day}/${month}/${year}`;
	}
})