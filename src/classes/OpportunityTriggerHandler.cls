public with sharing class OpportunityTriggerHandler {

    private OpportunityTriggerHelper helper = new OpportunityTriggerHelper();

    /**
     * Constructor
     */
    public OpportunityTriggerHandler() {
        
    }

    /**
     * Create Event
     */
    public void doCreateEvent(List<Opportunity> opportunities) {
        // Get Create Event
        List<Event> events = this.helper.getCreateEvent(opportunities, 'Create Opportunity');
        // Create
        insert events;
    }

    /**
     * Create Event
     */
    public void doCreateEvent(List<Opportunity> newOpportunities, Map<Id, Opportunity> opportunitiesOldMap) {
        // Get Target Opportunity
        List<Opportunity> opportunities = this.helper.getTargetOpportunities(newOpportunities, opportunitiesOldMap);
        // Get Create Event
        List<Event> events = this.helper.getCreateEvent(opportunities, 'Update Opportunity');
        // Create
        insert events;
    }

    /**
     * Create Account
     */
    public void doCreateAccount(List<Opportunity> newOpportunities, Map<Id, Opportunity> opportunitiesOldMap) {
        // Get Target Opportunity
        List<Opportunity> opportunities = this.helper.getTargetOpportunities(newOpportunities, opportunitiesOldMap);
        // Get Create Account
        List<Account> accounts = this.helper.getCreateAccount(opportunities);
        // Create
        insert accounts;
    }
}