CLASS zcl_40_65_itab_sql_union DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_65_itab_sql_union IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
        from /dmo/i_carrier
        FIELDS 'Airline' AS TYPE, AirlineID AS ID, Name
        WHERE currencycode = 'GBP'

UNION ALL

    SELECT
        from /dmo/i_airport
        FIELDS 'Airport' AS TYPE, AirportID AS ID, Name
        WHERE city = 'London'

    INTO TABLE @DATA(Namen).


    out->write( namen ).



  ENDMETHOD.
ENDCLASS.
