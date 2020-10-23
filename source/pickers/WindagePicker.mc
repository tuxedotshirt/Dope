using Toybox.Application;
using Toybox.Graphics;
using Toybox.WatchUi;

class WindagePicker extends WatchUi.Picker {
    const mCharacterSet = "0123456789.-<";
    hidden var mTitleText;
    hidden var mFactory;
	
    function initialize() {
        mFactory = new CharacterFactory(mCharacterSet, {:addOk=>true});
        mTitleText = "";
        buildTargetData();

        var string = Application.getApp().getProperty(Application.getApp().getProperty("windage"));
        var defaults = null;
        var titleText = Rez.Strings.WindagePickerTitle;

        if(string != null) {
            mTitleText = string;
            titleText = string;
            defaults = [mFactory.getIndex(string.substring(string.length()-1, string.length()))];
        }

        mTitle = new WatchUi.Text({:text=>titleText, :locX =>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_BOTTOM, :color=>Graphics.COLOR_WHITE});

        Picker.initialize({:title=>mTitle, :pattern=>[mFactory], :defaults=>defaults});
    }

	function buildTargetData(){
    	var windage = "w";
    	windage += Application.getApp().getProperty("range");
        windage += Application.getApp().getProperty("windEffect");
        windage += Application.getApp().getProperty("windSpeed");  
        Application.getApp().setProperty("windage", windage);

    }
    
    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }

    function addCharacter(character) {
    	if(character.equals("<")){
    		removeCharacter();
    	}
    	else {
        	mTitleText += character;
        	mTitle.setText(mTitleText);
        }
    }

    function removeCharacter() {
        mTitleText = mTitleText.substring(0, mTitleText.length() - 1);

        if(0 == mTitleText.length()) {
            mTitle.setText(WatchUi.loadResource(Rez.Strings.WindagePickerTitle));
        }
        else {
            mTitle.setText(mTitleText);
        }
    }

    function getTitle() {
        return mTitleText.toString();
    }

    function getTitleLength() {
        return mTitleText.length();
    }

    function isDone(value) {
        return mFactory.isDone(value);
    }
}

class WindagePickerDelegate extends WatchUi.PickerDelegate {
    hidden var mPicker;

    function initialize(picker) {
        PickerDelegate.initialize();
        mPicker = picker;
    }

    function onCancel() {
        if(0 == mPicker.getTitleLength()) {
            //WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        }
        else {
            mPicker.removeCharacter();
        }
    }

    function onAccept(values) {
        if(!mPicker.isDone(values[0])) {
            mPicker.addCharacter(values[0]);
        }
        else {
            if(mPicker.getTitle().length() == 0) {
                Application.getApp().deleteProperty(Application.getApp().getProperty("windage")); //string
            }
            else {
                Application.getApp().setProperty(Application.getApp().getProperty("windage"), mPicker.getTitle());
            	
            }
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        	WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        	WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        	WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        }
        
    }

}
