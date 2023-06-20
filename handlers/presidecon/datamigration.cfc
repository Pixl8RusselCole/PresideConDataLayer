component {
	property name="presideObjectService" inject="PresideObjectService";
	property name="sqlRunner"            inject="SqlRunner";

	public void function index( event, rc, prc, args={} ) {
		var action    = rc.action ?: "";
	
		switch ( action ) {
			case "deprecation": _deprecation();break;
			case "interceptor": _interceptor(); break;
			default: _showObject( "presidecon_migrationA" ); 
				_showObject( objectName = "db_migration_history", filter={ migration_key="presideCon_synchronous_migration-sync" } );
				_showObject( objectName = "db_migration_history", filter={ migration_key="presideCon_async_migration" } );
				break;


		}

		return "";
	}

	private void function _showObject( required string objectName, string recordId="", struct filter = {} ) {
		writeDump("Object: #objectName#")

		var args = {};
		if ( Len( arguments.recordId ?: "" ) ) {
			args.id = arguments.recordId;
		}

		var query = presideObjectService.getObject( arguments.objectName ).selectData( argumentCollection = arguments );

		writeDump(query);
	}

	private void function _deprecation() {
		var tables = [ "NoField", "Original", "Prefixed" ];

		for ( var table in tables ) {
			var objectName  = "presideCon_deprecation#table#";
			var obj         = presideObjectService.getObject( objectName );
			var tableName   = obj.getTableName();
			var dsn         = obj.getDsn();

			var oldFieldCol = getObjectFieldColumnName( objectName, "old_field" );
			writeDump("Object:#objectName#");
			writeDump("Table: #tableName#");
			writeDump("old_field column: #oldFieldCol#")

			if ( Len( oldFieldCol ) ) {
				sqlRunner.runSql(
					  dsn = dsn
					, sql = "UPDATE #tableName# SET new_field=#oldFieldCol#"
				);
			}
		}
	}

	public void function _interceptor( ) {
		var result = presideObjectService.getObject( "presidecon_complexB" ).selectData( deprecationTest=true );

		writeDump( result );
	}
}