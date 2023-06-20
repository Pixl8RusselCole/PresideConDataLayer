/**
 * @versioned                    false
**/
component {
	property name="country" relationship="many-to-one"  relatedTo="presidecon_extraJoinCountry";
	property name="company" type="string" dbtype="varchar";
}