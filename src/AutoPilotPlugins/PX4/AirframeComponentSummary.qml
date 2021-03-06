import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

import QGroundControl.FactSystem 1.0
import QGroundControl.FactControls 1.0
import QGroundControl.Controls 1.0
import QGroundControl.Controllers 1.0

Column {
    anchors.fill: parent
    anchors.margins: 8

    AirframeComponentController { id: controller }

    Row {
        width: parent.width

        QGCLabel { id: systemId; text: "System ID:" }
        FactLabel {
            horizontalAlignment: Text.AlignRight
            width: parent.width - systemId.contentWidth
            fact: Fact { name: "MAV_SYS_ID" }
        }
    }

    Row {
        width: parent.width

        QGCLabel { id: airframeType; text: "Airframe type:" }
        QGCLabel {
            property Fact fact: Fact { name: "SYS_AUTOSTART" }
            horizontalAlignment: Text.AlignRight
            width: parent.width - airframeType.contentWidth
            text: fact.value == 0 ? "Setup required" : controller.currentAirframeType
        }
    }

    Row {
        width: parent.width

        QGCLabel { id: vehicle; text: "Vehicle:" }
        QGCLabel {
            property Fact fact: Fact { name: "SYS_AUTOSTART" }
            horizontalAlignment: Text.AlignRight
            width: parent.width - vehicle.contentWidth
            text: fact.value == 0 ? "Setup required" : controller.currentVehicleName
        }
    }
}
