trigger CriaturaTrigger on Criatura__c (after insert, after update) 
{
  system.debug('Funciona');
}