CLASS zcl_40_20_itab_einzelsatz_loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_20_itab_einzelsatz_loop IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Lokaler Tabellentyp

    TYPES tytab TYPE TABLE OF i.
*    DATA zahl TYPE i.            " Hier mit explizieter Deklaration achte auf loop

    DATA tabelle TYPE tytab.     " Das ist jetzt eine internen Tabelle vom lokalen Tabellentyp

*   DATA zahl TYPE i VALUE 6666. " Variable mit Zahl

    APPEND 1234 TO tabelle.
    APPEND 5678 TO tabelle.
    APPEND 6834 TO tabelle.
    APPEND 2376 TO tabelle.
*    APPEND 2 * zahl to tabelle. " Variable zahl wird mal 2 berechnet

    out->write( tabelle[ 2 ] ).  " Einzelsatz lesen

*    CLEAR tabelle.

    IF tabelle IS INITIAL.
      out->write(  'Tabelle ist leer' ).
    ENDIF.

* Globaler Tabellentyp

    DATA fluege TYPE /DMO/t_flight.

*LOOP AT tabelle INTO zahl.      " Schleife  " Hier mit explizerter Deklaration
*    out->write( |{ zahl }| ).
*ENDLOOP.

LOOP AT tabelle into DATA(zahl). " Schleife mit Inline Deklaration
     out->write( |{ zahl }| ).
ENDLOOP.




  ENDMETHOD.
ENDCLASS.
