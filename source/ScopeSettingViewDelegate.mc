using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

class ScopeSettingViewDelegate extends WatchUi.BehaviorDelegate {

	function initialize() {
		BehaviorDelegate.initialize();
	}
	
	function onBack() {
		WatchUi.popView(WatchUi.SLIDE_DOWN);
		return true;
	}
	
	function onKey(keyEvent) {
        if(keyEvent.getKey() == 4){
        	WatchUi.popView(WatchUi.SLIDE_DOWN);
        }
        return true;
    }
}