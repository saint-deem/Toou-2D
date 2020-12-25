import QtQuick 6
import Toou2D 1.0

/*! TODO */
TObject {

    property bool lighter: false;

    property var otherData;

    property alias icon: micon;

    property alias label: mlabel;

    TGadgetIcon{ id:micon }

    TGadgetLabel{ id:mlabel }
}
