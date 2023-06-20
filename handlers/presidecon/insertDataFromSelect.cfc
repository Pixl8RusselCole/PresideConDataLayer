component {
	property name="presideObjectService" inject="PresideObjectService";


	public string function index( event, rc, prc, args={} ) {
		var action = rc.action ?: "";

		switch ( action ) {	
			case "insert": _insert();break;
			default:       _showObject( "presidecon_insertA" ); _showObject( "presidecon_insertB" ); break;
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

	public void function _insert( ) {
		var selectDataArgs = {
			    objectName   = "presidecon_insertA"
			  , selectFields = [ "id", "label", "fieldA1" ]
			  , filter       = {
					should_insert = true
			  }
		};

		presideObjectService.insertDataFromSelect(
			  objectName     = "presidecon_insertB"
			, selectDataArgs = selectDataArgs
			, fieldList      = [ "id", "label", "fieldB1" ]
		);
	}
}