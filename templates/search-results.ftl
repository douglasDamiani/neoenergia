<div class="neo_search-results">
	<ul id="search-results-display-list">
		<#if entries?has_content>
			<#list entries as entry>
				<li>
					<div class="autofit-col autofit-col-expand">
						<section class="autofit-section">
							<a class="neo_search-results__item" href="${entry.getViewURL()}">
								<h4>
									${entry.getHighlightedTitle()}
								</h4>

								<p>
									<#if entry.getContent()?has_content>${entry.getContent()}
									</#if>

									<span class="entry-view-url">${entry.getViewURL()}</span>
								</p>
							</a>
						</section>
					</div>
				</li>
			</#list>
		</#if>
	</ul>

	<#if searchContainer.getTotal() == 1>
		<#assign searchTotalLabelInner = languageUtil.get(locale, "1-result")/>
	<#else>
		<#assign searchTotalLabelInner = languageUtil.format(locale, "x-results", [searchContainer.getTotal()], false)/>
	</#if>

	<@liferay_aui.script use="aui-base">
		A.one("#search-total-label").html('${searchTotalLabelInner}');

		A.one('#search-results-display-list').delegate(
			'click',
			function(event) {
				var currentTarget = event.currentTarget;

				currentTarget.siblings('.search-results-list').toggleClass('hide');
			},
			'.expand-details'
		);
	</@liferay_aui.script>
<div>


<style>
	.neo_search-results > ul {
		display: flex;
		flex-direction: column;
		row-gap: 32px;
		list-style-type: none;
		padding: 0;
	}

	.neo_search-results > li {
		list-style-type: none;
	}

	a.neo_search-results__item {
		text-decoration: none;
	}

	.neo_search-results__item > h4 {
		color: var(--verde-2-principal, #00A443);
		font-size: 1.25rem;
		line-height: 1.875rem;
		font-style: normal;
		font-weight: 400;
	}

	@media (min-width: 1080px) {
		.neo_search-results__item > h4 {
			font-size: 1.75rem;
			line-height: 2.25rem;
		}
	}

	.neo_search-results__item > p {
		color: var(--cinza-1, #3A3735);
		font-size: 1rem;
		font-family: Lato;
		font-style: normal;
		font-weight: 400;
		line-height: 1.75rem;
		margin-bottom: 0;
	}

	.neo_search-results__item span.highlight.mark {
		box-shadow: none;
		background: none;
		padding: 0;
		font-weight: 700;
	}

	.neo_search-results__item span.highlight.mark::before {
		content: none;
	}

	.neo_search-results__item > p > span.entry-view-url {
		color: var(--verde-2-principal, #00A443);
		display: block;
		max-width: 514px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}

	.neo_search-results__item > p > span.entry-view-url:hover {
		text-decoration: underline;
	}

	.neo_search-results .pagination-bar {
		margin-top: 32px;
	}

	.neo_search-results .pagination-bar .pagination-items-per-page button {
		font-weight: 700;
	}

	.neo_search-results .pagination-bar .pagination-items-per-page.show button {
		background: var(--verde-2-principal, #00A443);
		color: var(--branco, #FFF);
		font-weight: 700;
	}

	.neo_search-results .pagination-bar .page-item:not(.disabled) svg {
		fill: var(--verde-2-principal, #00A443);
	}

	.neo_search-results .pagination-bar .page-item > a {
		border-radius: 8px;
	}

	.neo_search-results .pagination-bar .page-item.active > a {
		background: var(--verde-2-principal, #00A443);
		color: var(--branco, #FFF);
		text-align: center;
		font-size: 1rem;
		line-height: 1.75rem;
		font-weight: 700;
	}
</style>