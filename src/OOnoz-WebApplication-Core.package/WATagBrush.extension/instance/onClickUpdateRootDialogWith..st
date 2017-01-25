*OOnoz-WebApplication-Core
onClickUpdateRootDialogWith: aBlock
	self
		onClick: ((canvas jQuery id: #'root-dialog') load html: aBlock);
		dataToggle: 'modal';
		dataTarget: #'#root-dialog__open'