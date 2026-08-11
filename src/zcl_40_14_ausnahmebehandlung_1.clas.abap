CLASS zcl_40_14_ausnahmebehandlung_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_14_ausnahmebehandlung_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

** Erste Ausnahme

*  DATA: zaehler TYPE i VALUE 5,
*        nenner TYPE i VALUE 0,
*        ergebnis TYPE p.
*
*        ergebnis = zaehler / nenner.    " Ausnahme wir aufgerufen Teilen durch null
*
*        out->write( ergebnis ).


** zweite Ausnahme

*DATA: ziel TYPE i,
*      quelle TYPE string VALUE `Banane`.
*
*      ziel = quelle.
*
*      out->write( '' ).


** dritte Ausnahme

    DATA: nummer TYPE i,
          zahlen TYPE TABLE OF i.


    nummer = 12.

      APPEND nummer to zahlen.

    nummer = 13.

      APPEND nummer to zahlen.

    nummer = 14.

      APPEND nummer to zahlen.

    nummer = 15.

      APPEND nummer to zahlen.

*    CLEAR zahlen.
*
*    nummer = zahlen[ 3 ].

    out->write( zahlen ).


  ENDMETHOD.
ENDCLASS.
