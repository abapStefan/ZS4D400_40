CLASS zcl_40_51_strukt_fields_alle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_51_strukt_fields_alle IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA connection TYPE /dmo/i_connection.

    SELECT SINGLE
      FROM /DMO/i_connection
      FIELDS *
      WHERE AirlineID = 'LH'
      INTO @connection.




    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: FIELDS alle Felder mit SELECT Füllen ' ).
    out->write( connection ).

  ENDMETHOD.
ENDCLASS.
