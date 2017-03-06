rendering
renderComponentOn: html
	html
		tbsContainer: [ self renderMessageOn: html.
			html
				section: [ | toolbarId |
					self renderToolbarFor: (toolbarId := #toolbar) on: html.
					html tbsTable
						class: #'table-no-bordered';
						attributeAt: #'data-toggle' put: 'table';
						attributeAt: #'data-search' put: 'true';
						attributeAt: #'data-pagination' put: 'true';
						attributeAt: 'data-toolbar' put: '#' , toolbarId;
						with: [ html tableHead: [ self renderHeaderOn: html ].
							html
								tableBody: [ OOUser selectAll
										do: [ :theme | html tableRow: [ (self tableEntriesFrom: theme On: html) do: [ :content | html tableData: content ] ] ] ] ] ] ].
	html document
		addLoadScript:
			'$(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});
			$("table").on("all.bs.table", function (){ $(".material-switch").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)}); });'
				js