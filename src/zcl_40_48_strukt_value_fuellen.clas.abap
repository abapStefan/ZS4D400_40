CLASS zcl_40_48_strukt_value_fuellen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_48_strukt_value_fuellen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    TYPES: BEGIN OF st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             message         TYPE symsg,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    DATA connection TYPE st_connection.

    connection = VALUE #( airport_from_id = 'HAJ'
                          airport_to_id   = 'BKK'
                          carrier_name    = 'Breidenbach Fly' ).

* Zweiter Value überschreibt den Ersten Value

    connection = VALUE #( airport_from_id = 'FRA'
                          airport_to_id   = 'JFC'
                          carrier_name    = 'Airforce One' ).

*    connection = VALUE #( ).    " initial Werte / wie Clear



* Nicht angegebene Werte werden mit Initial Werten gefüllt

    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: Lokaler Struktur Typ mit VALUE Füllen ' ).
    out->write( connection ).

  ENDMETHOD.
ENDCLASS.
