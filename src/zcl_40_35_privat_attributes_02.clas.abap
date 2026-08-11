CLASS zcl_40_35_privat_attributes_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_40_35_privat_attributes_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    DATA connection TYPE REF TO lcl_connection.

    DATA connections TYPE TABLE OF REF TO lcl_connection.

    connection = NEW #(  ).

    connection->set_attributes(
      i_carrier_id    = 'LH'
      i_connection_id = 0400
    ).

    APPEND connection TO connections.


    connection = NEW #(  ).

    connection->set_attributes(
      i_carrier_id    = 'AA'
      i_connection_id = 0017
    ).

    APPEND connection TO connections.


    connection = NEW #(  ).

    connection->set_attributes(
      i_carrier_id    = 'SQ'
      i_connection_id = 0001
    ).

    APPEND connection TO connections.


*    connection = NEW #(  ).
*
*     connection->carrier_id = 'xy'.          " Wenn kein Read-Only oder kein Privat, dann kann ich hier einfach die Attribute ändern
*     connection->connection_id = '1234'.
*
*
*    APPEND connection TO connections.


    loop AT connections INTO connection.
        connection->get_attributes(
          IMPORTING
            e_carrier_id    = carrier_id
            e_connection_id = connection_id ).

     out->write( |Flugverbindung: { carrier_id } { connection_id }| ).

    ENDLOOP.



  ENDMETHOD.
ENDCLASS.
