CLASS zcl_40_18_itab_glob_lok_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_18_itab_glob_lok_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Lokaler Tabellentyp

  TYPES tytab TYPE TABLE OF i.

  DATA tabelle type tytab.   " Das ist jetzt eine Interne Tabelle vom lokalen Tabelletyp

* Globaler Tabellentyp

  DATA fluege TYPE /dmo/t_flight.

  out->write( '' ).

  ENDMETHOD.
ENDCLASS.
