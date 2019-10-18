trigger OpportunityTrigger on Opportunity (before insert,before update) {
        OpportunityTriggerHandler.beforeInsertUpdate(trigger.new);
}