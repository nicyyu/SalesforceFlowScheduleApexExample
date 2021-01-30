global class ScheduledCreateLingLingQR implements Schedulable {
    public static String sessionIdReceived = '';
    //execute
    global void execute(SchedulableContext SC) {
        System.debug('sessionIdReceived: ' + sessionIdReceived);
        ScheduledCreateLingLingQR(sessionIdReceived);
    }
    //
    public void ScheduledCreateLingLingQR(String sessionId) {
        System.debug('ScheduledCreateLingLingQR method started. ' + 'id: ' + sessionId);
    }
    //getting class session id as input
    public ScheduledCreateLingLingQR(String sessionIdInput){
        if ( sessionIdInput == null ) {
            sessionIdReceived = '';
        }
        if ( sessionIdInput != null ){
            sessionIdReceived = sessionIdInput;
        }
    }
}
