component extends="preside.system.config.Config" {

// PUBLIC CONFIGURE METHODS
	public void function configure(  ) {
		super.configure();

		ArrayAppend( interceptorSettings.customInterceptionPoints, "presideConAdhoc" );
		interceptors = interceptors ?: [];
		interceptors.append( { class="app.interceptors.presideConInterceptor", properties={} } );

		settings.features.presideConSynchronousMigration.enabled=true;
		settings.features.presideConAsyncMigration.enabled=true;
	}
}
