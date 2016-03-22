"
An icon cache
"
Class {
	#name : #FGBIconCache,
	#superclass : #Object,
	#classVars : [
		'Icons'
	],
	#category : #'FogBugz-Tools-Utilities'
}

{ #category : #icons }
FGBIconCache class >> fogBugzIcon [
	^ self icons
			at: #'fogBugzIcon'
			ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self fogBugzIconContents readStream) ].
]

{ #category : #'private - icons' }
FGBIconCache class >> fogBugzIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACjUlEQVR42mNkIAKI8wqpA6kw
IO55+fndd2Q5RkKaJXiFwlRkeOqlRDnUHj7/dunhi28NLz6/20yUAdICwknxXvJzdZT44GJr
9z/9d+zyW+fnn94dwGuAJK+QnpOJ2DFvawluEP/W4y8MogLsDK/f/2RYuefJ6uvPXoRhGAD0
qyQzI4OXohS3s4YCX6CDsQgHMyNEye5TrxhUNTQYXr16w3Di7L1DJ24/sUcxQJJPKMZQTXCG
h4UYl4gAO1aXvfv0i+Hf6ycME3d/67n75k0p3ACgc40cjERPaCnysSrJcAEFEfpfAZ0szM/G
wMzEyPDg+df/P25d+aUs8OdN3WEeu4cf3t8DqzRVllnqZi4WpaXEi6IZBH79+cdw89EXhjPX
3l+5dv9Tz59//9fZSP+s0xD+o9F69KcvWHWYndodD0txZQ5WZpwx0jTvRsONZy8aoWHF5Cz/
feejj0wpjECOoI+1xGNnEzFuXJp//P7LUD39ahYw6qbDxJQEBfWZmRg4Ge205db72UoFSIlw
4LT96evvDBNW3MkFOn8qNNx4gSnyIzgQPU2U7sV4yCqi+/3xy28M3Ey/GRjYORn4eVgZNh56
fubN42dzv/5mtNcU/iO66PJ3F7ABwKQqLSvGVW+pJxQFdAW3nDgXw/5DNxlkuP4wvPvHwcDK
L8ygLs/DcO/CjafSzB+fyfL+MZ59kXP96RccJUBXPIBbCwwLLmCan+Uk9zNalvU9gyz3H4aN
t9nfH3jKPYOLm/2TDvcH8Trrr/nnXzF/mn2Bs+3ia7Y+oAF/0FMio7Hk3+Bsg09ztUX+86Xu
4Oncfe9LBUxeGRjeX34zngZqfIk3M3mp8AYKc/4z3vWAvRao+D8DHgAAEYf2Ff/ZkDcAAAAA
SUVORK5CYII='

]

{ #category : #accessing }
FGBIconCache class >> iconNamed: aSymbol [

	^self icons at: aSymbol ifAbsentPut: [self perform: aSymbol]
]

{ #category : #accessing }
FGBIconCache class >> icons [
	^ Icons ifNil: [Icons := Dictionary new]
]

{ #category : #initialization }
FGBIconCache class >> reset [
	<script>
	
	Icons := nil
]