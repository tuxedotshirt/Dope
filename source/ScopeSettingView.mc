using Toybox.WatchUi;

class ScopeSettingView extends WatchUi.View {
	
	var elevationData;
	var windageData;
	
    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.ScopeSettingLayout(dc));
    }

    function onShow() {
    	buildTargetData();
    	var elevation = findDrawableById("ElevationString");//.setText(elevationData.toString());
    	var windage = findDrawableById("WindageString");//.setText(windageData.toString());
    	if (elevationData != null){
    		elevation.setText(elevationData);
    	}
    	else {
			elevation.setText("--.--");
		}
		if (windageData != null){    	
    		windage.setText(windageData);
    	}
    	else {
    		windage.setText("--.--");
    	}
    }

    //! Update the view
    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    function onHide() {
    }
    
    function buildTargetData(){
    	var range = Application.getApp().getProperty("range");
        var targetData = range;
        targetData += Application.getApp().getProperty("windEffect");
        targetData += Application.getApp().getProperty("windSpeed");
        Application.getApp().setProperty("targetData", targetData);
        //System.println(Application.getApp().getProperty("targetData"));
        loadElevation(range);
        loadWindage(targetData);
    }
	
	function loadElevation(range){
		//System.println("loadElevation: " + range);
		elevationData = Application.getApp().getProperty(range.toString());
	}
	
	function loadWindage(targetDataString){
		//System.println("loadWindage: " + targetDataString);
		//System.println("loadSetting param: " + targetDataString);
		//var elevationString = targetDataString;
		var windageString = "w" + targetDataString;
		//System.println(elevationString);
		//System.println(windageString);
		//elevationData = Application.getApp().getProperty(elevationString.toString());
		windageData = Application.getApp().getProperty(windageString.toString());
		//System.println(elevationString + " = " + elevationData);
		//System.println(windageString + " = " + windageData);
	}
}