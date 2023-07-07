<#if assetCategoriesSearchFacetDisplayContext.getVocabularyNames()?has_content>
	<#assign vocabularyNames = assetCategoriesSearchFacetDisplayContext.getVocabularyNames() />
</#if>

<div class="neo_category-facet">
	<#if vocabularyNames?has_content>
				<@liferay_ui["panel-container"]
				extended=true
				id="${namespace + 'PanelContainer'}"
				markupView="lexicon"
				persistState=true 
			>
		<#list vocabularyNames as vocabularyName>
				<@liferay_ui.panel
					collapsible=true
					cssClass="neo_category-facet__panel"
					id="${namespace + 'CategoriesPanel' + vocabularyName?index}"
					markupView="lexicon"
					persistState=true
					title="${htmlUtil.escape(vocabularyName)}"
				>

					<#assign termDisplayContexts=assetCategoriesSearchFacetDisplayContext.getBucketDisplayContexts(vocabularyName)/>
					
					<#list termDisplayContexts as termDisplayContext>
						<#assign 
							frequency=termDisplayContext.getFrequency()
							frequencyVisible=termDisplayContext.isFrequencyVisible()
							id=termDisplayContext.getFilterValue()
							name=htmlUtil.escape(termDisplayContext.getBucketText())
							selected=termDisplayContext.isSelected()
						/>
							
						<div class="facet-term-group">
								<input 
									autocomplete="off"
									${selected?then("checked", "")}
									class="facet-term"
									data-term-id=${id}
									id=${id}
									disabled
									onChange="Liferay.Search.FacetUtil.changeSelection(event);"
									type="checkbox"
								>
								<label for="${id}">
									${name} <#if frequencyVisible>(${frequency})</#if>
								</label>
						</div>
					</#list>
				</@>
		</#list>
			</@>
		<#if !assetCategoriesSearchFacetDisplayContext.isNothingSelected()>
			<@clay.button
				cssClass="facet-clear-btn"
				displayType="primary"
				id="${namespace + 'facetAssetCategoriesClear'}"
				onClick="Liferay.Search.FacetUtil.clearSelections(event);"
			>
				<strong>${languageUtil.get(locale, "clear")}</strong>
			</@clay.button>
		</#if>
	</#if>
</div>

<style>
	.neo_category-facet, .neo_category-facet .panel-group  {
		display: flex;
		flex-direction: column;
		row-gap: 16px;
	}

	.neo_category-facet__panel {
		border-radius: 16px !important;
		background-color: var(--background-sand, #FFF5EC) !important;
	}

	.neo_category-facet__panel .panel-header {
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 16px;
		text-decoration: none;
	}

	.neo_category-facet__panel .panel-header:focus {
		box-shadow: none;
	}

	.neo_category-facet__panel .panel-header .collapse-icon-closed,  .neo_category-facet__panel .panel-header .collapse-icon-open {
		position: unset;
		flex-shrink: 0;
		margin-left: 8px;
	}

	.neo_category-facet__panel .panel-header .panel-title {
		text-transform: unset;
		color: var(--verde-1-forest, #00402A);
		font-size: .875rem;
		font-weight: 700;
		line-height: 1.25rem;
	}

	.neo_category-facet__panel .panel-body {
		padding: 0 16px 16px;
		display: flex;
		flex-direction: column;
		row-gap: 16px;
	}

	.neo_category-facet .facet-term {
		position: absolute;
		overflow: hidden;
		clip: rect(0 0 0 0);
		height: 1px;
		width: 1px;
		margin: -1px;
		padding: 0;
		border: 0;
	}

	.neo_category-facet .facet-term + label {
		position: relative;
		font-size: .875rem;
		line-height: 1.25rem;		
		font-weight: 400;
		cursor: pointer;
		display: flex;
		align-items: top;
		color: var(--cinza-1, #3A3735);
		margin-bottom: 0;
	}

	.neo_category-facet .facet-term + label::before {
		content: " ";
		display: inline-block;
		flex-shrink: 0;
		margin-top: 2.5px;
		margin-right: 8px;
		width: 16px;
		height: 16px;
		box-shadow: none;
		border-radius: 4px;
		border: 1px solid var(--cinza-3, #89837E);
	}

	.neo_category-facet .facet-term:focus + label::before, .neo_category-facet .facet-term:active + label::before {
		border: 1px solid var(--verde-2-principal, #00A443);
	}

	.neo_category-facet .facet-term:checked + label::before {
		border: 1px solid var(--verde-2-principal, #00A443);
		background: var(--verde-2-principal, #00A443);
	}

	.neo_category-facet .facet-term:checked + label::after {
		content: " ";
		background-image: url("data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8' standalone='no'%3F%3E%3Csvg height='48' viewBox='0 -960 960 960' width='48' version='1.1' id='svg4' sodipodi:docname='done_FILL0_wght400_GRAD0_opsz48 (1).svg' inkscape:version='1.2.2 (b0a8486541, 2022-12-01)' xmlns:inkscape='http://www.inkscape.org/namespaces/inkscape' xmlns:sodipodi='http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd' xmlns='http://www.w3.org/2000/svg' xmlns:svg='http://www.w3.org/2000/svg'%3E%3Cdefs id='defs8' /%3E%3Csodipodi:namedview id='namedview6' pagecolor='%23ffffff' bordercolor='%23000000' borderopacity='0.25' inkscape:showpageshadow='2' inkscape:pageopacity='0.0' inkscape:pagecheckerboard='0' inkscape:deskcolor='%23d1d1d1' showgrid='false' inkscape:zoom='18.1875' inkscape:cx='15.202749' inkscape:cy='23.972509' inkscape:window-width='1920' inkscape:window-height='1075' inkscape:window-x='0' inkscape:window-y='0' inkscape:window-maximized='1' inkscape:current-layer='svg4' /%3E%3Cpath d='M378-246 154-470l43-43 181 181 384-384 43 43-427 427Z' id='path2' style='fill:%23ffffff' /%3E%3C/svg%3E%0A");	background-repeat: no-repeat;
		background-size: 16px 16px;
		background-position: center;
		position: absolute;
		left: 0px;
		margin-top: 2px;
		text-align: center;
		width: 16px;
		height: 16px;
	}
</style>