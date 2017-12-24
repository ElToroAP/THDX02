({
    navToRecord: function (component, event, helper) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": component.get("v.propertyId")
        });
        navEvt.fire();
    },
    editRecord: function (component, event, helper) {
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
            "recordId": component.get("v.propertyId")
        });
        editRecordEvent.fire();
    }
})
