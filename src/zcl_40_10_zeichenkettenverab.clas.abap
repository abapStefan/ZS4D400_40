CLASS zcl_40_10_zeichenkettenverab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_10_zeichenkettenverab IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: zahl1 TYPE i VALUE 5,
        zahl2 TYPE i VALUE 6,
        gesamt   TYPE p LENGTH 5 DECIMALS 2,
        curr_code  TYPE c LENGTH 3 VALUE 'USD'.

        DATA gv_text TYPE string.
        gv_text = |Hallo Stefan|.     " Nur ein literaler Text

        out->write( gv_text ).

        out->write( |{ zahl1 + zahl2 }| ).    " 1 eingebetteter Ausdruck

        out->write( |Gesamt: { zahl1 + zahl2 } EUR| ). " Text und 1 Ausdruck

        out->write( |Gesamt: { zahl1 + zahl2 } { curr_code }| ). " Text und 2 Ausdrücke









  ENDMETHOD.
ENDCLASS.
