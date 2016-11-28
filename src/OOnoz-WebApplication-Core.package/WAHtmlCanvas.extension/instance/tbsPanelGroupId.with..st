*OOnoz-WebApplication-Core
tbsPanelGroupId: anId with: aBlock
	^ self section
		class: #'panel-group';
		id: anId;
		role: #tablist;
		ariaMultiselectable: true;
		with: aBlock