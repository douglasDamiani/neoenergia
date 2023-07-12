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

		<div class="neo_search-bar--advanced">
			<div class="input-group">
				<div class="input-group-item search-bar-input-wrapper">
					<label for="${searchInputId}-keywords">Estas palavras:</label>
					<input
						autoFocus=true
						autocomplete="off"
						class="search-bar-input"
						data-qa-id="${searchInputId}-keywords"
						id="${searchInputId}-keywords"
						name="${htmlUtil.escape(searchBarPortletDisplayContext.getKeywordsParameterName())}"
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

			<div class="input-group">
        <div class="input-group-item search-bar-input-wrapper">
					<label for="${searchInputId}-mathphrase">Frase exata:</label>
					<input
						autoFocus=true
						autocomplete="off"
						class="search-bar-input"
						data-qa-id="${searchInputId}-mathphrase"
						id="${searchInputId}-mathphrase"
						name="mathphrase"
						title="${languageUtil.get(locale, "search")}"
						type="text"
						value="${htmlUtil.escape(searchBarPortletDisplayContext.getKeywords())}"
					/>

					<@liferay_aui.input
						name="mathphrase"
						type="hidden"
						value=searchBarPortletDisplayContext.getScopeParameterValue()
					/>
				</div>
			</div>

			<div class="input-group">
        <div class="input-group-item search-bar-input-wrapper">
          <label for="${searchInputId}-excludingwords">Excluir palavras:</label>
          <input
            autoFocus=true
            autocomplete="off"
            class="search-bar-input"
            data-qa-id="${searchInputId}-excludingwords"
            id="${searchInputId}-excludingwords"
            name="excludingwords"
            title="${languageUtil.get(locale, "search")}"
            type="text"
            value="${htmlUtil.escape(searchBarPortletDisplayContext.getKeywords())}"
          />

          <@liferay_aui.input
            name="excludingwords"
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
			id="submit-button"
		>
			${languageUtil.get(locale, "search-bar-submit")} <span class="material-symbols-outlined">search</span>
		</button>

		<button
			aria-label="${languageUtil.get(locale, "search-bar-advanced-search")}" 
			class="btn btn-primary search-bar-button search-bar-button--outline search-bar-advanced-search" 
			type="button"
		>
			${languageUtil.get(locale, "search-bar-advanced-search")} <span class="material-symbols-outlined">arrow_forward</span>
		</button>
    </div>
  </div>
	</@>
</div>

