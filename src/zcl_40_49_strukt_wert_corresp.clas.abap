CLASS zcl_40_49_strukt_wert_corresp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_49_strukt_wert_corresp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.


    TYPES: BEGIN OF st_connection_nested,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             message         TYPE symsg,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection_nested.

    DATA connection TYPE st_connection.
    DATA connection_nested TYPE st_connection_nested.

    connection = VALUE #( airport_from_id = 'HAJ'
                          airport_to_id   = 'BKK'
                          carrier_name    = 'Breidenbach Fly' ).

* Zweiter Value überschreibt den Ersten Value

    connection = VALUE #( airport_from_id = 'FRA'
                          airport_to_id   = 'JFC'
                          carrier_name    = 'Airforce One' ).


*    connection_nested = connection.  " Hier wird das Ergebnis falsch angezeigt


    connection_nested = CORRESPONDING #( connection ).


* Nicht angegebene Werte werden mit Initial Werten gefüllt

    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: Lokaler Struktur Typ mit VALUE Füllen ' ).
    out->write( connection_nested ).

  ENDMETHOD.
ENDCLASS.
