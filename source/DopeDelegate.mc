using Toybox.WatchUi;

class DopeDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
        
        Application.getApp().setProperty("setup", false);
        Application.getApp().setProperty("targetData", "");
        Application.getApp().setProperty("elevation", "");
        Application.getApp().setProperty("windage", "");
        Application.getApp().setProperty("range", "");
        Application.getApp().setProperty("windEffect", "");
        Application.getApp().setProperty("windSpeed", "");
    }

    function onMenu() {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new DopeMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
}