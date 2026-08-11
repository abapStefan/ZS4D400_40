CLASS zcl_40_52_into_corres_fields DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_52_into_corres_fields IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES: BEGIN OF st_connection,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    DATA connection_short TYPE st_connection.

    DATA connection TYPE /dmo/connection.     " funktioniert nicht mit I_connection da nicht namensgleich

    SELECT SINGLE
      FROM /DMO/connection
      FIELDS *
      WHERE carrier_id = 'LH'
      INTO CORRESPONDING FIELDS OF @connection_short.   " ohne Corresponding Fields Fehler


    out->write( '-------------------------------------------------' ).
    out->write( 'Beispiel: Lokaler Struktur Correspondig Typ mit SELECT Füllen ' ).
    out->write( connection_short ).

  ENDMETHOD.
ENDCLASS.
