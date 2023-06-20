component {
	property name="presideObjectService" inject="PresideObjectService";

	public void function index( event, rc, prc, args={} ) {
		var action = rc.action ?: "";

		switch ( action ) {
			
			case "join":   _join(); break;
			default:       _showObject( "presidecon_extraJoinAttendee" ); 
						   _showObject( "presidecon_extraJoinCountry" ); 
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
	
	private void function _join() {
		/*
		Query to retrieve a list of all attendees, their company, their country and the number of other attendees from the same country (from a subquery )
		*/
		var query = presideObjectService.getObject( "presidecon_extraJoinAttendee" ).selectData(
			  selectFields = [ "label", "company", "presidecon_extraJoinCountry.label as countryName", "country_count.attendee_count" ]
			, orderBy      = "country_count.attendee_count desc, label"
			, filter       = "country_count.country = presidecon_extraJoinAttendee.country"
			, extraJoins   = [ {
				  subQuery = "select count(1) as attendee_count, country from pobj_presideCon_extraJoinAttendee group by country"
				, subQueryAlias  = "country_count"
				, subQueryColumn = "country"                         // the column in the subquery which will be used to join to the main query
				, joinToTable    = "presidecon_extraJoinAttendee"    // the main query table
				, joinToColumn   = "country"                         // the column in the main query to join to
				, type           = "inner"                           // the join type (inner or left)
				//, additionalClauses = "country_count.company = presidecon_extraJoinAttendee.company"
	 
			}]
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

