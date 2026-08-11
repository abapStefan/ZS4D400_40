*ghgshngnggnsg
*dfbhfgdshnfg
*hgmhgdmgh


CLASS zcl_40_42_cds_view_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_42_cds_view_sql IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.

    DATA carrier_name TYPE /dmo/carrier_name.

    SELECT SINGLE
         FROM  /dmo/i_connection
       FIELDS DepartureAirport, DestinationAirport, \_Airline-Name       " Das ist ein Pfadausdruck \_Name der Association
       WHERE AirlineID = 'LH'                                            " Beachten das sind die Aliasnamen der VIEW
        AND  ConnectionID = '0400'
       INTO ( @airport_from_id,@airport_to_id, @carrier_name ).

    out->write( airport_from_id && | | && airport_to_id && | | && carrier_name ).

  ENDMETHOD.
ENDCLASS.
