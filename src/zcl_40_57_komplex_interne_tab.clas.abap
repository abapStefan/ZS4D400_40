CLASS zcl_40_57_komplex_interne_tab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_57_komplex_interne_tab IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA connections_1 TYPE TABLE OF /dmo/connection. " Standard Tabelle mit Zeilentyp auf Datenbanktabelle nicht eindeutigen Schlüssel


    DATA connections_2 TYPE STANDARD TABLE OF /dmo/connection  "Standard Tabelle mit nicht eindeutigen Schlüssel
                       WITH NON-UNIQUE DEFAULT KEY.

    DATA connections_3 TYPE SORTED TABLE OF /dmo/connection
                       WITH NON-UNIQUE KEY airport_from_id airport_to_id. "Sortierte Tabelle mit nicht eindeutigen Schlüssel

    DATA connections_4 TYPE HASHED TABLE OF /dmo/connection            " "Hash Tabelle mit eindeutigen Schlüssel
                       WITH UNIQUE KEY carrier_id connection_id.

    DATA connections_5 TYPE /dmo/t_flight. "  Interne Tabelle auf Globalen erstellten Tabellentyp


* Nächste Abbildung

    TYPES: BEGIN OF st_connection,                                " Lokale Definition einer Struktur
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    TYPES tt_connections TYPE SORTED TABLE OF st_connection      " Lokaler Tabellentyp mit Zeilentyp lokalen Struktur
                         WITH UNIQUE KEY carrier_id connection_id.

    DATA connections_6 TYPE tt_connections. " Interne Tabelle auf lokal erstellter Tabelle



    out->write( '' ).

  ENDMETHOD.
ENDCLASS.
