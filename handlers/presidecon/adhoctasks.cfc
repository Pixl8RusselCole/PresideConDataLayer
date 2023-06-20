component {
	property name="adHocTaskManagerService" inject="adHocTaskManagerService";

	public void function index( event, rc, prc, args={} ) {
		var action    = rc.action ?: "";
		var startTime = now();

		switch ( action ) {
			case "adhoc":  _adhoc( rc );  break;
			case "interceptor": _interceptor(); break;
			default:        _inline(); break;
		}

		var endTime = now();
		writeDump( DateDiff( "s", startTime, endTime ) );

		return "";
	}

	private void function _interceptor() {
		announceInterception( "presideConAdhoc", {} );
	}

	private void function _inline() {
		_slowRunningFunction( logger=nullValue() );
	}

	public void function _slowRunningFunction( any logger ) {
		var canLog   = StructKeyExists( arguments, "logger" );
		var canInfo  = canLog && arguments.logger.canInfo();
		
		writeDump( "Running slow running task" )
		if ( canInfo ) { arguments.logger.info( "Running slow running task" ); }

		sleep( 10000 );

		writeDump( "Finished slow running task" )
		if ( canInfo ) { arguments.logger.info( "Finished slow running task" ); }

	}

	public void function _adHoc() {
		adhocTaskManagerService.createTask(
			  event             = "presidecon.adhoctasks._slowRunningFunction"
			, runIn             = CreateTimeSpan( 0, 0, 1, 0 )
		);
	}
}