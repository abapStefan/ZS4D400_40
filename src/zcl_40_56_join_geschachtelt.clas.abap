CLASS zcl_40_56_join_geschachtelt DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_56_join_geschachtelt IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA connection TYPE /dmo/connection.

    SELECT SINGLE
      FROM ( /DMO/connection AS c
      LEFT OUTER JOIN /dmo/airport AS f
           ON c~airport_from_id = f~airport_id   " Erste Join mit Alias f für von Flughäfen
      )
      LEFT OUTER JOIN /dmo/airport AS t          " zweiter Join mit Alias t für zum Flughafen
           ON c~airport_to_id = t~airport_id

      FIELDS c~carrier_id, c~connection_id,
             c~airport_from_id, c~airport_to_id,

             f~name AS airport_from_name, t~name AS airport_to_name
      WHERE carrier_id = 'LH'
      INTO @DATA(connection_join).   " Inline Deklaration


    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: Join Syntax mit connection und Airport' ).
    out->write( connection_join ).

  ENDMETHOD.
ENDCLASS.
