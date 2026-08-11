CLASS zcl_40_43_strukt_variable DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_43_strukt_variable IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection_full TYPE /dmo/i_connection.

    SELECT SINGLE
         FROM  /dmo/i_connection
       FIELDS AirlineID, ConnectionID, DepartureAirport, DestinationAirport,
              DepartureTime, ArrivalTime, Distance, DistanceUnit
       WHERE AirlineID = 'AA'
        AND  ConnectionID = '0017'
       INTO @connection_full.

    out->write( connection_full ).

  ENDMETHOD.
ENDCLASS.
