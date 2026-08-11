CLASS zcl_40_60_modify_anweisung DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_60_modify_anweisung IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    TYPES: BEGIN OF st_connection,                                " Lokale Definition einer Struktur
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
             currency_code   TYPE /dmo/currency_code,
           END OF st_connection.

    DATA carriers TYPE STANDARD TABLE OF st_connection      " Lokaler Tabellentyp mit Zeilentyp lokalen Struktur
                         WITH NON-UNIQUE KEY carrier_id .


    DATA carrier LIKE LINE OF carriers.       " Arbeitsbereich auf Zeilentyp der Internen Tabelle

* Befüllen des Arbeitsbereichs entweder Struktur mit - Struktur immer mit Komponentenselektor



    carrier = VALUE #( carrier_id = 'AA'
                          connection_id = 0017
                          airport_from_id = 'JFK'
                          airport_to_id = 'PSG'
                          carrier_name = 'American Airlines'
                          currency_code = 'EUR' ) .

    APPEND carrier TO carriers.


    carrier = VALUE #( carrier_id = 'LH'
                          connection_id = 0400
                          airport_from_id = 'HAJ'
                          airport_to_id = 'BKK'
                          carrier_name = 'Lufthansa'
                          currency_code = 'EUR' ) .

    APPEND carrier TO carriers.

* 1 MODIFY TABLE ANWEISUNG

     carrier = carriers[ carrier_id = 'AA' ].

     carrier-currency_code = 'USD'.  " Wenn bei Carrier ID AA gleich der currency_code = EUR steht

     MODIFY TABLE carriers from carrier.

** Modify Anweisung ohne Table Anweisung

*   carrier-carrier_id = 'BB'   .
*   carrier-currency_code = 'MON'.
*
*   MODIFY carriers FROM carrier INDEX 2.

** Modify ohne INDEX

   LOOP at carriers INTO carrier WHERE currency_code is not initial.         " Mehrere Zeilen überschreiben

           carrier-currency_code = 'BLA'.

*           MODIFY carriers from carrier.

  ENDLOOP.

    out->write( carriers ).



  ENDMETHOD.
ENDCLASS.
