component {
	property name="presideObjectService" inject="PresideObjectService";

	public void function index( event, rc, prc, args={} ) {
		var action = rc.action ?: "";

		switch ( action ) {
			
			case "simple": _simpleSelectUnion(); break;
			case "paged":  _pagedSelectUnion( rc );  break;
			default:       _showObject( "presidecon_unionA" ); 
						  _showObject( "presidecon_unionB" ); 
						  _showObject( "presidecon_unionC" ); 
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

	private void function _simpleSelectUnion( ) {
		var unionSelectDataArgs = [ {
			  objectName        = "presidecon_unionA"
			, selectFields      = [ "label","sort_order" ]
		}
		, {
			  objectName        = "presidecon_unionB"
			, selectFields      = [ "label","sort_order" ]
		}
		, {
			  objectName        = "presidecon_unionC"
			, selectFields      = [ "fieldC3","sort_order" ]
		}];

		var query = presideObjectService.selectUnion(
			  selectDataArgs = unionSelectDataArgs
			, orderby       = "sort_order"				
		);

		writeDump(query);
	}


	private void function _pagedSelectUnion( rc ) {

		var page           = rc.page ?: 1;
		var pageSize       = rc.pageSize ?: 2;
		var countOnly      = isTrue( rc.countOnly   ?: "" );
		var orderBy        =  Len( arguments.orderBy ?: "" ) ? arguments.orderBy : "sort_order";

		var unionSelectDataArgs = [
				{
				  objectName        = "presidecon_unionA"
				, selectFields      = [ "label", "sort_order" ]
				, maxRows           = countOnly ? 0 : pageSize * page // we don't know the startRow but we do know the maximum number of records that could be returned
				, orderby           = orderBy
				, recordCountOnly   = countOnly
			}
			, {
				  objectName        = "presidecon_unionB"
				, selectFields      = [ "label", "sort_order" ]
				, maxRows           = countOnly ? 0 : pageSize * page
				, orderby           = orderBy
				, recordCountOnly   = countOnly
			}
			, {
				  objectName        = "presidecon_unionC"
				, selectFields      = [ "fieldC3", "sort_order" ]
				, maxRows           = countOnly ? 0 : pageSize * page
				, orderby           = orderBy
				, recordCountOnly   = countOnly
			}
		];

		if ( countOnly ) {
			var count  = 0;
			var results =  presideObjectService.selectUnion(
				    selectDataArgs = unionSelectDataArgs
				  //, union = "ALL"  // won't work without this as the default is DISTINCT so it will combine multiple rows with the same record_count into one
			);
			writeDump(results)
			for ( var res in results ) {
				count += res.record_count;
			}

			writeDump( "Count: #count#" );
		} else {
			writeDump( "Page: #page#" );
			var query = presideObjectService.selectUnion(
				  selectDataArgs = unionSelectDataArgs
				, orderBy        = orderBy
				, maxRows        = pageSize
				, startRow       = ( pageSize * ( page-1 ) ) + 1
			)

			writeDump(query);
		}
	
	}

}