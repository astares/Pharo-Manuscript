"
Manuscript
"
Class {
	#name : #BaselineOfManuscript,
	#superclass : #BaselineOf,
	#category : #BaselineOfManuscript
}

{ #category : #baselines }
BaselineOfManuscript >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'Manuscript-Core';
			package: #'Manuscript-Tools' with: [
				spec requires: #(#'Manuscript-Core' ). ];
			package: #'Manuscript-Tools-Calypso' with: [
				spec requires: #(#'Manuscript-Tools' ). ];
			package: #'Manuscript-Tests-Core' with: [
				spec requires: #(#'Manuscript-Core' ). ].
		spec 
			group: 'Core' with: #(#'Manuscript-Core' );
			group: 'Tools' with: #(#'Manuscript-Tools' 'Manuscript-Tools-Calypso' );
			group: 'Tests' with: #(#'Manuscript-Tests-Core' );
			group: 'all' with: #('Core' 'Tools' 'Tests' );
			group: 'default' with: #('all' ). ].

]
