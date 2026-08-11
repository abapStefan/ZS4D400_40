CLASS zcl_test_public DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_public IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT FROM z40_sql_kapsel
          FIELDS CarrierId, ConnectionId, FlightDate, seats_free

                INTO TABLE @DATA(result).

      out->write( result ).

  ENDMETHOD.
ENDCLASS.
