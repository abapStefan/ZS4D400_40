CLASS zcl_40_19_itab_append_clear_3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_19_itab_append_clear_3 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Lokaler Tabellentyp

  TYPES tytab TYPE TABLE OF i.

  DATA tabelle type tytab.   " Das ist jetzt eine Interne Tabelle vom lokalen Tabelletyp

  DATA zahl TYPE i VALUE 6666. "Variable mit Zahl

      APPEND 2345 TO tabelle.
      APPEND 9876 TO tabelle.
      APPEND 5674 TO tabelle.
      APPEND 3456 TO tabelle.

      APPEND 2 * zahl to tabelle.  " Variable zahl wird mal 2 berechnet


*      out->write( tabelle ).

*     CLEAR tabelle.

      out->write( tabelle ).

      IF tabelle IS INITIAL.
      out->write( 'Tabelle ist leer' ).
      ENDIF.

* Globaler Tabellentyp

  DATA fluege TYPE /dmo/t_flight.



  ENDMETHOD.
ENDCLASS.
