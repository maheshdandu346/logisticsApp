  trigger Acknowledge on Product__c (after insert,after update) {
    Acknowledge.updateAcknowledge(Trigger.New);
}