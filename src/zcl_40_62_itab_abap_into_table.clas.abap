CLASS zcl_40_62_itab_abap_into_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_62_itab_abap_into_table IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    DATA airport_full TYPE STANDARD TABLE OF /dmo/i_airport
                      WITH NON-UNIQUE KEY AirportID.

* Hier ein Array Fetch / ist keine Select Schleife

    SELECT
        from /dmo/i_airport
        FIELDS AirportID, Name, City, CountryCode
        WHERE city = 'London'
        into TABLE @airport_full.

    out->write( airport_full ).



  ENDMETHOD.
ENDCLASS.
