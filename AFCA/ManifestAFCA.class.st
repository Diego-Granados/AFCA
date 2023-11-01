"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAFCA,
	#superclass : #PackageManifest,
	#category : #'AFCA-Manifest'
}

{ #category : #'code-critics' }
ManifestAFCA class >> ruleGuardingClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#ControlUnit #opregtomem:secondParameter:operation: #false)) #'2023-10-31T21:07:13.025-06:00') #(#(#RGClassDefinition #(#ControlUnit)) #'2023-10-31T21:07:34.56-06:00') )
]

{ #category : #'code-critics' }
ManifestAFCA class >> ruleReGuardClauseRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#ControlUnit #opregtomem:secondParameter:operation: #false)) #'2023-10-31T21:07:19.171-06:00') )
]
