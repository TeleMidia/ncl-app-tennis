<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated	by NCL Eclipse -->
<ncl id="causalConnBase" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase>
			<causalConnector id="onBeginStart">
				<connectorParam name="delay"/>
				<simpleCondition role="onBegin"/>
				<simpleAction role="start" delay="$delay" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<causalConnector id="onEndStop">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<causalConnector id="onBeginSetStart">
				<connectorParam name="var"/>
				<simpleCondition role="onBegin"/>
				<compoundAction operator="seq">
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$var"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onKeySelectionStopSetStart">
				<connectorParam name="varSet"/>
				<connectorParam name="keyCode"/>
				<simpleCondition role="onSelection" key="$keyCode"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndSet">
				<connectorParam name="varSet"/>
				<simpleCondition role="onEnd"/>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet"/>
			</causalConnector>
			<causalConnector id="onKeySelectionStopStart">
				<connectorParam name="keyCode"/>
				<simpleCondition role="onSelection" key="$keyCode"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionStart">
				<simpleCondition role="onSelection"/>
				<simpleAction role="start" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<causalConnector id="onSelectionStopStart">
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionStopStartDuration">
				<connectorParam name="duration"/>
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" duration="$duration" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionOnBeginStopStartDuration">
				<connectorParam name="duration"/>
				<connectorParam name="value1"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection"/>
					<simpleCondition role="onBegin"/>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" duration="$duration" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionOnStateStopStartDuration">
				<connectorParam name="duration"/>
				<connectorParam name="vState"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="onState" eventType="presentation" attributeType="state"/>
						<valueAssessment value="$vState"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" duration="$duration" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionStopStartSet">
				<connectorParam name="duration"/>
				<connectorParam name="vState"/>
				<connectorParam name="varSet"/>
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" duration="$duration" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionOnStateSet">
				<connectorParam name="vState"/>
				<connectorParam name="varSet"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="onState" eventType="presentation" attributeType="state"/>
						<valueAssessment value="$vState"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet"/>
			</causalConnector>
			<causalConnector id="onKeySelectionOnStateSet">
				<connectorParam name="key"/>
				<connectorParam name="vState"/>
				<connectorParam name="varSet"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection" key="$key"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="onState" eventType="presentation" attributeType="state"/>
						<valueAssessment value="$vState"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet"/>
			</causalConnector>
			<causalConnector id="onSelectionORonKeySelectionSet">
				<connectorParam name="vState"/>
				<connectorParam name="varSet"/>
				<connectorParam name="key"/>
				<connectorParam name="duration"/>
				<compoundCondition operator="or">
					<simpleCondition role="onKeySelection" key="$key"/>
					<simpleCondition role="onSelection"/>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionORonKeySelectionStopStartSet">
				<connectorParam name="vState"/>
				<connectorParam name="varSet"/>
				<connectorParam name="key"/>
				<connectorParam name="duration"/>
				<compoundCondition operator="or">
					<simpleCondition role="onKeySelection" key="$key"/>
					<simpleCondition role="onSelection"/>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionORonKeySelectionOnStateSet">
				<connectorParam name="vState"/>
				<connectorParam name="varSet"/>
				<connectorParam name="key"/>
				<compoundCondition operator="and">
					<compoundCondition operator="or">
						<simpleCondition role="onKeySelection" key="$key"/>
						<simpleCondition role="onSelection"/>
					</compoundCondition>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="onState" eventType="presentation" attributeType="state"/>
						<valueAssessment value="$vState"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet"/>
			</causalConnector>
			<causalConnector id="onEndAttributionOnStateSet">
				<connectorParam name="vState"/>
				<connectorParam name="varSet"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="onState" eventType="presentation" attributeType="state"/>
						<valueAssessment value="$vState"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet"/>
			</causalConnector>
			<causalConnector id="onEndAttributionOnStateStopStartSet">
				<connectorParam name="vState"/>
				<connectorParam name="duration"/>
				<connectorParam name="varSet"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="onState" eventType="presentation" attributeType="state"/>
						<valueAssessment value="$vState"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAttributionOnStateStopStart">
				<connectorParam name="vState"/>
				<connectorParam name="duration"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="onState" eventType="presentation" attributeType="state"/>
						<valueAssessment value="$vState"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionOnStateStopStartSet">
				<connectorParam name="duration"/>
				<connectorParam name="vState"/>
				<connectorParam name="varSet"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="onState" eventType="presentation" attributeType="state"/>
						<valueAssessment value="$vState"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionStopStartSet">
				<connectorParam name="duration"/>
				<connectorParam name="varSet"/>
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onKeySelectionSet">
				<connectorParam name="keyCode"/>
				<connectorParam name="varSet"/>
				<simpleCondition role="onSelection" key="$keyCode"/>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
			</causalConnector>
			<causalConnector id="onSelecionVarEqStart">
				<connectorParam name="varCmp"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="cmpEq" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="$varCmp"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onSelecionVarEqStopStartSet">
				<connectorParam name="varCmp"/>
				<connectorParam name="delay"/>
				<connectorParam name="duration"/>
				<connectorParam name="varSet"/>
				<compoundCondition operator="and">
					<simpleCondition role="onSelection"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="cmpEq" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="$varCmp"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq" delay="$delay"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onBeginVarEqStart">
				<connectorParam name="varCmp"/>
				<compoundCondition operator="and">
					<simpleCondition role="onBegin"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="cmpEq" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="$varCmp"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onBeginStartSet">
				<connectorParam name="varSet"/>
				<connectorParam name="delay"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onBegin"/>
				<compoundAction operator="seq">
					<simpleAction role="start" max="unbounded" qualifier="seq" delay="$delay"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAttributionStart">
				<simpleCondition role="onEndAttribution"/>
				<simpleAction role="start" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<causalConnector id="onEndAttributionStopStart">
				<simpleCondition role="onEndAttribution"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAttributionStopStartSet">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onEndAttribution"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAttributionStartSetDelay">
				<connectorParam name="var"/>
				<connectorParam name="delay"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onEndAttribution"/>
				<compoundAction operator="seq">
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$var" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAttributionSet">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onEndAttribution"/>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
			</causalConnector>
			<causalConnector id="onSelectionStopSet">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onSelection"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onSelectionSet">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onSelection"/>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
			</causalConnector>
			<causalConnector id="onSelectionStop">
				<connectorParam name="var"/>
				<simpleCondition role="onSelection"/>
				<simpleAction role="stop" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<causalConnector id="onOrSelectionStopStartSet">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onSelection" qualifier="or" max="unbounded"/>
				<compoundAction operator="seq">
					<simpleAction role="stop"/>
					<simpleAction role="start"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onBeginSet">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onBegin"/>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
			</causalConnector>
			<causalConnector id="onEndStopSet">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onEnd"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onOrSelectionSetStop">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onSelection" max="unbounded" qualifier="or"/>
				<compoundAction operator="seq">
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
					<simpleAction role="stop"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndStart">
				<simpleCondition role="onEnd"/>
				<simpleAction role="start" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<causalConnector id="onEndStartSet">
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<simpleCondition role="onEnd"/>
				<compoundAction operator="seq">
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAttributionCmpVarStart">
				<connectorParam name="var"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="cmpEq" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="$var"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="start" max="unbounded" qualifier="seq"/>
			</causalConnector>
			<causalConnector id="onEndAttributionCmpVarSet">
				<connectorParam name="varCmp"/>
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="cmpEq" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="varCmp"/>
					</assessmentStatement>
				</compoundCondition>
				<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
			</causalConnector>
			<causalConnector id="onEndAttributionCmpVarStopStart">
				<connectorParam name="varCmp"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="cmpEq" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="$varCmp"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAttributionCmpVarStopStartSet">
				<connectorParam name="varCmp"/>
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="cmpEq" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="$varCmp"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onEndAttributionCmpVarAbortStopStartSet">
				<connectorParam name="varCmp"/>
				<connectorParam name="varSet"/>
				<connectorParam name="duration"/>
				<compoundCondition operator="and">
					<simpleCondition role="onEndAttribution"/>
					<assessmentStatement comparator="eq">
						<attributeAssessment role="cmpEq" attributeType="nodeProperty" eventType="attribution"/>
						<valueAssessment value="$varCmp"/>
					</assessmentStatement>
				</compoundCondition>
				<compoundAction operator="seq">
					<simpleAction role="start" max="unbounded" qualifier="seq"/>
					<simpleAction role="abort" max="unbounded" qualifier="seq"/>
					<simpleAction role="stop" max="unbounded" qualifier="seq"/>
					<simpleAction role="set" max="unbounded" qualifier="seq" value="$varSet" duration="$duration"/>
				</compoundAction>
			</causalConnector>
		</connectorBase>
	</head>
</ncl>
