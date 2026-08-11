CLASS zcl_40_01_abap_syntax DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_01_abap_syntax IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Beispiel für ABAP Anweisung

    DATA: name TYPE c LENGTH 10.
    DATA: text TYPE string.

    CONCATENATE 'Hallo Stefan' name INTO Text.

    out->write( text ).                           " Hier erscheint nur Hallo Stefan

* Beispiel für Ausdrücke

    text = 'Hello'.
    text = Name.

    text = replace(  val = 'Hello World'
                     sub = `Welt`                  " mit World würde der Wert wegenommen werden
                     with = name ).

    out->write( text ).                            " also mit Welt Ausgabe = Hello World / mit Welt Hello World

    text = COND #( WHEN text = 'Hello World' THEN 'Hallo Rita' && name ELSE Text ).
    " Hello World wird durch Hallo Rita ersetzt

    out->write( text ).






  ENDMETHOD.
ENDCLASS.
