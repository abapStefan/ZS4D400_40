CLASS zcl_40_50_strukt_fields_into DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_50_strukt_fields_into IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    DATA connection TYPE st_connection.

    SELECT SINGLE
      FROM /DMO/I_connection
      FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
      WHERE AirlineID = 'LH'
      INTO @connection.




    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: Lokaler Struktur Typ mit SELECT Füllen ' ).
    out->write( connection ).

  ENDMETHOD.
ENDCLASS.
