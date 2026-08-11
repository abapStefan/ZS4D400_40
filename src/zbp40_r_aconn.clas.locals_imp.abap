CLASS LHC_Z40_R_ACONN DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR Verbindungen
        RESULT result,
      CheckSemanticKey FOR VALIDATE ON SAVE   " Hier die Methods Definition Check
            IMPORTING keys FOR Verbindungen~CheckSemanticKey,       " Hier der Aliasname von meiner connection die Methode verknüpft
      GetCities FOR DETERMINE ON SAVE
            IMPORTING keys FOR Verbindungen~GetCities.        " Hier jetzt Method GetCities
ENDCLASS.

CLASS LHC_Z40_R_ACONN IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD CheckSemanticKey.


  READ ENTITIES OF z40_r_aconn IN LOCAL MODE   " 1 Schritt einfach mit strg und space arbeiten und ausfüllen
  ENTITY Verbindungen FIELDS ( uuid CarrierID ConnectionID )
  WITH CORRESPONDING #( keys )
  RESULT DATA(connection).

  LOOP AT connection INTO DATA(connections).   " 2 Schritt Loop erstellen

   SELECT FROM z40aconn                        " 3 Schritt Select mit eine Union erstellen

         FIELDS uuid
         WHERE carrier_id = @connections-CarrierID
         AND   connection_id = @connections-ConnectionID
         AND   uuid <> @connections-uuid

   UNION

   SELECT FROM z40_d_aconn

         FIELDS uuid
         WHERE carrierid  = @connections-CarrierID
         AND   connectionid = @connections-ConnectionID
         AND   uuid <> @connections-uuid

    INTO TABLE @DATA(check_result).           " Inline Deklaration

*  4_ Wenn die SELECT-Anweisung Daten zurückgibt, erstellen wir ein neues Nachrichtenobjekt mit der Nachricht
*     KlasseZS4D400, Nachrichtennummer 001 und Schweregrad ms-error.
*     Übergeben connectionCarrierID an Parameter v1 und connection-ConnectionID an Parameter v2.


         IF check_result IS NOT Initial.

         DATA(message) = me->new_message(
                           id       = 'Z40_MESSAGE'
                           number   = '001'
                           severity = ms-error
                           v1       = connections-CarrierID
                           v2       = connections-ConnectionID
*                           v3       =
*                           v4       =
                         ).

* 5_ Deklarieren wir einen Arbeitsbereich für die interne Tabelle reported-connection.
*    Füllen ihn mit dem Gesamtschlüssel des
*    des aktuellen Datensatzes, fügen den Verweis auf das Nachrichtenobjekt hinzu
*    und stellen sicher, dass die
*    Nachricht mit den Elementen CarrierID und ConnectionID verknüpft ist.
*    Fügen schließlich eine neue Zeile in die Komponente Verbindung der Meldestruktur ein.


        DATA reported_record LIKE LINE of reported-verbindungen.
         reported_record-%tky = connections-%tky.
         reported_record-%msg = message.
         reported_record-%element-carrierid = if_abap_behv=>mk-on.
         reported_record-%element-connectionid = if_abap_behv=>mk-on.
        APPEND reported_record TO reported-verbindungen.

* 6_  Deklariere einen Arbeitsbereich für die interne Tabelle failed-connection.
*     Füllen ihn mit dem Gesamtschlüssel des aktuellen Datensatzes und
*     fügen eine neue Zeile in die Verbindungskomponente der failed ein.
*     Schließe schließlich die offenen IF- und LOOP-Kontrollstrukturen.


        DATA failed_record LIKE LINE OF failed-verbindungen.
        failed_record-%tky = connections-%tky.
        APPEND failed_record TO failed-verbindungen.
        ENDIF.
     ENDLOOP.


  ENDMETHOD.

  METHOD GetCities.

* 1_ Lese die Benutzereingaben mit einer EML READ ENTITIES-Anweisung. Lese die Felder
*    AirportFromID und AirportToID. Verwende eine Inline-Deklaration für die Ergebnismenge.



       READ ENTITIES OF z40_r_aconn IN LOCAL MODE
               ENTITY Verbindungen
               FIELDS ( AirportFromID AirportToID )
               WITH CORRESPONDING #( keys )
               RESULT DATA(connections).

* 2_ Verwende in einer Schleife über die Daten zwei SELECT-Anweisungen,
*    um die Stadt- und Länderdaten für
*    für die beiden vom Benutzer eingegebenen Flughäfen. Verwende die CDS-Sicht /DMO/I_Airport als Datenquelle
*    und lese die Felder City und CountryCode. Für AirportFromID, fülle die Felder
*    CityFrom und CountryFrom. Für AirportToID, fülle die Felder CityTo und CountryTo.
*    Denke daran, dass die MODIFY-Anweisung benötigt wird, um die Änderungen in die interne
*    Tabelle zu schreiben.


      LOOP AT connections INTO DATA(connection).   "  Loop erstellen

        SELECT SINGLE
        FROM /dmo/i_airport
        FIELDS City, CountryCode
         WHERE AirportID = @connection-AirportFromID
        INTO (  @connection-CityFrom, @connection-CountryFrom ).

         SELECT SINGLE
        FROM /dmo/i_airport
        FIELDS City, CountryCode
         WHERE AirportID = @connection-AirportToID
        INTO (  @connection-CityTo, @connection-CountryTo ).

        Modify Connections FROM connection.

      ENDLOOP.

* 3_ Deklariere eine interne Tabelle connections_upd mit dem Typ TABLE FOR UPDATE
*    z40_r_connections. Kopiere die Daten aus der internen
*    Tabelle connections in die neue Tabelle connections_upd.


       DATA connections_upd TYPE TABLE FOR UPDATE z40_r_aconn.
       connections_upd = CORRESPONDING #( connections ).

* 4_ Verwende eine EML MODIFY ENTITIES-Anweisung, um die Daten im Transaktionspuffer zu aktualisieren.
*    Beschränke die Aktualisierung auf die Felder, die wir geändert haben (CityFrom City_To CountryFrom
*    CountryTo). Verwende den Zusatz REPORTED, um alle Nachrichten der Anweisung zu empfangen.
*    Übertragen alle Meldungen in die Berichtsstruktur unserer Methode


       MODIFY ENTITIES OF z40_r_aconn IN LOCAL MODE
       ENTITY Verbindungen
       UPDATE
       FIELDS (  CityFrom CountryFrom CityTo CountryTo )
       with connections_upd

       REported DATA(reported_records).
       reported-verbindungen = CORRESPONDING #( reported_records-verbindungen ).



  ENDMETHOD.

ENDCLASS.
