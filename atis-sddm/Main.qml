// A Temple in Skyrim, (sorry not sure which one) all artwork and video are copyright Bethesda Software company.

import QtMultimedia 5.5
import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    id: container
    width: 1600
    height: 900

    LayoutMirroring.enabled: Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit: true

    property int sessionIndex: session.index

    TextConstants { id: textConstants }

    Connections {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "steelblue"
            errorMessage.text = textConstants.loginSucceeded
        }

        onLoginFailed: {
            password.text = "Password incorrect, please try again."
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
        }
    }

// static background image
    Background {
        anchors.fill: parent
        source: config.background
        fillMode: Image.PreserveAspectCrop
        onStatusChanged: {
            if (status == Image.Error && source != config.defaultBackground) {
                source = "images/background.png" // this image is also defined in theme.conf and is the first frame of the video. Without it the video loop will have a noticalbe pause in playback.
            }
        }
    }

//		Animated background video
MediaPlayer {
	id: videoPlayer
	source: "video/temple.mp4"
	autoPlay: true
	playbackRate: 1.0
	loops: -1	// -1 infinite, 1 or more repeats that many times.
}

//		Without this block, video will not render.
VideoOutput {
	source: videoPlayer
	anchors.fill: parent
}

    Rectangle {
        anchors.fill: parent
        color: "transparent"
		visible: primaryScreen // show on default monitor

// background audio clip
	Audio {
		autoPlay: true
		id: bgMusic
//		loops: Audio.Once
		loops: Audio.Infinite
//		loop or play once, choose only one.
//		Eventually the sound clip fades out then loops.
//		https://pixabay.com/sound-effects/shadow-king-temple-22641/
		source: "audio/shadow-king-temple-22641.mp3"
	}

// login controls box
	Image {
		id: rectangle
		anchors.centerIn: parent
		anchors.horizontalCenterOffset: width / -0.75 // left of center
		width: Math.max(450, mainColumn.implicitWidth)
		height: Math.max(450, mainColumn.implicitHeight+ 50)
		source: "images/login-box-450x450.png"

	Column {
		id: mainColumn
			anchors.centerIn: parent
			spacing: 12

// welcome message
	Text {
		anchors.horizontalCenter: parent.horizontalCenter
		color: "#ccc"
		font.pixelSize: 18
		elide: Text.ElideRight
		height: text.implicitHeight
		horizontalAlignment: Text.AlignHCenter
		width: parent.width
		wrapMode: Text.WordWrap
		text: textConstants.welcomeText.arg(sddm.hostName)
		verticalAlignment: Text.AlignVCenter
		}

// date & time
	Text {
		anchors.horizontalCenter: parent.horizontalCenter
		color: "#aaa"
		elide: Text.ElideRight
		font.pixelSize: 18
		height: text.implicitHeight
		horizontalAlignment: Text.AlignHCenter
		text: Qt.formatDateTime(new Date(), "h:mm ap dddd, dd MMMM yyyy") // see man date for other optionos
		width: parent.width
		wrapMode: Text.WordWrap
		verticalAlignment: Text.AlignVCenter
		}

// labels and buttons
	Column {
		width: parent.width
		spacing: 4

	Text {
		id: lblName
		width: parent.width
		text: textConstants.userName
		font.bold: false
		font.pixelSize: 14
		color: "#aaa"
		}

	TextBox {
		color: "#aaa"
		focusColor: "#eee"
		focus: true
		hoverColor: "#fff"
		id: name
		font.bold: false
		font.pixelSize: 16
		radius: 2 // rounded corners
		text: userModel.lastUser
		width: parent.width; height: 30

		KeyNavigation.backtab: layoutBox; KeyNavigation.tab: password

	Keys.onPressed: {
		if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
			sddm.login(name.text, password.text, session.index)
			event.accepted = true
			}
		}
	}
}

	Column {
		width: parent.width
		spacing : 4
			Text {
				id: lblPassword
				width: parent.width
				text: textConstants.password
				font.bold: false
				font.pixelSize: 14
				color: "#aaa"
				}

		PasswordBox {
			color: "#aaa"
			focusColor: "#eee"
			hoverColor: "#fff"
			id: password
			image: "images/caps-lock.png"
			font.bold: false
			font.pixelSize: 16
			radius: 2
			tooltipBG: "#555"
			tooltipFG: "#aaa"
			width: parent.width; height: 30

			KeyNavigation.backtab: name; KeyNavigation.tab: loginButton

			Keys.onPressed: {
			if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
			sddm.login(name.text, password.text, session.index)
			event.accepted = true
			}
		}
	}
}

// spacer image
	Image {
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenterOffset: 160 - parent.height /1.0
		fillMode: Image.PreserveAspectFit
		transformOrigin: Item.Center
		source: "images/line.png"
		}

// login restart shutdown buttons
	Row {
		spacing: 4
		anchors.horizontalCenter: parent.horizontalCenter
		property int btnWidth: Math.max(loginButton.implicitWidth,
		shutdownButton.implicitWidth,
		rebootButton.implicitWidth, 100)

	Button {
		activeColor: "#eee"
		color: "#aaa"
		id: loginButton
		font.bold: false
		font.pixelSize: 16
		pressedColor: "#fff"
		radius: 2
		text: textConstants.login
		textColor: "#000"
		width: parent.btnWidth

		onClicked: sddm.login(name.text, password.text, session.index)

		KeyNavigation.backtab: password; KeyNavigation.tab: rebootButton
		}

	Button {
		activeColor: "#eee"
		color: "#aaa"
		font.bold: false
		font.pixelSize: 16
		id: rebootButton
		pressedColor: "#fff"
		radius: 2
		text: textConstants.reboot
		textColor: "#000"
		width: parent.btnWidth

		onClicked: sddm.reboot()

		KeyNavigation.backtab: loginButton; KeyNavigation.tab: shutdownButton
		}

	Button {
		activeColor: "#eee"
		color: "#aaa"
		font.bold: false
		font.pixelSize: 16
		id: shutdownButton
		pressedColor: "#fff"
		radius: 2
		text: textConstants.shutdown
		textColor: "#000"
		width: parent.btnWidth

	onClicked: sddm.powerOff()

	KeyNavigation.backtab: rebootButton; KeyNavigation.tab: session
	}
}

				Row {
					spacing: 4
					width: parent.width / 1.52
					z: 100

				Column {
					z: 100
					width: parent.width
					spacing : 4
					anchors.bottom: parent.bottom

// window manager selector
				Text {
					color: "#aaa"
					font.pixelSize: 16
					font.bold: false
					id: lblSession
					text: textConstants.session
					width: parent.width
					wrapMode: TextEdit.WordWrap
					}

				ComboBox {
					arrowIcon: "images/angle-down.png"
					color: "#aaa"
					focusColor: "#fff"
					font.pixelSize: 16
					font.bold: false
					hoverColor: "#eee"
					id: session
					menuColor : "#999"
					width: parent.width; height: 30

					model: sessionModel
					index: sessionModel.lastIndex

					KeyNavigation.backtab: shutdownButton; KeyNavigation.tab: layoutBox
					}
				}

				Column {
					z: 100
					width: parent.width * 0.5
					spacing : 4
					anchors.bottom: parent.bottom

// 			keyboard layout selector
				Text {
					id: lblLayout
					width: parent.width
					text: textConstants.layout
					wrapMode: TextEdit.WordWrap
					font.bold: false
					font.pixelSize: 16
					color: "#aaa"
					}

				LayoutBox {
					arrowIcon: "images/angle-down.png"
					color: "#aaa"
					focusColor: "#fff"
					font.pixelSize: 16
					font.bold: false
					hoverColor: "#eee"
					id: layoutBox
					menuColor : "#999"
					width: parent.width; height: 30

					KeyNavigation.backtab: session; KeyNavigation.tab: name
					}
				}
			}
		}
	}
}

Component.onCompleted: {
	if (name.text == "")
	name.focus = true
	else
	password.focus = true
	}
}
