CLASS zcl_40_09_arithm_ausdruecke DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_09_arithm_ausdruecke IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: zahl1 TYPE i,
        zahl2 TYPE i,
        erg   TYPE p LENGTH 16 DECIMALS 2,
        erg2  TYPE p LENGTH 16 DECIMALS 1.


        zahl1 = 5.
        zahl2 = 6.

        erg = zahl1 * zahl2.     " + Addition  - Subtraktion  * Multiplikation

        out->write( erg ).

        erg = ( zahl1 + zahl2 ) / 3.  " / mit Division

        out->write( erg ).

        erg = ( 2 * zahl1 + 3 * zahl2 ) / 5.    " Durchschnitt berechnet

        out->write( erg ).

        erg2 = ( zahl1 + zahl2 ) / 3.  " / mit Rundung, wenn 1 Nachkommastelle vorhanden ist

        out->write( erg2 ).









  ENDMETHOD.
ENDCLASS.
