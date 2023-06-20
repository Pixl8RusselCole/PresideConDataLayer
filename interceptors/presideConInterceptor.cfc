component extends="coldbox.system.Interceptor" {
	property name="adHocTaskManagerService" inject="delayedInjector:adHocTaskManagerService";
// PUBLIC
	public void function configure() {}

	public void function presideConInterceptor( event, interceptData ) {
		adhocTaskManagerService.createTask(
			  event             = "presidecon.adhoctasks._slowRunningFunction"
			, runIn             = CreateTimeSpan( 0, 0, 1, 0 )
		);
	}

	public void function preSelectObjectData( event, interceptData ) {
		var objectName = interceptData.objectName ?: "";
		if ( !( LCase( objectName ) == "presidecon_complexb" 
		&& IsBoolean( interceptData.deprecationTest ?: "" ) && interceptData.deprecationTest ) ) {
			return;
		}
		interceptData.extraFilters = interceptData.extraFilters ?: [];

		ArrayAppend( interceptData.extraFilters, {
			filter = { should_use = true }
		} );
	}
}