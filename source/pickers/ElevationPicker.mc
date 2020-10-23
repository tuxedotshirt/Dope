using Toybox.Application;
using Toybox.Graphics;
using Toybox.WatchUi;

class ElevationPicker extends WatchUi.Picker {
    const mCharacterSet = "0123456789.-<";
    hidden var mTitleText;
    hidden var mFactory;
	
    function initialize() {
        mFactory = new CharacterFactory(mCharacterSet, {:addOk=>true});
        mTitleText = "";
        buildTargetData();
        
        var string = Application.getApp().getProperty(Application.getApp().getProperty("elevation"));
        var defaults = null;
        var titleText = Rez.Strings.ElevationPickerTitle;

        if(string != null) {
            mTitleText = string;
            titleText = string;
            defaults = [mFactory.getIndex(string.substring(string.length()-1, string.length()))];
        }

        mTitle = new WatchUi.Text({:text=>titleText, :locX =>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_BOTTOM, :color=>Graphics.COLOR_WHITE});
		
        Picker.initialize({:title=>mTitle, :pattern=>[mFactory], :defaults=>defaults});
    }

	function buildTargetData(){
    	var elevation = Application.getApp().getProperty("range");
        Application.getApp().setProperty("elevation", elevation);
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
            mTitle.setText(WatchUi.loadResource(Rez.Strings.ElevationPickerTitle));
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

class ElevationPickerDelegate extends WatchUi.PickerDelegate {
    hidden var mPicker;

    function initialize(picker) {
        PickerDelegate.initialize();
        mPicker = picker;
    }

    function onCancel() {
        if(0 == mPicker.getTitleLength()) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
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
                Application.getApp().deleteProperty(Application.getApp().getProperty("elevation"));
            }
            else {
                Application.getApp().setProperty(Application.getApp().getProperty("elevation"), mPicker.getTitle());
            }
            var picker = new WindagePicker();
            WatchUi.pushView(picker, new WindagePickerDelegate(picker), WatchUi.SLIDE_IMMEDIATE);
        }
    }

}
