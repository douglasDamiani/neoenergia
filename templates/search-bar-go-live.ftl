<#assign searchInputId = namespace + stringUtil.randomId()/>

<#assign destination = "/search"/>
<#if searchBarPortletDisplayContext.getSearchURL()?has_content>
	<#assign destination = searchBarPortletDisplayContext.getSearchURL()/>
</#if>

<#assign placeholder = languageUtil.get(locale, "search-bar-placeholder")/>

<div class="neo_search-bar-container">
	<@liferay_aui.fieldset cssClass="search-bar">
		<@liferay_aui.input
			cssClass="search-bar-empty-search-input"
			name="emptySearchEnabled"
			type="hidden"
			value=searchBarPortletDisplayContext.isEmptySearchEnabled()
		/>

  <div class="neo_search-bar-container__fields has-default-search">
		<div class="neo_search-bar--default">
			<div class="input-group">
				<div class="input-group-item search-bar-input-wrapper">
					<input
						autoFocus=true
						autocomplete="off"
						class="search-bar-input"
						data-qa-id="searchInput"
						id=${searchInputId}
						name="${htmlUtil.escape(searchBarPortletDisplayContext.getKeywordsParameterName())}"
						placeholder="${placeholder}"
						title="${languageUtil.get(locale, "search")}"
						type="text"
						value="${htmlUtil.escape(searchBarPortletDisplayContext.getKeywords())}"
					/>

					<@liferay_aui.input
						name=htmlUtil.escape(searchBarPortletDisplayContext.getScopeParameterName())
						type="hidden"
						value=searchBarPortletDisplayContext.getScopeParameterValue()
					/>
				</div>
			</div>
		</div>

    <div class="neo_search-bar-buttons-wrapper">
		<button 
			aria-label="${languageUtil.get(locale, "submit")}"
			class="btn btn-primary search-bar-button"
			id="neo-search-submit-button"
		>
			${languageUtil.get(locale, "search-bar-submit")} <span class="material-symbols-outlined">search</span>
		</button>
    </div>
  </div>
	</@>
</div>

<script>
	const neoSearchSubmitButton = document.querySelector("#neo-search-submit-button");
  neoSearchSubmitButton.addEventListener("click", (e) => {
    e.preventDefault();
    neoSearchSubmitButton.closest(".form").submit();
  })
</script>

<style>
  .neo_search-bar-container .panel-body {
    padding: 0;
  }

  .neo_search-bar-container__fields .search-bar-input {
    border-radius: 8px;
    border: 1px solid var(--cinza-3, #89837E);
    background: var(--branco, #FFF);
    width: 100%;
    padding: 6px 16px;
    line-height: 28px;
    color: var(--cinza-1, #3A3735);
  }

  .neo_search-bar-container__fields .search-bar-input:focus, .neo_search-bar-container__fields .search-bar-input:focus-visible {
    box-shadow: none;
    outline: none;
    border: 1px solid var(--verde-2-principal, #00A443);
  }

  .neo_search-bar-container__fields .neo_search-bar-buttons-wrapper {
    display: flex;
    flex-shrink: 0;
  }

  .neo_search-bar-container__fields .search-bar-button {
    display: inline-flex;
    gap: 16px;
    flex-grow: 1;
    padding: 8px 24px;
    height: fit-content;
    justify-content: center;
    align-items: center;
    border-radius: 20px !important;
    color: var(--branco, #FFF);
  }

  .neo_search-bar-container__fields .search-bar-button--outline {
    background: var(--branco, #FFF);
    color: var(--btn-primary-border-color, #00A443);
  }

  .neo_search-bar-container__fields .search-bar-button > span.material-symbols-outlined {
    font-size: 1rem;
  }

  @media (max-width: 1080px) {
    .neo_search-bar-container__fields.has-default-search .neo_search-bar--default {
      margin-bottom: 16px;
    }

    .neo_search-bar-container__fields.has-default-search .neo_search-bar-buttons-wrapper {
      column-gap: 23px;
    }

    .neo_search-bar-container__fields.has-default-search .search-bar-button {
      width: 50%;
    }
  }

  @media (min-width: 1080px) {
    .neo_search-bar-container__fields .search-bar-button {
      flex-grow: 0;
      flex-shrink: 0;
    }

    .neo_search-bar-container__fields.has-default-search {
      display: flex;
    }

    .neo_search-bar-container__fields.has-default-search .neo_search-bar--default {
      width: 100%;
    }

    .neo_search-bar-container__fields.has-default-search .search-bar-button:nth-of-type(1) {
      margin-left: 24px;
    }

    .neo_search-bar-container__fields.has-default-search .search-bar-button:nth-of-type(2) {
      margin-left: 16px;
    }
  }
</style>