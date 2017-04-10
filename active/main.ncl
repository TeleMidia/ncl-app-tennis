<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="ginga_tennis_active" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<ruleBase>
			<rule id="player1" var="child.index" value="1" comparator="eq"/>
			<rule id="player2" var="child.index" value="2" comparator="eq"/>
			<rule id="isPlayer_1_hit" var="parent.player_1_hit" value="true" comparator="eq"/>
			<rule id="isPlayer_2_hit" var="parent.player_2_hit" value="true" comparator="eq"/>
		</ruleBase>
		<connectorBase>
			<importBase documentURI="./connBase.ncl" alias="conn"/>
		</connectorBase>
	</head>
	<body>
		<!--**************************************************************
		    Global: Medias
		    **************************************************************-->
		<media id="settings" type="application/x-ginga-settings">
			<property name="child.index" value="1"/>
		</media>
		<!--**************************************************************
		    Initial Scene: Medias
		    **************************************************************-->
		<media id="mBackground" src="media/background.jpg">
			<property name="height" value="100%"/>
			<property name="width" value="100%"/>
			<property name="left" value="0%"/>
			<property name="top" value="0%"/>
			<property name="zIndex" value="0"/>
		</media>
		<media id="mLogo1" src="media/logo_part1.png">
			<property name="height" value="25%"/>
			<property name="width" value="50%"/>
			<property name="left" value="25%"/>
			<property name="top" value="20%"/>
			<property name="zIndex" value="1"/>
		</media>
		<media id="mLogo2" src="media/logo_part2.png">
			<property name="height" value="25%"/>
			<property name="width" value="50%"/>
			<property name="left" value="35%"/>
			<property name="top" value="40%"/>
			<property name="zIndex" value="1"/>
		</media>
		<media id="mStart" src="media/start.png">
			<property name="height" value="10%"/>
			<property name="width" value="25%"/>
			<property name="left" value="35%"/>
			<property name="top" value="70%"/>
			<property name="zIndex" value="2"/>
			<property name="focusIndex" value="1"/>
		</media>
		<!--**************************************************************
		    Initial Scene: Links
		    **************************************************************-->
		<port id="p0" component="mBackground"/>
		<link xconnector="conn#onBeginStart">
			<bind role="onBegin" component="mBackground"/>
			<bind role="start" component="mLogo1"/>
			<bind role="start" component="mLogo2"/>
			<bind role="start" component="mStart"/>
		</link>
		<link xconnector="conn#onSelectionStopStart">
			<bind role="onSelection" component="mStart"/>
			<bind role="stop" component="mLogo1"/>
			<bind role="stop" component="mLogo2"/>
			<bind role="stop" component="mStart"/>
			<bind role="start" component="players"/>
		</link>
		<!--**************************************************************
		    Player ready Scene: Links
		    **************************************************************-->
		<switch id="players">
			<bindRule constituent="player1_game_ref" rule="player1"/>
			<bindRule constituent="player2_game_ref" rule="player2"/>
			<defaultComponent component="player1_game_ref"/>
			<context id="player1_game_ref" refer="player1_game"/>
			<context id="player2_game_ref" refer="player2_game"/>
		</switch>
		<!--**************************************************************
		    Player 1 Context
		    **************************************************************-->
		<context id="player1_game">
			<!--**************************************************************
		    Global: Medias
		    **************************************************************-->
			<media id="globalVarPlayer1" type="application/x-ginga-settings">
				<property name="parent.player_1_hit"/>
			</media>
			<!--**************************************************************
		    Player 1 Scene: Medias
		    **************************************************************-->
			<media id="mBackground_player1" src="media/background_player1.jpg">
				<property name="height" value="100%"/>
				<property name="width" value="100%"/>
				<property name="left" value="0%"/>
				<property name="top" value="0%"/>
				<property name="zIndex" value="0"/>
			</media>
			<media id="mPlayer1" src="media/player1_ready.png">
				<property name="height" value="50%"/>
				<property name="width" value="35%"/>
				<property name="left" value="30%"/>
				<property name="top" value="30%"/>
				<property name="zIndex" value="1"/>
				<property name="focusIndex" value="1"/>
			</media>
			<media id="mPlayer1_hit" src="media/player1_hit.png">
				<property name="height" value="50%"/>
				<property name="width" value="35%"/>
				<property name="left" value="30%"/>
				<property name="top" value="30%"/>
				<property name="zIndex" value="1"/>
				<property name="explicitDur" value="0.5s"/>
			</media>
			<!--**************************************************************
		    Player 1 Scene: Links
		    **************************************************************-->
			<port id="entry_player1" component="mBackground_player1"/>
			<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="mBackground_player1"/>
				<bind role="start" component="mPlayer1"/>
			</link>
			<link xconnector="conn#onSelectionORonKeySelectionStopStartSet">
				<bind role="onSelection" component="mPlayer1"/>
				<bind role="onKeySelection" component="mPlayer1">
					<bindParam name="key" value="RED"/>
				</bind>
				<bind role="set" component="globalVarPlayer1" interface="parent.player_1_hit">
					<bindParam name="varSet" value="true"/>
				</bind>
				<bind role="stop" component="mPlayer1"/>
				<bind role="start" component="mPlayer1_hit"/>
			</link>
			<link xconnector="conn#onEndStart">
				<bind role="onEnd" component="mPlayer1_hit"/>
				<bind role="start" component="mPlayer1"/>
			</link>
		</context>
		<!--**************************************************************
		    Player2 Context
		    **************************************************************-->
		<context id="player2_game">
			<!--**************************************************************
		    Global: Medias
		    **************************************************************-->
			<media id="globalVarPlayer2" type="application/x-ginga-settings">
				<property name="parent.player_2_hit" value="false"/>
			</media>
			<!--**************************************************************
		    Player 2 Scene: Medias
		    **************************************************************-->
			<media id="mBackground_player2" src="media/background_player2.jpg">
				<property name="height" value="100%"/>
				<property name="width" value="100%"/>
				<property name="left" value="0%"/>
				<property name="top" value="0%"/>
				<property name="zIndex" value="0"/>
			</media>
			<media id="mPlayer2" src="media/player2_ready.png">
				<property name="height" value="50%"/>
				<property name="width" value="35%"/>
				<property name="left" value="30%"/>
				<property name="top" value="30%"/>
				<property name="zIndex" value="1"/>
				<property name="focusIndex" value="2"/>
			</media>
			<media id="mPlayer2_hit" src="media/player2_hit.png">
				<property name="height" value="50%"/>
				<property name="width" value="35%"/>
				<property name="left" value="30%"/>
				<property name="top" value="30%"/>
				<property name="zIndex" value="1"/>
				<property name="explicitDur" value="0.5s"/>
			</media>
			<!--**************************************************************
		    Player 1 Scene: Links
		    **************************************************************-->
			<port id="entry_player2" component="mBackground_player2"/>
			<link xconnector="conn#onBeginStart">
				<bind role="onBegin" component="mBackground_player2"/>
				<bind role="start" component="mPlayer2"/>
			</link>
			<link xconnector="conn#onSelectionORonKeySelectionStopStartSet">
				<bind role="onSelection" component="mPlayer2"/>
				<bind role="onKeySelection" component="mPlayer2">
					<bindParam name="key" value="YELLOW"/>
				</bind>
				<bind role="set" component="globalVarPlayer2" interface="parent.player_2_hit">
					<bindParam name="varSet" value="true"/>
				</bind>
				<bind role="stop" component="mPlayer2"/>
				<bind role="start" component="mPlayer2_hit"/>
			</link>
			<link xconnector="conn#onEndStart">
				<bind role="onEnd" component="mPlayer2_hit"/>
				<bind role="start" component="mPlayer2"/>
			</link>
		</context>
	</body>
</ncl>
