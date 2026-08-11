CLASS zcl_40_59_itab_mehrere_zeilen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_59_itab_mehrere_zeilen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    TYPES: BEGIN OF st_connection,                                " Lokale Definition einer Struktur
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    TYPES tt_connections TYPE STANDARD TABLE OF st_connection      " Lokaler Tabellentyp mit Zeilentyp lokalen Struktur
                         WITH NON-UNIQUE KEY carrier_id connection_id.

    DATA carriers TYPE tt_connections.                         " Interne Tabelle auf lokal erstellter Tabelle

    DATA carrier TYPE /dmo/t_flight.                   " Zweite Tabelle auf Globalen Tabellentyp


    carriers = VALUE #( ( carrier_id = 'AA' carrier_name = 'Lufthansa AG' )
                      ( carrier_id = 'JL' carrier_name = 'Japan Airline' )
                      ( carrier_id = 'AA' carrier_name = 'American Airline' ) ) .

    carrier = CORRESPONDING #( carriers ).

    out->write( carrier ).


  ENDMETHOD.
ENDCLASS.
