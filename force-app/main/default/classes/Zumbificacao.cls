public class Zumbificacao {
 
    @InvocableMethod (label = 'Transforma Zumbi')
    public static void Zumbificar(List<id> ids)
    {
       List<Criatura__c> criaturaList = [SELECT id, bunker__r.name, bunker__c , (SELECT id FROM RecursosCriaturas__r) FROM Criatura__c WHERE id in :ids];
       List<RecursoCriatura__c> crDeleteList = new List<RecursoCriatura__c>();
       for(Criatura__c cr : criaturaList)
       {
           String tipoZumbi = '';
           integer rand = Math.mod(Integer.valueOf(math.random()*1000), 100);
           if( rand < 50 )
           {
               
            tipoZumbi = 'Lerdo' ;  
           }
            else if (rand < 80)
            {
                
                tipoZumbi = 'Rapido';
            }
            else 
            {
                tipoZumbi = 'Gordo';
            }
		 cr.tipoZumbi__c = tipoZumbi ;       
         crDeleteList.addAll(cr.RecursosCriaturas__r);
        }
        update criaturaList;
        delete crDeleteList;    
              
    }
}