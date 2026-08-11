CLASS zcl_40_cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_40_cds IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA carrier_id TYPE /DMO/carrier_id.
    DATA connection_id TYPE /DMO/connection_id.

    DATA connection TYPE REF TO lcl_connection.

    DATA connections TYPE TABLE OF REF TO lcl_connection.

    TRY.
        connection = NEW #(
          i_carrier_id    = 'LH'
          i_connection_id = 400
        ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.


    TRY.
        connection = NEW #(
          i_carrier_id    = 'AA'
          i_connection_id =  0017
        ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.


    TRY.
        connection = NEW #(
         i_carrier_id    = 'SQ'
         i_connection_id = 0001
       ).
        APPEND connection TO connections.

      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.


    LOOP AT connections INTO connection.

      out->write( connection->get_output( )  ).

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
