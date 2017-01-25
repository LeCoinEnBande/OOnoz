*OOnoz-WebApplication-Core
tbsArticlePanelFooter: aBlock
	^ self footer
		class: #'panel-footer';
		class: #clearfix;
		with: [ self div
				tbsPullRight;
				with: aBlock ]