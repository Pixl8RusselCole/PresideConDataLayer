component {
	property name="presideObjectService" inject="PresideObjectService";

	public void function index( event, rc, prc, args={} ) {
		var action = rc.action ?: "";

		switch ( action ) {
			
			case "exists": _exists(); break;
			default:       _showObject( "presidecon_complexA" ); 
						   _showObject( "presidecon_complexB" ); 
						   break;
		}

		return "";
	}

	private void function _showObject( required string objectName, string recordId="" ) {
		writeDump("Object: #objectName#")

		var args = {};
		if ( Len( arguments.recordId ?: "" ) ) {
			args.id = arguments.recordId;
		}

		var query = presideObjectService.getObject( arguments.objectName ).selectData( argumentCollection = arguments );

		writeDump(query);
	}

	private void function _exists() {
		var subQueryExtraFilters = [ {
			filter = {
			  	should_use = true
			  }
		}];

		var subQuery = presideObjectService.getObject( "presidecon_complexB" ).selectData(
			  selectFields        = [ 1 ]
			, filter              = obfuscateSqlForPreside( "parent=presidecon_complexA.id" )
			, extraFilters        = subQueryExtraFilters
			, getSqlAndParamsOnly = true
			, formatSqlParams     = true
		);

		var query = presideObjectService.getObject( "presidecon_complexA" ).selectData(
			  filter = " exists ( #obfuscateSqlForPreside( subQuery.sql )# ) "
			  , filterParams = subQuery.params
		);

		writeDump( query );
	}


}



/* Extra join demo */

/*
DB language independance
tenancy
interceptors could adjust the SQl
translations does left join on translation columns
sometimes do run raw SQL e.g migrations, avoidance of interceptors (things that can run independantly of caching etc, recursive SQL, complex SQL that is rarely used)
*/
