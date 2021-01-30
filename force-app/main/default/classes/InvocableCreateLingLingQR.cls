public class InvocableCreateLingLingQR {
    public static Class_Session__c classSession = new Class_Session__c();
    @InvocableMethod
    public static void InvocableCreateLingLingQR(List<Class_Session__c> ClassSessionList) {
        classSession = ClassSessionList[0];
        System.debug('classSession Id: ' + classSession.Id);
        System.debug('classSession Name: ' + classSession.Name);
        ScheduledCreateLingLingQR createLingLingQR = new ScheduledCreateLingLingQR(classSession.Id);
        String year = String.valueOf(System.now().year());
        String month = String.valueOf(System.now().month());
        String day = String.valueOf(System.now().day());
        String hour = String.valueOf(System.now().hour());
        String min = String.valueOf(System.now().minute() + 3);
        String sec = String.valueOf(System.now().second());
        String sch = sec + ' ' + min + ' ' + hour + ' ' + day + ' ' + month + ' ' + '?' + ' ' + year;
        System.debug('sch: ' + sch);
        String name = 'Scheduled Create LingLing QR' + ' - ' + classSession.Name;
        String jobID = System.schedule(name, sch, createLingLingQR);
        System.debug('jobID: ' + jobID);
        CronTrigger ct = [SELECT TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobID];
        System.debug('ct: ' + ct);
    }
}
