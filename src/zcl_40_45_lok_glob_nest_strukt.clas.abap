CLASS zcl_40_45_lok_glob_nest_strukt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_45_lok_glob_nest_strukt IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Beispiel1 : Motivation für Strukturierte Variablen

  DATA connection_full TYPE /dmo/i_connection.


 SELECT SINGLE
         FROM  /dmo/i_connection
       FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport,
              DepartureTime, ArrivalTime, Distance, DistanceUnit
       WHERE AirlineID = 'AA'
        AND  ConnectionID = '0017'
       INTO @connection_full.

        out->write( '-------------------------------------------------' ).
        out->write( 'Beispiel1: CDS View als Strukturierter Typ ' ).
        out->write( connection_full ).



* Beispiel2 : Globaler Strukturtyp

      DATA message TYPE symsg.

        out->write( '-------------------------------------------------' ).
        out->write( 'Beispiel2: Globaler Strukturierter Typ ' ).
        out->write( message ).


* Beispiel3 : Lokaler Strukturtyp


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
    out->write( 'Beispiel3: Lokaler Struktur Typ ' ).
    out->write( connection ).


* Beispiel4 : Geschachtelter Strukturtyp (Nested)

         TYPES: BEGIN OF st_nested,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             message         TYPE symsg,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_nested.

    DATA connection_nested TYPE st_nested.

    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel4: Geschachtelter Struktur Typ ' ).
    out->write( connection_nested ).


  ENDMETHOD.
ENDCLASS.
