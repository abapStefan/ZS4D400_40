CLASS zcl_40_19_2_einzelsatz_loop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_19_2_einzelsatz_loop IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Lokaler Tabellentyp

    TYPES tytab TYPE TABLE OF i.

    DATA tabelle TYPE tytab.   " Das ist jetzt eine Interne Tabelle vom lokalen Tabelletyp


* Globaler Tabellentyp

    DATA tt_flueg TYPE /dmo/t_flight.  " Interne Tabelle auf globalen Tabellentyp


* Tabellentyp auf Globale Struktur


    DATA tt_fluege TYPE TABLE OF /dmo/flight.   " Interne Tabelle auf Datenbanktabelle als Zeilentyp



    DATA zahl TYPE i .

    zahl = 2345.

    APPEND zahl TO tabelle.

    zahl = 9876.

    APPEND zahl TO tabelle.

    zahl = 5674.

    APPEND zahl TO tabelle.

    zahl = 3456.

    APPEND zahl TO tabelle.

    APPEND 2 * zahl TO tabelle.  " Variable zahl wird mal 2 berechnet

** Hier ein Einzelsatz über INDEX

   out->write( tabelle[ 5 ] ).

*    READ TABLE tabelle with KEY table_line = 5674 INTO zahl.

*    if sy-subrc = 0.
*
*       out->write( |Gefunden an Position: { sy-tabix }| ).
*
*    ENDIF.


*     CLEAR tabelle.

    IF tabelle IS INITIAL.
      out->write( 'Tabelle ist leer' ).
    ENDIF.

    out->write( '-----------------------------------------------------------------------------' ).

    LOOP AT tabelle INTO zahl.           " Schleife mit explizierter Deklaration

    out->write( |Index: { sy-tabix }, Wert: { zahl }| ).

    ENDLOOP.

*    LOOP AT tabelle into DATA(zahl1).     " Schleife mit Inline Deklaration
*
*    out->write( |Index: { sy-tabix }, Wert: { zahl1 }| ).
*
*    ENDLOOP.



  ENDMETHOD.
ENDCLASS.
