voyage
mongoRole
	<mongoDescription>
	^ VOToOneDescription new
		attributeName: 'role';
		accessor: (MAPluggableAccessor read: [ :user | user role mongoDescription ] write: [ :user :string | user role: (OOAbstractRole roleFrom: string) ]);
		yourself