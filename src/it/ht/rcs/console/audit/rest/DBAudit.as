package it.ht.rcs.console.audit.rest
{
	import it.ht.rcs.console.DB;
	
	import mx.rpc.CallResponder;

	public class DBAudit extends _Super_DBAudit implements IDBAudit
	{
    /**
     * Override super.init() to provide any initialization customization if needed.
     */
    protected override function preInitializeService():void
    {
        super.preInitializeService();
        // Initialization customization goes here
    }
		
		public function DBAudit(host:String) {
			super();
			_serviceControl.baseURL = host;
		}
		
		public function filters(onResult:Function=null, onFault:Function=null):void {
			var resp:CallResponder = DB.getCallResponder(onResult, onFault);
			resp.token = filters_();
		}
    
    public function all(filter:Object, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = all_(JSON.stringify(filter));
    }
    
  }
  
}