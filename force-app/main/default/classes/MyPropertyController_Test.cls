@isTest
public with sharing class MyPropertyController_Test {
    @testSetup
    public static void createData() {
        List<Property__c> props = new List<Property__c>();
        props.add(new Property__c(Name='P01_Base',       Beds__c=2, Baths__c=2, Price__c=100000));
        props.add(new Property__c(Name='P02_ByBedrooms', Beds__c=2, Baths__c=2, Price__c=900000));
        props.add(new Property__c(Name='P03_ByPrice',    Beds__c=5, Baths__c=2, Price__c=105000));
        insert props;
    }

    @isTest
    public static void test01() {
        Property__c p = [SELECT ID, Beds__c, Price__c FROM Property__c WHERE Name = 'P01_Base'];
        List<Property__c> ps;
        
        ps = MyPropertyController.getSimilarProperties (p.Id, 'Bedrooms', p.Beds__c, p.Price__c, 10000);
        System.assertEquals(1, ps.size());
        System.assertEquals('P02_ByBedrooms', ps[0].Name);

        ps = MyPropertyController.getSimilarProperties (p.Id, 'Price', p.Beds__c, p.Price__c, 10000);
        System.assertEquals(1, ps.size());
        System.assertEquals('P03_ByPrice', ps[0].Name);
    }
}