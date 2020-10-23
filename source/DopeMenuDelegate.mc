using Toybox.WatchUi;
using Toybox.System;

class DopeMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
        if (item == :shoot) {
            //System.println("shoot");
            //set global setup flag
            Application.getApp().setProperty("setup", false);
            WatchUi.pushView(new Rez.Menus.RangeMenu(), new RangeMenuDelegate(), WatchUi.SLIDE_UP);
        } 
        else if (item == :setup) {
            //System.println("setup");
            //set global setup flag
            Application.getApp().setProperty("setup", true);
            WatchUi.pushView(new Rez.Menus.RangeMenu(), new RangeMenuDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :Exit) {
        	System.println("Exiting");
        	System.exit();
        }
    }
}