CLASS zcl_40_40_mehere_zeilen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_40_mehere_zeilen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connect TYPE /dmo/connection.

    SELECT  *
         FROM  /dmo/connection
       WHERE carrier_id = 'LH'   " Wenn keine WHERE Klausel, dann wir die Gesamte Tabelle gezeigt
       INTO   @connect.

    out->write( connect ).

    ENDSELECT.                   " Schleife mit ENDSELECT.



     IF sy-subrc <> 0.
     out->Write( 'Diesen Datensatz gibt es nicht' ).
     ENDIF.

  ENDMETHOD.
ENDCLASS.
