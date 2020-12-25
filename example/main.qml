import QtQuick 6
import QtQuick.Window 6
import Toou2D 1.0

Window {
    id:rootwindow
    visible: true
    width: 480
    height: 700

    /***
      * T2DWorld是T2D框架中最重要的配置
      ***/
    T2DWorld{
        mouseAreaCursorShape: Qt.PointingHandCursor
        appStartupTheme: "Dark"
        appThemePaths: [
            "qrc:/themes/"
        ]
    }

    TRectangle{
        width: parent.width;
        height: parent.height;
        color: "#FFF"
        x:menu.isopen ? 90 : 0;
        Topbar{
            id:topbar;
            width: parent.width;
            height: 45;
            onShowMenu: menu.open();
        }


        Loader{
            id:pageloader;

            anchors{
                left:  parent.left;
                right: parent.right;
                top:   topbar.bottom;
                bottom: footerbar.top;
            }
            source: "qrc:/Home.qml"


            function begin(){
                menu.open();
            }

            function toPage(uri,title){
                source = uri;
                topbar.title = title;
            }

        }

        Menubar{
            id:menu
            width: 160;
            height: rootwindow.height;
            onTopage: {
                if(title === "Github" || title === "Api docs"){
                    openurl_dialog.url = uri;
                    openurl_dialog.open();
                }else{
                    pageloader.toPage(uri,title);
                }
            }
        }

        Footerbar{
            id:footerbar
            width: parent.width;
            height: 45;
            anchors.bottom: parent.bottom;
        }

        Behavior on x {
            NumberAnimation {
                duration: 100
            }
        }

    }

    Component.onCompleted: {
        TToast.layoutY = 20;
    }

    TDialog{
        id:openurl_dialog
        titleText: "是否打开Url连接";
        contentText: "前往查看更多详细的内容";
        property string url;
        onTriggered: {
            Qt.openUrlExternally(url);
        }
    }

}
