CLASS zcl_40_44_lokale_strukt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_44_lokale_strukt IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    TYPES: BEGIN OF st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    DATA connection TYPE st_connection.

    SELECT SINGLE
         FROM  /dmo/i_connection
       FIELDS DepartureAirport, DestinationAirport, \_airline-Name
       WHERE AirlineID = 'AA'
        AND  ConnectionID = '0017'
       INTO @connection.

    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: Lokaler Struktur Typ ' ).
    out->write( connection ).

  ENDMETHOD.
ENDCLASS.
