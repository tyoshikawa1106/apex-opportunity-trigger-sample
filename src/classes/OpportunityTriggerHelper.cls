public with sharing class OpportunityTriggerHelper {

	public OpportunityTriggerHelper() {
		
	}

	/**
	 * Get Target Opportunities
	 */
	public List<Opportunity> getTargetOpportunities(List<Opportunity> newOpportunities, Map<Id, Opportunity> opportunitiesOldMap) {
		List<Opportunity> opportunities = new List<Opportunity>();
		for (Opportunity o : newOpportunities) {
			if (o.CloseDate != opportunitiesOldMap.get(o.Id).CloseDate) {
				opportunities.add(o);
			}
		}

		return opportunities;
	}

	/**
	 * Get Create Event
	 */
 	public List<Event> getCreateEvent(List<Opportunity> opportunities, String subject) {
		List<Event> events = new List<Event>();
		for (Opportunity o : opportunities) {
			Event event = new Event(
	             OwnerId = UserInfo.getUserId()
	            ,Subject = subject
	            ,WhatId = o.Id
	            ,DurationInMinutes = 0
	            ,ActivityDateTime = datetime.now()
	        );
			// Add List
			events.add(event);
		}
		return events;
	}

	/**
	 * Get Target Opportunities ByCreateAccount
	 */
	public List<Opportunity> getTargetOpportunitiesByCreateAccount(List<Opportunity> newOpportunities, Map<Id, Opportunity> opportunitiesOldMap) {
		List<Opportunity> opportunities = new List<Opportunity>();
		for (Opportunity o : newOpportunities) {
			if (o.Description != opportunitiesOldMap.get(o.Id).Description) {
				opportunities.add(o);
			}
		}

		return opportunities;
	}

	/**
	 * Get Create Account
	 */
 	public List<Account> getCreateAccount(List<Opportunity> opportunities) {
		List<Account> accounts = new List<Account>();
        for (Opportunity o : opportunities) {
            accounts.add(new Account(Name = 'New Account'));
        }
		return accounts;
	}
}