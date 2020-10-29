public with sharing class Acknowledge {
    public static void updateAcknowledge(List<Product__c> qqq ) {
        Map<ID, Customer__c> parentobj = new Map<ID, Customer__c>(); 
  List<Id> listIds = new List<Id>();

  for (Product__c childprod : qqq)
  {
    listIds.add(childprod.Customer__c);
  }

  parentobj = new Map<Id, Customer__c>([SELECT id,Product_Name__c FROM Customer__c WHERE ID IN :listIds]);

  for (Product__c cl : qqq)
  {
    Customer__c myParentobj = parentobj.get(cl.Customer__c);
     myParentobj.Product_Name__c = cl.Name;
     myParentobj.Product_Cost__c = cl.Cost__c;
     myParentobj.Product_brand__c = cl.brand__c;

  }
  update parentobj.values();
    }
}