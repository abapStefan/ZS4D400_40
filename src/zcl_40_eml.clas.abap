CLASS zcl_40_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* ENTITY Manipulation Language

   DATA agencies_upd TYPE TABLE FOR UPDATE /dmo/i_agencytp.

   agencies_upd = VALUE #( ( agencyID = '070040' name = 'Banana' ) ).


    MODIFY ENTITIES OF /dmo/i_agencytp
           ENTITY /dmo/agency
           UPDATE
           FIELDS ( name )
           with agencies_upd.

   COMMIT ENTITIES.                                             " Jetzt erst wird die änderung sichtbar

   out->write( 'Ausführung der Methode beendet' ).

  ENDMETHOD.
ENDCLASS.
