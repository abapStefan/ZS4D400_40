CLASS zcl_40_04_abap_constants DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_40_04_ABAP_CONSTANTS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  CONSTANTS gc_const1 TYPE i VALUE 987654.
  CONSTANTS gc_const2 TYPE string VALUE 'Hallo Stefan'.


*  gc_const2 = 'Breidenbach'. " Hier wir ein Fehler angezeigt, da eine Constante nicht geändert werden kann


  out->write( gc_const2 ).







  ENDMETHOD.
ENDCLASS.
