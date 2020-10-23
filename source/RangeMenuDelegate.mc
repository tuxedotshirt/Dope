using Toybox.WatchUi;
using Toybox.System;

class RangeMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

	//targetData format: r100e0s1
    function onMenuItem(item) {
    	Application.getApp().setProperty("range", "");
    	
        if (item == :Range100) {
        	var targetDataString = Application.getApp().getProperty("range");
        	targetDataString += "r100";
        	Application.getApp().setProperty("range", targetDataString);
        	//System.println(Application.getApp().getProperty("range"));
            //System.println("Range 100");    
            WatchUi.pushView(new Rez.Menus.WindEffectMenu(), new WindEffectMenuDelegate(), WatchUi.SLIDE_UP);
        } 
        else if (item == :Range200) {
        var targetDataString = Application.getApp().getProperty("range");
        	targetDataString += "r200";
        	Application.getApp().setProperty("range", targetDataString);
        	//System.println(Application.getApp().getProperty("range"));
            //System.println("Range 200");
            WatchUi.pushView(new Rez.Menus.WindEffectMenu(), new WindEffectMenuDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :Range300) {
        	var targetDataString = Application.getApp().getProperty("range");
        	targetDataString += "r300";
        	Application.getApp().setProperty("range", targetDataString);
        	//System.println(Application.getApp().getProperty("range"));
            //System.println("Range 300");
            WatchUi.pushView(new Rez.Menus.WindEffectMenu(), new WindEffectMenuDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :Range400) {
        	var targetDataString = Application.getApp().getProperty("range");
        	targetDataString += "r400";
        	Application.getApp().setProperty("range", targetDataString);
        	//System.println(Application.getApp().getProperty("range"));
            //System.println("Range 400");
            WatchUi.pushView(new Rez.Menus.WindEffectMenu(), new WindEffectMenuDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :Range500) {
        	var targetDataString = Application.getApp().getProperty("range");
        	targetDataString += "r500";
        	Application.getApp().setProperty("range", targetDataString);
        	//System.println(Application.getApp().getProperty("range"));
            //System.println("Range 500");
            WatchUi.pushView(new Rez.Menus.WindEffectMenu(), new WindEffectMenuDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :Back) {
        	//System.println("Pop range menu");
        }
    }


	function onKey( keyEvent ){
		//System.println(keyEvent.getKey());
		//WatchUi.popView(WatchUi.SLIDE_DOWN);
	}
	
    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}
