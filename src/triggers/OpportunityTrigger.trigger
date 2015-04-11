trigger OpportunityTrigger on Opportunity (before insert, after insert, after update) {

    OpportunityTriggerHandler handler = new OpportunityTriggerHandler();

    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            // Create Event
            handler.doCreateEvent(Trigger.new);
        } else if (Trigger.isUpdate) {
            // Create Event
            handler.doCreateEvent(Trigger.new, Trigger.oldMap);
            // Create Account
            handler.doCreateAccount(Trigger.new, Trigger.oldMap);
        }
    }
}