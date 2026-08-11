CLASS zcl_40_58_komplex_itab_fuellen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_58_komplex_itab_fuellen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    TYPES: BEGIN OF st_connection,                                " Lokale Definition einer Struktur
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    TYPES tt_connections TYPE SORTED TABLE OF st_connection      " Lokaler Tabellentyp mit Zeilentyp lokalen Struktur
                         WITH NON-UNIQUE KEY carrier_id connection_id.

    DATA connections TYPE tt_connections.                         " Interne Tabelle auf lokal erstellter Tabelle

*    DATA connection TYPE st_connection.                   " Arbeitsbereich Struktur auf lokaler Struktur

    DATA connection LIKE LINE OF connections.         " Arbeitsbereich auf Zeilentyp der Internen Tabelle

* Befüllen des Arbeitsbereichs entweder Struktur mit - Struktur immer mit Komponentenselektor

    connection-carrier_id = 'LH'.
    connection-connection_id = 0400.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id = 'JFK'.
    connection-carrier_name = 'Breidenbach Fly'.
*
*   APPEND connection TO connections.                   " Zeile der Internen Tabelle hinzugefügt
     INSERT connection INTO TABLE connections.  " Bei sorted Tables

* oder die Struktur mit Value und einzelne komponenten befüllen

    connection = VALUE #( carrier_id = 'AA'
                          connection_id = 0017
                          airport_from_id = 'HAJ'
                          airport_to_id = 'BKK'
                          carrier_name = 'Stefan Fly' ) .

*    APPEND connection TO connections.
     INSERT connection INTO TABLE connections.

    connection = VALUE #( carrier_id = 'AA'
                          connection_id = 0017
                          airport_from_id = 'JFK'
                          airport_to_id = 'SIN'
                          carrier_name = 'Doppel Fly' ) .

*    APPEND connection TO connections.
     INSERT connection INTO TABLE connections.


** oder mit  Append Value Ausdruck Direkt in der Anweisung / dann braucht man keine WA
*
*    APPEND  VALUE #( carrier_id = 'QF'
*                     connection_id = 0815
*                     airport_from_id = 'BER'
*                     airport_to_id = 'FRA'
*                     carrier_name = 'Mein Fly' )
*             TO connections.


** Mit Insert Value bei Sortierten Tabelle

    INSERT  VALUE #( carrier_id = 'QF'
                     connection_id = 0815
                     airport_from_id = 'BER'
                     airport_to_id = 'FRA'
                     carrier_name = 'Meins Fly' )
     INTO TABLE connections.


*  CLEAR connections.    " Alles löschen

*   DELETE connections WHERE carrier_id = 'AA'.    " Löschen nach carrier_id

*    IF connections IS INITIAL.
*        out->write( 'Tabelle ist leer' ).
*    ENDIF.

*  APPEND connection TO connections.

*   connection = connections[ 2 ].       " Indexzugriff auf 2 Zeile
*    connection = connections[ airport_from_id = 'BER' airport_to_id = 'FRA' ].

*  SORT connections ASCENDING by carrier_id.   " Sortieren nach Carrier_id

  LOOP AT connections INTO connection.   " Alle Zeilen

    out->write( connection ).

   ENDLOOP.

  ENDMETHOD.
ENDCLASS.
