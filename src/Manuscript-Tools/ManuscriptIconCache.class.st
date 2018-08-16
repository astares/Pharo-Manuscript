"
An icon cache
"
Class {
	#name : #ManuscriptIconCache,
	#superclass : #Object,
	#classVars : [
		'Icons'
	],
	#category : #'Manuscript-Tools-Utilities'
}

{ #category : #accessing }
ManuscriptIconCache class >> iconNamed: aSymbol [
	(self class canUnderstand: aSymbol) ifFalse: [ ^super iconNamed: aSymbol ].
	^self icons at: aSymbol ifAbsentPut: [self perform: aSymbol]
]

{ #category : #accessing }
ManuscriptIconCache class >> icons [
	^ Icons ifNil: [Icons := Dictionary new]
]

{ #category : #icons }
ManuscriptIconCache class >> manuscriptIcon [
	^ self icons
			at: #manuscriptIcon
			ifAbsentPut: [ Form fromBinaryStream: self manuscriptIconContents base64Decoded readStream ].
]

{ #category : #'private - icons' }
ManuscriptIconCache class >> manuscriptIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACMElEQVR42p2TXUhTYRjH/+fs
rH3U2tyKTGj41SFQOzYKZlpGEeKkMCiNbsxCJYwFXQSW9KHprV0JhnQxzGhTd2Eyh4HpXDdD
TdYoy2JLy/wopZPYnNvpPRSROXP1wHvxvs/7/p7n//D+KZCQyZL1GlWucXrW0iYgHMFfg6IN
CadNH/nnYx9470tKPNJpThampdrsoW8j7tHARfNnfmAo2tN4FbfrRHrjHVa7P6/DV1nh8jfe
XQGQ06QbOhKe+tTa7A1cqV5cmpwV83JGuzk3tbbaqK8wyyUSmXhvFSB9p81usQKOduBJJyAs
8XMvJm5fFyILXw+k3KpXy3XbuWzgcAnQVQfc6/kDkMHa7D1ugGGA9wHA2gT4noodAWwacLwc
SMr4IeW+GWjqXAPgINW5TECfBIw+AxZ5ss8BeCLG7wF2m9YBXCgFJt+SioVA0TlAKgX6HwLe
R0CcGiizxACY8gMKktEqAdUGIisIaBRkbQLKW2IAZGUB+ceA7gcAvQzknQHGiZzhthgB2WTa
RwtIBzpSXQJ8mSb6h4FB6z8AgiHA4wQSNwJ7jcDWlP8A9JLh7SDaj5jWAUiZ+C1sYkP9kO/U
2crzEumaALIvaxFwrcjR3uy4dHlmYewd9ftf5ziOVSvqakpLTMXBELUK0NrgdnrCVVddLtcv
r1DRTGPYk2PYl1lbM//qUIEI2JY82Od8fePm496ufpJe4daogJ9BJ8TlH1QySuWbmY5uAUJU
m38H8zkaIDSqcKEAAAAASUVORK5CYII='

]

{ #category : #icons }
ManuscriptIconCache class >> manuscriptLoginIcon [
	^ self icons
			at: #manuscriptLoginIcon
			ifAbsentPut: [ Form fromBinaryStream: self manuscriptLoginIconContents base64Decoded readStream ].
]

{ #category : #'private - icons' }
ManuscriptIconCache class >> manuscriptLoginIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9i
ZSBJbWFnZVJlYWR5ccllPAAAAfNJREFUeNpi/P//PwMlgJFiA0L3PkYXiwbiOCA2AOJ/QHwJ
iOcD8QqYglVOMnDFLP/+wtlmQJwiI8IVqyLGwyrOw8oMdNv/V19+O9999cXu8ZtvlkD5uVAD
kQ1ghLFTdBQEEqT42ZivPvr4Y/+Hn2CjZQTZWYwU+Nll+Ngzj97+ABLKR/GC3+YnYM1SIlyT
lSS52Y5dffP137//RVBng0AiECcD8SmYC/j5GBIW2UkvABvgvQ5swHE9LSGzJ0+//Hj38RfI
hjn4Ag5oACjkU5Y6S89l+feHkY2JkVGbgYmZ6d2733///WdchK6Bh4sBJap+/wBTc8K2PmNm
+fub4e8/xv8MX3//+//7F8NXoMQvdAN+f2fE5RgVpr+/Gf/++cV49eevv//ZOFj5gPxMIGZA
xp+/MjAi418/GBmAuG99iGQZs7xPMcP/fwyMwMhw55XkYP/08pc9MGo/AMXuAjEnEKcD8Rwg
lgXi+0D8nuEPk+COBIkicCDazXgGc06fmDZ3DhM7E/P7e99//v7yFxyNbDzMzIIqnOy/v/79
8+b6t16gUNXBdElEOvj7B+6/uc8vfmPglWXP5FPiZGXhYuIACf75/u/vh8e/fn55+msC0D6M
2EFOiVeBuOjjg5/HgTgGmpRB4AI0TWygTWai1ACAAAMAFJDf0nu5SvUAAAAASUVORK5CYII='

]

{ #category : #icons }
ManuscriptIconCache class >> manuscriptLogoutIcon [
	^ self icons
			at: #manuscriptLogoutIcon
			ifAbsentPut: [ Form fromBinaryStream: self manuscriptLogoutIconContents base64Decoded readStream ].
]

{ #category : #'private - icons' }
ManuscriptIconCache class >> manuscriptLogoutIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9i
ZSBJbWFnZVJlYWR5ccllPAAAAhJJREFUeNqkUz1oFEEUnpndudm9y14CJxdDVsVC7SSVnVwZ
y1SWNl5hfShoISqRKyxsbQ6sTSMWBoQUwUYQLa2UgDkv3sEZyOb2f2bW9469c11jlYGP933z
3r558/YNzbKMnGbRm7v9//meA9qAHqBTdLxquXPOMk3ISVApad+46jpoy77iYloRUsA6oIZc
xpRMYj21uc8GtJCXEmDAFPeajv3aIGwIvJZGlIwDRdCCtmnGRo2atQ2883cCCdklaQnDeHTJ
rVsyhSol0UlIyJFUBG0eQ66cq1ucsicbbwdr8wQKHIDbbtMRewM/SZJsE3SIJ4dVNq0ANe73
R2G62lwQoNuFCqiRKbrBbdP8MYxS0C8BePfelzeHx2hRA7b6w0hWbG4CX58lMKHLdc4ZjaCS
MMBCyRgdCw3dmf0+iMH105cKekgp6OU/CSTxtNKZ1JoYBuNJrC/A/vcT5mKlIhiDGjP4Zly8
glIp3T4OlLTqgoO+lZdcRru6JLg3kRL4TrmJvYNvQeycFdy0zPugu4C13Ie2C/ud2rLgGIfx
81G+/uJgxh86q+LB4kXL8vbjNBinUgZKmVXDqJ7h5uJ5wQ+/hpE/Sp6+v7PSnfcAhyhfm0f7
iRH8kneXLtuVhissw6JMxZlOPaUGHye+DPUzOLNbbIxZGs3HsaffjT75+J+vAbChe4AP+aP6
/M9rPO1z/i3AANDmUfM48z/dAAAAAElFTkSuQmCC'

]

{ #category : #icons }
ManuscriptIconCache class >> manuscriptSearchIcon [
	^ self icons
			at: #manuscriptSearchIcon
			ifAbsentPut: [ Form fromBinaryStream: self manuscriptSearchIconContents base64Decoded readStream ].
]

{ #category : #'private - icons' }
ManuscriptIconCache class >> manuscriptSearchIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9i
ZSBJbWFnZVJlYWR5ccllPAAAAhtJREFUeNqMks9rE0EUx2d/p8Fums1KcWkgNlDaSFIP/gk5
VXoRsRSLpVgKHjxU8SI9WXtNwUshFMyhUC8FTwoiBW9C14IhpammgZKqqTGaZDcbszs761tB
aNON7Re+zOF958ObeY9yHAe5Sq+vy3DMgm+Ah8E74Bfg1bnJySbqIsoFrKyt3aZpeiURi/GR
cJgLiCJdq9dJ8eDAyuXzJmRm7k1NbXgCnmUy/XD58/Vk0i9LEtMZOKpU7NebmwZABu5PTzc6
6zTG+G58ZEQI9vUxNiGo03IoxMSGhnjIzXp1QFsY37kciXAYwt0cHRzkIDfjBWBt21Z4QaDc
YDdB3e30kmcHpmV91XTd8Wr/n6FOoINvngAgZ9yf/t8Tcru7cB8/93wCFFa3VPWxoijsRVk+
NYVyuWyr29tmKT6mTrw77L8VV45O7cGjpaW/e3B1dJSPRqNcSJLoCoxvv1jEH7NZk9G0Xv3m
w5aFHaeqt+fr+1z6BMDVg8VF8dgmJsAfwBulxERODARfhaVe37DCU2/zVaOqmfPNEps+Aeim
8ZdfBnwM88msMT2xKxdQIsyjN9mfxg+AtL+zaRqdIQgdak2ygPykldvR0VbxN0rGJX9AEJZp
0Z47E+CKNJgUTHIBs6SV3zPQ+0ILjV0L+n0cl2LROcW06ZTRJojzoaeFQqvHYBy79guTcwNc
CQggDQdhn/NkT20S5FDjfwQYAChaRsx7+Z3rAAAAAElFTkSuQmCC'

]

{ #category : #initialization }
ManuscriptIconCache class >> reset [
	<script>
	
	Icons := nil
]
