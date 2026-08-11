CLASS zcl_40_61_itab_abap_sql_einzel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_61_itab_abap_sql_einzel IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    DATA airport_full TYPE /dmo/i_airport.

* Erinnerung Select Single

    SELECT SINGLE
        from /dmo/i_airport
        FIELDS AirportID, Name, City, CountryCode
        WHERE city = 'Zurich'
        into @airport_full.

    out->write( airport_full ).



  ENDMETHOD.
ENDCLASS.
