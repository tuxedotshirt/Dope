using Toybox.WatchUi;
using Toybox.System;

class WindEffectMenuDelegate extends WatchUi.MenuInputDelegate {

	function initialize() {
        MenuInputDelegate.initialize();
    }
    
    function setWindEffectProperty(item){
		var itemId = item.toString();
		//System.println("effect = " + itemId);
            	Application.getApp().setProperty("effect", itemId);     
	}
	
	//targetData format: r100e0s1
    function onMenuItem(item) {
    	Application.getApp().setProperty("windEffect", "");
    	//setWindEffectProperty(item);
    	if (item == :Percent0) {
    		var targetDataString = Application.getApp().getProperty("windEffect");
        	targetDataString += "e0";
        	Application.getApp().setProperty("windEffect", targetDataString);
        	//System.println(Application.getApp().getProperty("windEffect"));
    		//System.println("0% Wind Effect");
    		WatchUi.pushView(new Rez.Menus.WindSpeedMenu(), new WindSpeedMenuDelegate(), WatchUi.SLIDE_UP);
    	}
    	else if (item == :Percent25) {
    		var targetDataString = Application.getApp().getProperty("windEffect");
        	targetDataString += "e25";
        	Application.getApp().setProperty("windEffect", targetDataString);
        	//System.println(Application.getApp().getProperty("windEffect"));
    		//System.println("25% Wind Effect");
    		WatchUi.pushView(new Rez.Menus.WindSpeedMenu(), new WindSpeedMenuDelegate(), WatchUi.SLIDE_UP);
    	}
    	else if (item == :Percent50) {
    		var targetDataString = Application.getApp().getProperty("windEffect");
        	targetDataString += "e50";
        	Application.getApp().setProperty("windEffect", targetDataString);
        	//System.println(Application.getApp().getProperty("windEffect"));
    		//System.println("50% Wind Effect");
    		WatchUi.pushView(new Rez.Menus.WindSpeedMenu(), new WindSpeedMenuDelegate(), WatchUi.SLIDE_UP);
    	}
    	else if (item == :Percent75) {
    	var targetDataString = Application.getApp().getProperty("windEffect");
        	targetDataString += "e75";
        	Application.getApp().setProperty("windEffect", targetDataString);
        	//System.println(Application.getApp().getProperty("windEffect"));
    		//System.println("75% Wind Effect");
    		WatchUi.pushView(new Rez.Menus.WindSpeedMenu(), new WindSpeedMenuDelegate(), WatchUi.SLIDE_UP);
    	}
    	else if (item == :Percent100) {
    		var targetDataString = Application.getApp().getProperty("windEffect");
        	targetDataString += "e100";
        	Application.getApp().setProperty("windEffect", targetDataString);
        	//System.println(Application.getApp().getProperty("windEffect"));
    		//System.println("100% Wind Effect");
    		WatchUi.pushView(new Rez.Menus.WindSpeedMenu(), new WindSpeedMenuDelegate(), WatchUi.SLIDE_UP);
    	}
    	else if (item == :Back) {
    		//System.println("Pop wind effect menu");
        }
    }
    
    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}