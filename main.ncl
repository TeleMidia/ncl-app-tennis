<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="ginga_tennis" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<transitionBase>
			<transition id="tBarwipe1s" type="barWipe" direction="forward" dur="1s"/>
			<transition id="tBarwipe_reverse1s" type="barWipe" direction="reverse" dur="1s"/>
			<transition id="tBarwipe0.5s" type="barWipe" direction="forward" dur="0.5s"/>
			<transition id="tBarwipe_reverse0.5s" type="barWipe" direction="reverse" dur="0.5s"/>
			<transition id="tFade" type="fade" dur="1s"/>
		</transitionBase>
		<!-- active device class region base -->
		<regionBase id="dev" device="systemScreen(2)">
			<region id="rDev" height="100%" width="100%" left="0" top="0" zIndex="0"/>
		</regionBase>
		<descriptorBase>
			<descriptor id="dTransionBarwipe1s" transIn="tBarwipe1s"/>
			<descriptor id="dTransionBarwipe_reverse1s" transIn="tBarwipe_reverse1s" transOut="tFade"/>
			<descriptor id="dTransionBarwipe0.5s" transIn="tBarwipe0.5s" transOut="tFade"/>
			<descriptor id="dTransionBarwipe_reverse0.5s" transIn="tBarwipe_reverse0.5s"/>
			<descriptor id="dDev" region="rDev"/>
			<descriptor id="dStart" transIn="tFade" focusBorderWidth="10"/>
			<descriptor id="dAbout" transIn="tFade" focusBorderWidth="10"/>
			<descriptor id="dBalloon" transIn="tFade" transOut="tFade"/>
			<descriptor id="dPlayerFocusBorder" focusBorderWidth="10"/>
		</descriptorBase>
		<connectorBase>
			<importBase documentURI="active/connBase.ncl" alias="conn"/>
		</connectorBase>
	</head>
	<body>
		<!-- -->
		<!--Global Medias-->
		<!-- -->
		<media id="settings" type="application/x-ginga-settings">
			<property name="player_1_hit_ball" value="false"/>
			<property name="player_2_hit_ball" value="false"/>
			<property name="parent.player_1_hit" value="null"/>
			<property name="parent.player_2_hit" value="null"/>
			<property name="service.currentFocus" value="1"/>
		</media>
		<media id="cheers" src="media/cheers.mp3"/>
		<media id="mPlayer1_hit_ball_sound" src="media/player1_hit_ball_sound.mp3"/>
		<media id="mPlayer2_hit_ball_sound" src="media/player2_hit_ball_sound.mp3"/>
		<media id="active_tennis" src="active/main.ncl" descriptor="dDev"/>
		<!-- -->
		<!--Entry point-->
		<!-- -->
		<media id="mBackground" src="media/background.jpg">
			<property name="height" value="100%"/>
			<property name="width" value="100%"/>
			<property name="left" value="0%"/>
			<property name="top" value="0%"/>
			<property name="zIndex" value="0"/>
		</media>
		<port id="p0" component="mBackground"/>
		<!-- -->
		<!--Menu-->
		<!-- -->
		<!-- Medias-->
		<media id="mLogo1" src="media/logo_part1.png" descriptor="dTransionBarwipe1s">
			<property name="height" value="25%"/>
			<property name="width" value="50%"/>
			<property name="left" value="25%"/>
			<property name="top" value="20%"/>
			<property name="zIndex" value="1"/>
		</media>
		<media id="mLogo2" src="media/logo_part2.png" descriptor="dTransionBarwipe_reverse1s">
			<property name="height" value="25%"/>
			<property name="width" value="50%"/>
			<property name="left" value="35%"/>
			<property name="top" value="40%"/>
			<property name="zIndex" value="1"/>
		</media>
		<media id="mStart" src="media/start.png" descriptor="dStart">
			<property name="height" value="10%"/>
			<property name="width" value="25%"/>
			<property name="left" value="35%"/>
			<property name="top" value="70%"/>
			<property name="zIndex" value="2"/>
			<property name="focusIndex" value="1"/>
		</media>
		<media id="mAbout" src="media/about.png" descriptor="dAbout">
			<property name="height" value="10%"/>
			<property name="width" value="25%"/>
			<property name="left" value="35%"/>
			<property name="top" value="80%"/>
			<property name="zIndex" value="2"/>
			<property name="focusIndex" value="2"/>
		</media>
		<!-- Links-->
		<link xconnector="conn#onBeginStart">
			<bind role="onBegin" component="mBackground"/>
			<bind role="start" component="mLogo1"/>
			<bind role="start" component="mLogo2"/>
			<bind role="start" component="mStart"/>
			<bind role="start" component="mAbout"/>
		</link>
		<link xconnector="conn#onSelectionStopStart">
			<bind role="onSelection" component="mStart"/>
			<bind role="stop" component="mLogo1"/>
			<bind role="stop" component="mLogo2"/>
			<bind role="stop" component="mStart"/>
			<bind role="stop" component="mAbout"/>
			<bind role="start" component="mPlayer1"/>
			<bind role="start" component="mPlayer2"/>
			<bind role="start" component="mBall_to_player2_serve"/>
			<bind role="start" component="active_tennis"/>
		</link>
		<!-- -->
		<!--Ball moviment from player2 to player1-->
		<!-- -->
		<!-- Medias-->
		<media id="mBall_to_player1_inside_player2_area" src="media/ball.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="80%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="3"/>
		</media>
		<media id="mBall_to_player1" src="media/ball.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="45%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="3"/>
		</media>
		<media id="mBall_to_player1_hit" src="media/ball_hit.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="25%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="3"/>
		</media>
		<media id="mBall_to_player1_fail_hit" src="media/ball.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="10%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="3"/>
		</media>
		<!-- Links-->
		<link xconnector="conn#onBeginSet">
			<bind role="onBegin" component="mBall_to_player1_inside_player2_area"/>
			<bind role="set" component="mBall_to_player1_inside_player2_area" interface="left">
				<bindParam name="varSet" value="45%"/>
				<bindParam name="duration" value="1.5s"/>
			</bind>
		</link>
		<link xconnector="conn#onEndAttributionStopStart">
			<bind role="onEndAttribution" component="mBall_to_player1_inside_player2_area" interface="left"/>
			<bind role="stop" component="mBall_to_player1_inside_player2_area"/>
			<bind role="start" component="mBall_to_player1"/>
		</link>
		<link xconnector="conn#onBeginSet">
			<bind role="onBegin" component="mBall_to_player1"/>
			<bind role="set" component="mBall_to_player1" interface="left">
				<bindParam name="varSet" value="25%"/>
				<bindParam name="duration" value="1.5s"/>
			</bind>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="1"/>
			</bind>
		</link>
		<link xconnector="conn#onEndAttributionStopStartSet">
			<bind role="onEndAttribution" component="mBall_to_player1" interface="left"/>
			<bind role="stop" component="mBall_to_player1"/>
			<bind role="start" component="mBall_to_player1_hit"/>
			<bind role="set" component="settings" interface="player_1_hit_ball">
				<bindParam name="varSet" value="false"/>
			</bind>
		</link>
		<link xconnector="conn#onBeginSet">
			<bind role="onBegin" component="mBall_to_player1_hit"/>
			<bind role="set" component="mBall_to_player1_hit" interface="left">
				<bindParam name="varSet" value="10%"/>
				<bindParam name="duration" value="1.5s"/>
			</bind>
		</link>
		<link xconnector="conn#onEndAttributionCmpVarStopStart">
			<bind role="onEndAttribution" component="mBall_to_player1_hit" interface="left"/>
			<bind role="cmpEq" component="settings" interface="player_1_hit_ball">
				<bindParam name="varCmp" value="false"/>
			</bind>
			<bind role="stop" component="mBall_to_player1_hit"/>
			<bind role="start" component="mBall_to_player1_fail_hit"/>
		</link>
		<link xconnector="conn#onBeginSet">
			<bind role="onBegin" component="mBall_to_player1_fail_hit"/>
			<bind role="set" component="mBall_to_player1_fail_hit" interface="left">
				<bindParam name="varSet" value="0%"/>
				<bindParam name="duration" value="0.5s"/>
			</bind>
		</link>
		<!-- -->
		<!--Ball moviment from player1 to player2-->
		<!-- -->
		<!-- Medias -->
		<media id="mBall_to_player2_inside_player1_area" src="media/ball.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="20%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="2"/>
		</media>
		<media id="mBall_to_player2" src="media/ball.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="55%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="2"/>
		</media>
		<media id="mBall_to_player2_hit" src="media/ball_hit.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="70%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="3"/>
		</media>
		<media id="mBall_to_player2_fail_hit" src="media/ball.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="85%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="3"/>
		</media>
		<!-- Links -->
		<link xconnector="conn#onBeginSet">
			<bind role="onBegin" component="mBall_to_player2_inside_player1_area"/>
			<bind role="set" component="mBall_to_player2_inside_player1_area" interface="left">
				<bindParam name="varSet" value="55%"/>
				<bindParam name="duration" value="1.5s"/>
			</bind>
		</link>
		<link xconnector="conn#onEndAttributionStopStart">
			<bind role="onEndAttribution" component="mBall_to_player2_inside_player1_area" interface="left"/>
			<bind role="stop" component="mBall_to_player2_inside_player1_area"/>
			<bind role="start" component="mBall_to_player2"/>
		</link>
		<link xconnector="conn#onBeginSet">
			<bind role="onBegin" component="mBall_to_player2"/>
			<bind role="set" component="mBall_to_player2" interface="left">
				<bindParam name="varSet" value="70%"/>
				<bindParam name="duration" value="1.5s"/>
			</bind>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="3"/>
			</bind>
		</link>
		<link xconnector="conn#onEndAttributionStopStartSet">
			<bind role="onEndAttribution" component="mBall_to_player2" interface="left"/>
			<bind role="stop" component="mBall_to_player2"/>
			<bind role="start" component="mBall_to_player2_hit"/>
			<bind role="set" component="settings" interface="player_2_hit_ball">
				<bindParam name="varSet" value="false"/>
			</bind>
		</link>
		<link xconnector="conn#onBeginSet">
			<bind role="onBegin" component="mBall_to_player2_hit"/>
			<bind role="set" component="mBall_to_player2_hit" interface="left">
				<bindParam name="varSet" value="82%"/>
				<bindParam name="duration" value="1.5s"/>
			</bind>
		</link>
		<link xconnector="conn#onEndAttributionCmpVarStopStart">
			<bind role="onEndAttribution" component="mBall_to_player2_hit" interface="left"/>
			<bind role="cmpEq" component="settings" interface="player_2_hit_ball">
				<bindParam name="varCmp" value="false"/>
			</bind>
			<bind role="stop" component="mBall_to_player2_hit"/>
			<bind role="start" component="mBall_to_player2_fail_hit"/>
		</link>
		<link xconnector="conn#onBeginSet">
			<bind role="onBegin" component="mBall_to_player2_fail_hit"/>
			<bind role="set" component="mBall_to_player2_fail_hit" interface="left">
				<bindParam name="varSet" value="97%"/>
				<bindParam name="duration" value="0.5s"/>
			</bind>
		</link>
		<!-- -->
		<!--Player1 actions-->
		<!-- -->
		<!-- Medias-->
		<media id="mPlayer1" src="media/player1_ready.png" descriptor="dPlayerFocusBorder">
			<property name="height" value="25%"/>
			<property name="width" value="15%"/>
			<property name="left" value="10%"/>
			<property name="top" value="50%"/>
			<property name="zIndex" value="1"/>
			<property name="focusIndex" value="1"/>
		</media>
		<media id="mBall_to_player1_serve" src="media/ball.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="80%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="3"/>
		</media>
		<media id="mPlayer1_hit" src="media/player1_hit.png" descriptor="dPlayerFocusBorder">
			<property name="height" value="25%"/>
			<property name="width" value="15%"/>
			<property name="left" value="10%"/>
			<property name="top" value="50%"/>
			<property name="zIndex" value="1"/>
			<property name="explicitDur" value="0.5s"/>
			<property name="focusIndex" value="2"/>
		</media>
		<!-- Links-->
		<!-- Set parent.player_1_hit by select RED or Player1 selection-->
		<!-- parent.player_1_hit is also seted by second device-->
		<link xconnector="conn#onSelectionORonKeySelectionSet">
			<bind role="onKeySelection" component="mPlayer1">
				<bindParam name="key" value="RED"/>
			</bind>
			<bind role="onSelection" component="mPlayer1"/>
			<bind role="set" component="settings" interface="parent.player_1_hit">
				<bindParam name="varSet" value="true"/>
			</bind>
		</link>
		<!-- Player1 hit with mBall_to_player2_serve occurring-->
		<link xconnector="conn#onEndAttributionOnStateStopStartSet">
			<bind role="onEndAttribution" component="settings" interface="parent.player_1_hit"/>
			<bind role="onState" component="mBall_to_player2_serve">
				<bindParam name="vState" value="occurring"/>
			</bind>
			<bind role="stop" component="mBall_to_player2_serve"/>
			<bind role="stop" component="mPlayer1"/>
			<bind role="start" component="mPlayer1_hit"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="2"/>
			</bind>
			<bind role="start" component="mPlayer1_hit_ball_sound"/>
			<bind role="start" component="mBall_to_player2_inside_player1_area"/>
		</link>
		<!-- Player1 hit with mBall_to_player1  occurring-->
		<link xconnector="conn#onEndAttributionOnStateStopStartSet">
			<bind role="onEndAttribution" component="settings" interface="parent.player_1_hit"/>
			<bind role="onState" component="mBall_to_player1">
				<bindParam name="vState" value="occurring"/>
			</bind>
			<bind role="stop" component="mPlayer1"/>
			<bind role="start" component="mPlayer1_hit"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="2"/>
			</bind>
		</link>
		<!-- Player1 hit with mBall_to_player1_hit-->
		<link xconnector="conn#onEndAttributionOnStateStopStartSet">
			<bind role="onEndAttribution" component="settings" interface="parent.player_1_hit"/>
			<bind role="onState" component="mBall_to_player1_hit">
				<bindParam name="vState" value="occurring"/>
			</bind>
			<bind role="set" component="settings" interface="player_1_hit_ball">
				<bindParam name="varSet" value="true"/>
			</bind>
			<bind role="stop" component="mPlayer1"/>
			<bind role="start" component="mPlayer1_hit"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="2"/>
			</bind>
			<bind role="stop" component="mBall_to_player1_hit"/>
			<bind role="start" component="mBall_to_player2_inside_player1_area"/>
			<bind role="start" component="mPlayer1_hit_ball_sound"/>
		</link>
		<!-- Player1 hit animation end-->
		<link xconnector="conn#onEndStartSet">
			<bind role="onEnd" component="mPlayer1_hit"/>
			<bind role="start" component="mPlayer1"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="1"/>
			</bind>
		</link>
		<!-- -->
		Player2 actions
		<!-- -->
		<!--Medias-->
		<media id="mPlayer2" src="media/player2_ready.png" descriptor="dPlayerFocusBorder">
			<property name="height" value="25%"/>
			<property name="width" value="15%"/>
			<property name="left" value="70%"/>
			<property name="top" value="50%"/>
			<property name="zIndex" value="1"/>
			<property name="focusIndex" value="3"/>
		</media>
		<media id="mPlayer2_hit" src="media/player2_hit.png" descriptor="dPlayerFocusBorder">
			<property name="height" value="25%"/>
			<property name="width" value="15%"/>
			<property name="left" value="70%"/>
			<property name="top" value="50%"/>
			<property name="zIndex" value="1"/>
			<property name="explicitDur" value="0.5s"/>
			<property name="focusIndex" value="4"/>
		</media>
		<media id="mBall_to_player2_serve" src="media/ball.png">
			<property name="height" value="3%"/>
			<property name="width" value="3%"/>
			<property name="left" value="20%"/>
			<property name="top" value="55%"/>
			<property name="zIndex" value="3"/>
		</media>
		<!-- Player2 hit-->
		<link xconnector="conn#onSelectionORonKeySelectionSet">
			<bind role="onKeySelection" component="mPlayer2">
				<bindParam name="key" value="YELLOW"/>
			</bind>
			<bind role="onSelection" component="mPlayer2"/>
			<bind role="set" component="settings" interface="parent.player_2_hit">
				<bindParam name="varSet" value="true"/>
			</bind>
		</link>
		<!-- Player2 hit with mBall_to_player1_serve  occurring-->
		<link xconnector="conn#onEndAttributionOnStateStopStartSet">
			<bind role="onEndAttribution" component="settings" interface="parent.player_2_hit"/>
			<bind role="onState" component="mBall_to_player1_serve">
				<bindParam name="vState" value="occurring"/>
			</bind>
			<bind role="stop" component="mBall_to_player1_serve"/>
			<bind role="stop" component="mPlayer2"/>
			<bind role="start" component="mPlayer2_hit"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="4"/>
			</bind>
			<bind role="start" component="mPlayer2_hit_ball_sound"/>
			<bind role="start" component="mBall_to_player1_inside_player2_area"/>
		</link>
		<!-- Player2 hit with mBall_to_player2  occurring-->
		<link xconnector="conn#onEndAttributionOnStateStopStartSet">
			<bind role="onEndAttribution" component="settings" interface="parent.player_2_hit"/>
			<bind role="onState" component="mBall_to_player2">
				<bindParam name="vState" value="occurring"/>
			</bind>
			<bind role="stop" component="mPlayer2"/>
			<bind role="start" component="mPlayer2_hit"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="4"/>
			</bind>
		</link>
		<!-- Player2 hit with mBall_to_player2_hit  occurring-->
		<link xconnector="conn#onEndAttributionOnStateStopStartSet">
			<bind role="onEndAttribution" component="settings" interface="parent.player_2_hit"/>
			<bind role="onState" component="mBall_to_player2_hit">
				<bindParam name="vState" value="occurring"/>
			</bind>
			<bind role="set" component="settings" interface="player_2_hit_ball">
				<bindParam name="varSet" value="true"/>
			</bind>
			<bind role="stop" component="mPlayer2"/>
			<bind role="start" component="mPlayer2_hit"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="4"/>
			</bind>
			<bind role="stop" component="mBall_to_player2_hit"/>
			<bind role="start" component="mBall_to_player1_inside_player2_area"/>
			<bind role="start" component="mPlayer2_hit_ball_sound"/>
		</link>
		<!-- Player2 hit animation end-->
		<link xconnector="conn#onEndStartSet">
			<bind role="onEnd" component="mPlayer2_hit"/>
			<bind role="start" component="mPlayer2"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="3"/>
			</bind>
		</link>
		<!-- -->
		<!--Player 1 fail hit and show point for player2-->
		<!-- -->
		<!-- Medias -->
		<media id="mPlayer2_point" src="media/bar_win_player2.png" descriptor="dTransionBarwipe_reverse0.5s">
			<property name="height" value="10%"/>
			<property name="width" value="70%"/>
			<property name="left" value="30%"/>
			<property name="top" value="20%"/>
			<property name="zIndex" value="5"/>
			<property name="explicitDur" value="2.5s"/>
		</media>
		<media id="mPlayer1_sad_balloon" src="media/sad_balloon.png" descriptor="dBalloon">
			<property name="height" value="10%"/>
			<property name="width" value="10%"/>
			<property name="left" value="15%"/>
			<property name="top" value="40%"/>
			<property name="explicitDur" value="2.5s"/>
			<property name="zIndex" value="1"/>
		</media>
		<media id="mPlayer2_happy_balloon" src="media/happy_balloon.png" descriptor="dBalloon">
			<property name="height" value="10%"/>
			<property name="width" value="10%"/>
			<property name="left" value="80%"/>
			<property name="top" value="40%"/>
			<property name="zIndex" value="1"/>
			<property name="explicitDur" value="2.5s"/>
		</media>
		<!-- Links -->
		<link xconnector="conn#onEndAttributionStopStartSet">
			<bind role="onEndAttribution" component="mBall_to_player1_fail_hit" interface="left"/>
			<bind role="start" component="mPlayer2_point"/>
			<bind role="start" component="cheers"/>
			<bind role="start" component="mPlayer1_sad_balloon"/>
			<bind role="start" component="mPlayer2_happy_balloon"/>
			<bind role="stop" component="mBall_to_player1_fail_hit"/>
			<bind role="start" component="mBall_to_player1_serve"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="3"/>
			</bind>
		</link>
		<!-- -->
		<!--Player 2 fail hit and show point for player1-->
		<!-- -->
		<!-- Medias -->
		<media id="mPlayer1_point" src="media/bar_win_player1.png" descriptor="dTransionBarwipe0.5s">
			<property name="height" value="10%"/>
			<property name="width" value="70%"/>
			<property name="left" value="0%"/>
			<property name="top" value="20%"/>
			<property name="zIndex" value="5"/>
			<property name="explicitDur" value="2.5s"/>
		</media>
		<media id="mPlayer1_happy_balloon" src="media/happy_balloon.png" descriptor="dBalloon">
			<property name="height" value="10%"/>
			<property name="width" value="10%"/>
			<property name="left" value="15%"/>
			<property name="top" value="40%"/>
			<property name="explicitDur" value="2.5s"/>
			<property name="zIndex" value="1"/>
		</media>
		<media id="mPlayer2_sad_balloon" src="media/sad_balloon.png" descriptor="dBalloon">
			<property name="height" value="10%"/>
			<property name="width" value="10%"/>
			<property name="left" value="80%"/>
			<property name="top" value="40%"/>
			<property name="zIndex" value="1"/>
			<property name="explicitDur" value="2.5s"/>
		</media>
		<!-- Links -->
		<link xconnector="conn#onEndAttributionStopStartSet">
			<bind role="onEndAttribution" component="mBall_to_player2_fail_hit" interface="left"/>
			<bind role="start" component="mPlayer1_point"/>
			<bind role="start" component="cheers"/>
			<bind role="stop" component="mBall_to_player2_fail_hit"/>
			<bind role="start" component="mBall_to_player2_serve"/>
			<bind role="start" component="mPlayer1_happy_balloon"/>
			<bind role="start" component="mPlayer2_sad_balloon"/>
			<bind role="set" component="settings" interface="service.currentFocus">
				<bindParam name="varSet" value="1"/>
			</bind>
		</link>
	</body>
</ncl>
