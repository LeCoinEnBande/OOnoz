rendering
renderContentOn: html
	html
		mdlMiniFooter: [ html
				mdlMiniFooterLeftSection: [ self renderLeftSectionContentOn: html ];
				mdlMiniFooterRightSection: [ self renderRightSectionContentOn: html ] ]