using Toybox.WatchUi;
using Toybox.System;
using Toybox.Graphics;
using Toybox.Application;

class WindSpeedMenuDelegate extends WatchUi.MenuInputDelegate {

	function initialize() {
        MenuInputDelegate.initialize();
    }
    
    function buildTargetData(){
    	var targetData = Application.getApp().getProperty("range");
        targetData += Application.getApp().getProperty("windEffect");
        targetData += Application.getApp().getProperty("windSpeed");
        Application.getApp().setProperty("targetData", targetData);
        //System.println(Application.getApp().getProperty("targetData"));
        loadSetting(targetData);
        if (Application.getApp().getProperty("setup") != true){
        	WatchUi.pushView(new ScopeSettingView(), new ScopeSettingViewDelegate(), WatchUi.SLIDE_UP);
        }
    }
	
	function loadSetting(targetDataString){
		//System.println("loadSetting: " + targetDataString);
		var elevationString = targetDataString;
		var windageString = "w" + elevationString;
		//System.println(elevationString);
		//System.println(windageString);
		var elevationData = Application.getApp().getProperty(elevationString.toString());
		var windageData = Application.getApp().getProperty(windageString.toString());
		//System.println(elevationString + " = " + elevationData);
		//System.println(windageString + " = " + windageData);
	}
	
	//targetData format: r100e0s1
    function onMenuItem(item) { 
    	Application.getApp().setProperty("windSpeed", "");
    	if (Application.getApp().getProperty("setup") == true){
    		//System.println("Setup == true");
    		if (item == :Speed1) {
	        	var targetDataString = Application.getApp().getProperty("windSpeed");
	        	targetDataString += "s1";
	        	Application.getApp().setProperty("windSpeed", targetDataString);
	        	//System.println(Application.getApp().getProperty("windSpeed"));
	        	buildTargetData();
	    	}
	    	else if (item == :Speed2) {
	    		var targetDataString = Application.getApp().getProperty("windSpeed");
	    		targetDataString += "s2";
	        	Application.getApp().setProperty("windSpeed", targetDataString);
	        	//System.println(Application.getApp().getProperty("windSpeed"));
	    		buildTargetData();
	    	}
	    	else if (item == :Speed3) {
	    		var targetDataString = Application.getApp().getProperty("windSpeed");
	    		targetDataString += "s3";
	        	Application.getApp().setProperty("windSpeed", targetDataString);
	        	//System.println(Application.getApp().getProperty("windSpeed"));
	    		buildTargetData();
	    	}
	    	else if (item == :Speed4) {
	    		var targetDataString = Application.getApp().getProperty("windSpeed");
	    		targetDataString += "s4";
	        	Application.getApp().setProperty("windSpeed", targetDataString);
	        	//System.println(Application.getApp().getProperty("windSpeed"));
	    		buildTargetData();
	    	}
	    	else if (item == :Back) {
	    		//System.println("Pop wind speed menu");
	        }
    		var picker = new ElevationPicker();
            WatchUi.pushView(picker, new ElevationPickerDelegate(picker), WatchUi.SLIDE_IMMEDIATE);
    	}
    	else if (Application.getApp().getProperty("setup") == false){
	    	if (item == :Speed1) {
	        	var targetDataString = Application.getApp().getProperty("windSpeed");
	        	targetDataString += "s1";
	        	Application.getApp().setProperty("windSpeed", targetDataString);
	        	//System.println(Application.getApp().getProperty("windSpeed"));
	        	buildTargetData();
	    	}
	    	else if (item == :Speed2) {
	    		var targetDataString = Application.getApp().getProperty("windSpeed");
	    		targetDataString += "s2";
	        	Application.getApp().setProperty("windSpeed", targetDataString);
	        	//System.println(Application.getApp().getProperty("windSpeed"));
	    		buildTargetData();
	    	}
	    	else if (item == :Speed3) {
	    		var targetDataString = Application.getApp().getProperty("windSpeed");
	    		targetDataString += "s3";
	        	Application.getApp().setProperty("windSpeed", targetDataString);
	        	//System.println(Application.getApp().getProperty("windSpeed"));
	    		buildTargetData();
	    	}
	    	else if (item == :Speed4) {
	    		var targetDataString = Application.getApp().getProperty("windSpeed");
	    		targetDataString += "s4";
	        	Application.getApp().setProperty("windSpeed", targetDataString);
	        	//System.println(Application.getApp().getProperty("windSpeed"));
	    		buildTargetData();
	    	}
	    	else if (item == :Back) {
	    		//System.println("Pop wind speed menu");
	        }
        }
    }
    
    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}