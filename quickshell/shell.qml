import Quickshell // for PanelWindow
import Quickshell.Io // for Process
import QtQuick // for Text



	PanelWindow {
		anchors {
			top: true
			left: true
			right: true


		}
		margins {
			top: 10
			left: 10
			right: 10
		
		}

		implicitHeight: 30

		Text {
			// center the bar in its parent component (the window)
			anchors.centerIn: parent
			font.family: "Caskaydia Mono Nerd Font"
			font.pointSize: 15

			text: "hello world"

			Process {
				running: true
				command: [ "date", "+'%R, %d/%m'" ]
				stdout: StdioCollector {
					onStreamFinished: clock.text = text
				}
			}
			Timer {
				interval: 1000
				running: true
				repeat: true
				onTriggered: dateProc.running = true
			}
		
		}
}

