trigger AcknowledgeTrigger on Driver__c (after insert,after update) 
{
  AcknowledgeTrigger.updateAcknowledgeTrigger(Trigger.New);
}