CLASS zcl_40_21_debugger DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_21_debugger IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  CONSTANTS QF type c LENGTH 3 VALUE 'QF'.

    DATA: carrid1 TYPE c LENGTH 3,
          carrid2 TYPE c length 3 VALUE 'LH',
          count TYPE i.

    carrid1 = 'QF'.
    carrid2 = carrid1.

    ADD 1 TO count.

    count = count + 1.

    clear: carrid1,
           carrid2,
           count.

  ENDMETHOD.
ENDCLASS.
