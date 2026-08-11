CLASS zcl_40_02_abap_variablen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_02_abap_variablen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA nachname TYPE c LENGTH 11.

  nachname = 'Breidenbach'.

  DATA my_var1 TYPE i.
  DATA my_var2 TYPE string.
  DATA my_var3 TYPE string VALUE 'Hello World'.


    out->write( my_var3 && | | && 'Hallo' && | | && nachname  ). " Zwischen den PIPES ser Platz bestimmt das Leerzeichen







  ENDMETHOD.
ENDCLASS.
