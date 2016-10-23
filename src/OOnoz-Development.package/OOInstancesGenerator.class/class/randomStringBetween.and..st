helpers
randomStringBetween: min and: max
	^ (min to: max) collect: [ :each | '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#$<>&/-_\{}[]()=°*+@     ' atRandom ] as: String