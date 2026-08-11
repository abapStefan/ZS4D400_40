CLASS zcl_40_12_zeichenkettenop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_12_zeichenkettenop IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



  DATA: result TYPE string,
        teil1 TYPE string VALUE 'Stefan',
        teil2 TYPE string VALUE 'Breidenbach'.

        out->write( teil1 && teil2 ).    " Hier ohne Leerzeichen

         out->write( teil1 && | | && teil2 ).    " Hier mit Leerzeichen










  ENDMETHOD.
ENDCLASS.
