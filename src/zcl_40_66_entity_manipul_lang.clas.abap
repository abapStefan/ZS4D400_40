CLASS zcl_40_66_entity_manipul_lang DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_66_entity_manipul_lang IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* ENTITY Manipulation Language

   DATA update_tab TYPE TABLE FOR UPDATE /dmo/i_agencytp.

   DATA input_keys TYPE TABLE FOR READ IMPORT /dmo/i_agencyTP.     " Tabelle für den Lese Import

   DATA result_tab TYPE TABLE FOR READ RESULT /dmo/i_agencyTP.     " Tabelle für das READ Ergebnis

   input_keys = VALUE #( ( agencyID = '070045' ) ).    " Bis hier in Input Keys nur die agency_ID

   READ ENTITIES OF /dmo/i_agencytp                  " Name der Verhaltendefinition
      ENTITY /dmo/Agency                             " Alias Namen der in der definierten Entität
      ALL FIELDS                                     " oder agencyid name street postalcode city " Feldauswahl
      with input_keys                                " Tabelle mit Abfrage Parametern
      RESULT result_tab.                             " Ab hier das Ergebnis in der result_tab

    MODIFY ENTITIES OF /dmo/i_agencytp
           ENTITY /dmo/agency
           UPDATE
           FIELDS ( name )                           " zu änderndes Feld(er)
           with update_tab.                          " Tabelle mit zu verbuchenden Daten

* COMMIT ENTITIES.                                  " Daten persitieren  ***Wichtig - Commit - In einer Behavior Definition nicht erlaubt / Ohne Commit keine Änderung

   out->write( result_tab ).

  ENDMETHOD.
ENDCLASS.
