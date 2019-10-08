global class AccountProcessBatch implements Schedulable, Database.Batchable<sObject> 
{
    
    String query;
    public final String orderClosedStatus = System.Label.OrderClosed;
    global AccountProcessBatch() 
    {
        
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) 
    {
        
        //return Database.getQueryLocator([select Id, FirstOrderDate__c, (select Id, ebMobile__OrderDate__c from Orders where Status = :orderClosedStatus order by ebMobile__OrderDate__c asc limit 1) from Account where FirstOrderDate__c = null]);
        return Database.getQueryLocator([select Id, FirstOrderDate__c,
                (select Id, First_Order_Item_ConfirmedDate__c 
                from Orders 
                //where Status = :orderClosedStatus 
                order by First_Order_Item_ConfirmedDate__c asc limit 1
                ) 
            from Account 
            where IsExistingCustomer__c = false
            and  FirstOrderDate__c = null]);
    }

    global void execute(Database.BatchableContext BC, List<Account> accs)
    {
        ebMobile.TriggerContextHelper.isFired = false;
        for(Account a: accs)
        {
            if(a.Orders.size() == 1)
            {
                a.FirstOrderDate__c = Date.valueOf(a.Orders[0].First_Order_Item_ConfirmedDate__c);
            }
        }
        update accs;
    }

    global void finish(Database.BatchableContext BC)
    {
        
    }

    global void execute(SchedulableContext ctx)
    {
        AccountProcessBatch batch = new AccountProcessBatch();
        Database.executeBatch(batch, 1000);
    }
}