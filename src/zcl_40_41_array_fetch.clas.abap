CLASS zcl_40_41_array_fetch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_41_array_fetch IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connect TYPE /dmo/connection.
    DATA t_conn TYPE TABLE OF /dmo/connection.

    SELECT  *
         FROM  /dmo/connection
       WHERE carrier_id = 'LH'
       INTO TABLE @t_conn.

     IF sy-subrc <> 0.
     out->Write( 'Diesen Datensatz gibt es nicht' ).
     ENDIF.

     LOOP AT t_conn INTO connect.
     out->write( connect ).
     ENDLOOP.

  ENDMETHOD.
ENDCLASS.
