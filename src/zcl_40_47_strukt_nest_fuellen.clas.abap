CLASS zcl_40_47_strukt_nest_fuellen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_47_strukt_nest_fuellen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    TYPES: BEGIN OF st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             message         TYPE symsg,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    DATA connection TYPE st_connection.

    connection-airport_from_id = 'HAJ'.
    connection-airport_to_id   = 'BKK'.
    connection-carrier_name    = 'Breidenbach Fly'.

    connection-message-msgty = 'E'.    " Komponentenselektor von Stru auf Stru
    connection-message-msgid = 'Stefan ist da'.
    connection-message-msgno = '0815'.



    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: Lokaler Nested Struktur Typ Füllen ' ).
    out->write( connection ).

  ENDMETHOD.
ENDCLASS.
