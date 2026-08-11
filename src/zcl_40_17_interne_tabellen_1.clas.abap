CLASS zcl_40_17_interne_tabellen_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_17_interne_tabellen_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 DATA nummer TYPE i VALUE 1234.
 DATA tabelle TYPE TABLE OF i.

    APPEND 2345 TO tabelle.
    APPEND 9876 TO tabelle.
    APPEND 5674 TO tabelle.
    APPEND 3456 TO tabelle.

 out->write( tabelle ).

  ENDMETHOD.
ENDCLASS.
