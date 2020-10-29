public with sharing class AcknowledgeTrigger {
    public static void updateAcknowledgeTrigger(List<Driver__c> ppp)
    {
    Map<ID, Customer__c> parentobj = new Map<ID, Customer__c>(); 
  List<Id> listIds = new List<Id>();

  for (Driver__c childdri : ppp)
  {
    listIds.add(childdri.Customer__c);
  }

  parentobj = new Map<Id, Customer__c>([SELECT id, Total_Cost__c,Delivery_Charge__c,Driver_Name__c FROM Customer__c WHERE ID IN :listIds]);

  for (Driver__c cl : ppp)
  {
    Customer__c myParentobj = parentobj.get(cl.Customer__c);
     myParentobj.Total_Cost__c = cl.Total_Cost__c;
     myParentobj.Delivery_Charge__c = cl.Delivery_Charge__c;
     myParentobj.Driver_Name__c = cl.Name;
  }
  update parentobj.values();   
    }
}