<script>
	const submitButton = document.querySelector("#submit-button");
  submitButton.addEventListener("click", (e) => {
    e.preventDefault();
    submitButton.closest(".form").submit();
  }) 

  const searchBarContainer = document.querySelector(".neo_search-bar-container__fields");
  const searchBarButton = document.querySelector(".search-bar-advanced-search");

  const SEARCH_CLASSES = {
		DEFAULT_SEARCH: "has-default-search",
		ADVANCED_SEARCH: "has-advanced-search"
	}
  
  searchBarButton.addEventListener("click", () => {
	const searchBarContainerClasses = searchBarContainer.classList;
    if(searchBarContainerClasses.contains(SEARCH_CLASSES.DEFAULT_SEARCH)){
       searchBarContainerClasses.add(SEARCH_CLASSES.ADVANCED_SEARCH);
	   searchBarContainerClasses.remove(SEARCH_CLASSES.DEFAULT_SEARCH);
       
	   searchBarButton.innerText = languageUtil.get(locale, "back-to-simple-search");
	} else {
	   searchBarContainerClasses.remove(SEARCH_CLASSES.ADVANCED_SEARCH);
	   searchBarContainerClasses.add(SEARCH_CLASSES.DEFAULT_SEARCH)
	}
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

  .neo_search-bar-container__fields.has-default-search .neo_search-bar--advanced {
    display: none;
  }

  .neo_search-bar-container__fields.has-advanced-search .neo_search-bar--default {
    display: none;
  }

  .neo_search-bar-container__fields.has-advanced-search .search-bar-input-wrapper label {
    color: var(--cinza-1, #3A3735);
    font-family: Lato;
    font-size: 1rem;
    font-style: normal;
    font-weight: 400;
    line-height: 1.75rem;
    flex-shrink: 0;
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

    .neo_search-bar-container__fields.has-advanced-search .search-bar-input-wrapper {
      color: var(--cinza-1, #3A3735);
      font-family: Lato;
      font-size: 1rem;
      font-style: normal;
      font-weight: 400;
      line-height: 1.75rem;
      flex-shrink: 0;
    }
  }
</style>

<#--  search suggestions  -->
<#assign searchBarPortletInstanceConfiguration = searchBarPortletDisplayContext.getSearchBarPortletInstanceConfiguration()/>
<#if searchBarPortletInstanceConfiguration.enableSuggestions() >
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.4.11/jquery.autocomplete.min.js" integrity="sha512-uxCwHf1pRwBJvURAMD/Gg0Kz2F2BymQyXDlTqnayuRyBFE7cisFCh2dSb1HIumZCRHuZikgeqXm8ruUoaxk5tA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<script type="text/javascript">
		Liferay.on('allPortletsReady', function(event) {
			const localizationMap = {
				'com.liferay.blogs.model.BlogsEntry': '<@liferay_ui["message"] key="model.resource.com.liferay.blogs.model.BlogsEntry"/>',
				'com.liferay.bookmarks.model.BookmarksEntry': '<@liferay_ui["message"] key="model.resource.com.liferay.bookmarks.model.BookmarksEntry"/>',
				'com.liferay.calendar.model.CalendarBooking': '<@liferay_ui["message"] key="model.resource.com.liferay.calendar.model.CalendarBooking"/>',
				'com.liferay.commerce.product.model.CPDefinition': '<@liferay_ui["message"] key="model.resource.com.liferay.commerce.product.model.CPDefinition"/>',
				'com.liferay.document.library.kernel.model.DLFileEntry': '<@liferay_ui["message"] key="model.resource.com.liferay.document.library.kernel.model.DLFileEntry"/>',
				'com.liferay.document.library.kernel.model.DLFolder': '<@liferay_ui["message"] key="model.resource.com.liferay.document.library.kernel.model.DLFolder"/>',
				'com.liferay.dynamic.data.lists.model.DDLRecord': '<@liferay_ui["message"] key="model.resource.com.liferay.dynamic.data.lists.model.DDLRecord"/>',
				'com.liferay.journal.model.JournalArticle': '<@liferay_ui["message"] key="model.resource.com.liferay.journal.model.JournalArticle"/>',
				'com.liferay.journal.model.JournalFolder': '<@liferay_ui["message"] key="model.resource.com.liferay.journal.model.JournalFOLDER"/>',
				'com.liferay.knowledge.base.model.KBArticle': '<@liferay_ui["message"] key="model.resource.com.liferay.knowledge.base.model.KBArticle"/>',
				'com.liferay.message.boards.model.MBMessage': '<@liferay_ui["message"] key="model.resource.com.liferay.message.boards.model.MBMessage"/>',
				'com.liferay.microblogs': '<@liferay_ui["message"] key="model.resource.com.liferay.microblogs"/>',
				'com.liferay.object.model.ObjectEntry': '<@liferay_ui["message"] key="model.resource.com.liferay.ObjectEntry"/>',
				'com.liferay.portal.kernel.model.Group': '<@liferay_ui["message"] key="model.resource.com.liferay.portal.kernel.model.Group"/>',
				'com.liferay.portal.kernel.model.Layout': '<@liferay_ui["message"] key="model.resource.com.liferay.portal.kernel.model.Layout"/>',
				'com.liferay.portal.kernel.model.User': '<@liferay_ui["message"] key="model.resource.com.liferay.portal.kernel.model.User"/>',
				'com.liferay.wiki': '<@liferay_ui["message"] key="model.resource.com.liferay."/>',
				'com.liferay.wiki.model.WikiNode': '<@liferay_ui["message"] key="model.resource.com.liferay."/>',
				'com.liferay.wiki.model.WikiPage': '<@liferay_ui["message"] key="model.resource.com.liferay."/>'
			};

			const inputElement = $('#${searchInputId}');

			const getLocalization = function(languageKey) {
				if (localizationMap.hasOwnProperty(languageKey)) {
					return localizationMap[languageKey];
				}

				return languageKey;
			}

			const initAutocomplete = () => {
				$(inputElement).devbridgeAutocomplete({
					ajaxSettings: {
						contentType: 'application/json',
						data: JSON.stringify([${searchBarPortletInstanceConfiguration.suggestionsContributorConfigurations()?join(",")}]),
						headers: {
							'Accept-Language': themeDisplay.getBCP47LanguageId(),
							'Content-type': 'application/json',
							'p_auth': Liferay.authToken
						},
						type : 'POST'
					},	        
					containerClass: 'devbridge-autocomplete',
					dataType: 'json',
					deferRequestBy: 50,
					formatGroup: function(item, type) {

						if (type == 'nan') {
							return '';
						}

						let url = '${destination}' + '?type=' +	item.data.type + '&q=' +
							encodeURIComponent($(inputElement).val());

						return	'<div class="autocomplete-group">' +
								'<span class="type">' + getLocalization(type) + '</span>' +
								'<span class="more">' +
									'<a href="#" onclick="location.href = \'' + url + '\'"><@liferay_ui["message"] key="more"/></a>' +
								'</span>' +
							'</div>';
					},
					formatResult: function(item, currentValue) {
						return item.value;
					},
					groupBy: 'type',
					minChars: ${searchBarPortletInstanceConfiguration.suggestionsDisplayThreshold()},
					noCache: false,
					noSuggestionNotice: '<@liferay_ui["message"] key="search-suggestions-there-are-no-suggestions"/>',
					onSelect: function(item) {
						if (item.data && item.data.url) {
							location.href = item.data.url;
						}
					},
					paramName: 'search',
					preserveInput: true,
					preventBadQueries: false,
					serviceUrl: function(currentValue) {
								let serviceURL = new URL("${searchBarPortletDisplayContext.getSuggestionsURL()}", Liferay.ThemeDisplay.getPortalURL());

								serviceURL.searchParams.append("currentURL", window.location.href);
								// serviceURL.searchParams.append("destinationFriendlyURL", "${destination}"); todo: remove line bellow after LPS-159730 is done
								serviceURL.searchParams.append("destinationFriendlyURL", "/search");
								serviceURL.searchParams.append("groupId", themeDisplay.getScopeGroupId());
								serviceURL.searchParams.append("plid", themeDisplay.getPlid());
								serviceURL.searchParams.append("scope", "${searchBarPortletDisplayContext.getScopeParameterValue()}");
								serviceURL.searchParams.append("search", currentValue);

								return serviceURL;	    
					},				
					showNoSuggestionNotice: true,
					transformResult: function(response) {

						let transformedResults = [] 

						if (response) {
							transformedResults = $.map(response.items, function(group) {
								return $.map(group.suggestions, function(item) {
									let type = item.attributes.fields.entryClassName;
									let url = item.attributes.assetURL;

									return {
										value: '<a href="' + url + '">' +
															'<div title="' + item.text + '" class="title">' +
																item.text +
															'</div>' +
															'<div class="summary">' + 
																item.attributes.assetSearchSummary + 
															'</div>' +
														'</a>',
										data: {
											text: item.text,
											type: type,
											url: url
										}
									};
								});
							});
							transformedResults.sort(sortByType);
						}

						return {
							suggestions: addShowAllResultsLink(transformedResults)
						};
					},
					triggerSelectOnValidInput: false,
					type: "POST"		
				});
			}

			const addShowAllResultsLink = function(results) {
				if (results.length > 0) {
					results.push({
						value: '<div class="show-all"><a href="#" onclick="javascript:location.href = \'${destination}?${searchBarPortletDisplayContext.getKeywordsParameterName()}=' + encodeURIComponent($(inputElement).val()) + '\'"><@liferay_ui["message"] key="search-suggestions-show-all"/> &raquo;</a></div>',
						data: {
							type: 'nan'
						}
					});
				}
				return results;
			}

			const sortByType = function(A, B) {
				return ((A.data.type == B.data.type) ? 0 : ((A.data.type > B.data.type) ? 1 : -1 ));
			}

			initAutocomplete();
		});
	</script>

	<style>
		.devbridge-autocomplete {
			background: #fff;
			border: none;
			box-shadow: 0 14px 36px 0 rgba(77, 98, 109, 0.25);
			max-height: none!important;
			overflow: auto;
			padding: 20px;
		}

		.devbridge-autocomplete .autocomplete-group {
			font-weight: bold;
			margin: 0 0 15px 0;
			padding: 15px 0 0 0;
		}

		.devbridge-autocomplete .autocomplete-group:first-child {
			padding-top: 0;
		}

		.devbridge-autocomplete .autocomplete-group .type {
			font-weight: normal;
			text-transform: uppercase;
			font-size: 1rem;
			margin-left: 5px;
		}

		.devbridge-autocomplete .autocomplete-group .more {
			float: right;
			margin-right: 5px;
			text-transform: lowercase;
			text-decoration: underline;
			font-weight: 400;
		}

		.devbridge-autocomplete .autocomplete-group .show-all {
			color: #008542;
			padding: 5px 5px 5px 0;
			content: "\00BB";
			margin-left: 5px;
		}

		.devbridge-autocomplete .autocomplete-group .show-all a {
			text-decoration: underline;
		}

		.devbridge-autocomplete .autocomplete-suggestion {
			margin: 0 0 15px 0;
			padding: 5px;
			white-space: normal;
		}

		.devbridge-autocomplete .autocomplete-suggestion a {
			text-decoration: none;
		}

		.devbridge-autocomplete .autocomplete-suggestion a:hover {
			text-decoration: none;
		}

		.devbridge-autocomplete .autocomplete-suggestion:last-child {
			margin: 0;
		}

		.devbridge-autocomplete .autocomplete-suggestion .title {
			overflow-x: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			color: #545454;
			font-weight: 600;
		}

		.devbridge-autocomplete .autocomplete-suggestion .summary {
			overflow-x: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			color: #7d9aaa;
			font-size: 0.75rem;
		}

		.devbridge-autocomplete .autocomplete-suggestion .show-all {
			font-size: 12.5px;
			text-decoration: underline;
		}

		.devbridge-autocomplete .autocomplete-selected:not(:last-child) {
			background: #f5f5f5;
		}

		.devbridge-autocomplete .autocomplete-no-suggestion {
			font-size: 0.875rem;
			text-align: center;
			color: #7d9aaa;
		}
	</style>
</#if>