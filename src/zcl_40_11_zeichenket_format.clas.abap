CLASS zcl_40_11_zeichenket_format DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_11_zeichenket_format IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Formatoption DATE

  DATA gv_date TYPE D VALUE '20260702'.

      out->write( |{ gv_date }| ).  " '20260702, interne Format

      out->write( |{ gv_date DATE = ISO }| ).  " => 2026-07-02, Ausgabe im ISO Format

      out->write( |{ gv_date DATE = USER }| ).  " => 02/07/2026,  "02.07.2026

* Formatierungsoptionn für  Zahlen

   DATA gv_number TYPE p LENGTH 3 DECIMALS 2 VALUE '-113.13'.

      out->write( |{ gv_number }| ).

      out->write( |{ gv_number NUMBER = USER }| ).  " => '-113.13 oder ' -113,13

      out->write( |{ gv_number SIGN = RIGHT }| ).   " => 113.13-

      out->write( |{ gv_number STYLE = SCIENTIFIC }| ).  " =>  '-11313E+02









  ENDMETHOD.
ENDCLASS.
