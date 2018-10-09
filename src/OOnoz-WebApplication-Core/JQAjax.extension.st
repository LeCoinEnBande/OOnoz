Extension { #name : #JQAjax }

{ #category : #'*OOnoz-WebApplication-Core' }
JQAjax >> serializeThisCheckbox [
	"Serialize the receiving form element and a following hidden form element. This is required in case of a check-box or multi-select list."

	self
		serialize:
			(self jQuery this
				previous: 'input:hidden';
				addBack)
]
