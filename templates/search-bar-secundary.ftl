<@liferay_aui.fieldset cssClass="search-bar">
	<@liferay_aui.input
		cssClass="search-bar-empty-search-input"
		name="emptySearchEnabled"
		type="hidden"
		value=searchBarPortletDisplayContext.isEmptySearchEnabled()
	/>

  <div class="neoenergia_secundary-search-bar">
    <input
      autocomplete="off"
      class="input-field"
      data-qa-id="searchInput"
      id="${namespace + stringUtil.randomId()}"
      name="${htmlUtil.escape(searchBarPortletDisplayContext.getKeywordsParameterName())}"
      placeholder="${searchBarPortletDisplayContext.getInputPlaceholder()}"
      title="${languageUtil.get(locale, "search")}"
      type="text"
      value="${htmlUtil.escape(searchBarPortletDisplayContext.getKeywords())}"
    />
    <@liferay_aui.input
      name=htmlUtil.escape(searchBarPortletDisplayContext.getScopeParameterName())
      type="hidden"
      value=searchBarPortletDisplayContext.getScopeParameterValue()
    />
    <div class="search-bar-icons-wrapper">
      <button 
        aria-label="${languageUtil.get(locale, "search-bar-submit")}"   
        class="search-button" 
        type="submit"
      >
        <span class="material-symbols-outlined">arrow_right_alt</span>
      </button>
      <button 
        onclick="clearInput()"
        aria-label="${languageUtil.get(locale, "close")}"   
        class="close-button" 
      >
        <span class="material-symbols-outlined">close</span>
      </button>
    </div>
  </div>
</@>

<script>
  const searchBarInput = document.querySelector('[data-qa-id="searchInput"]');
  function clearInput() {
    searchBarInput.value = "";
    searchBarInput.focus();
  }
</script>

<style>
  .neoenergia_secundary-search-bar{
    display: flex;
    flex-direction: row;
    padding: 40px;
    background-color: #00402A;
  }

  .neoenergia_secundary-search-bar .input-field{
    width: 100%;
    background: transparent;
    border: none;
    font-family: IberPangea;
    font-size: 40px;
    font-style: normal;
    font-weight: 400;
    line-height: 52px;
    color: #fff;
  }

  .neoenergia_secundary-search-bar .input-field:focus{
    outline: none;
  }

  .neoenergia_secundary-search-bar .search-bar-icons-wrapper{
    display:flex;
  }

  .neoenergia_secundary-search-bar .search-bar-icons-wrapper .search-button,
  .neoenergia_secundary-search-bar .search-bar-icons-wrapper .close-button{
    display: flex;
    border: none;
    background: transparent;
  }
  .neoenergia_secundary-search-bar .search-bar-icons-wrapper .search-button span,
  .neoenergia_secundary-search-bar .search-bar-icons-wrapper .close-button span{
    font-size: 48px;
    color: #fff;
    opacity: 0.4000000059604645;
  }
</style>