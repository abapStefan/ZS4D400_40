CLASS zcl_40_63_itab_fields_corresp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_63_itab_fields_corresp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_carrier,
           AirportID TYPE /dmo/airport_id,
           Name      TYPE /dmo/carrier-name,
           END OF st_carrier.



    DATA airport_full TYPE STANDARD TABLE OF st_carrier
                      WITH NON-UNIQUE KEY AirportID.

* Hier mit corresponding

    SELECT
        from /dmo/i_airport
        FIELDS *
        WHERE city = 'London'
        into CORRESPONDING FIELDS OF TABLE @airport_full.    " Ohne Corresponding, nicht kompatibel

    out->write( airport_full ).



  ENDMETHOD.
ENDCLASS.
