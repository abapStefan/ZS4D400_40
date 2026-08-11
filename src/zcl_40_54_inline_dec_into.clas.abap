CLASS zcl_40_54_inline_dec_into DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_54_inline_dec_into IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*    TYPES: BEGIN OF st_connection,
*             airport_from_id TYPE /dmo/airport_from_id,
*             airport_to_id   TYPE /dmo/airport_to_id,
*             carrier_name    TYPE /dmo/carrier_name,
*           END OF st_connection.


    DATA connection TYPE /dmo/i_connection.

    SELECT SINGLE
      FROM /DMO/i_connection
      FIELDS DepartureAirport,
             DestinationAirport AS ArrivalAirport,
             \_airline-Name AS AirlineName
      WHERE AirlineID = 'LH'
      INTO @DATA(banane).   " Inline Deklaration


    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: Inline Deklaration Typ mit SELECT Füllen ' ).
    out->write( banane ).

  ENDMETHOD.
ENDCLASS.
