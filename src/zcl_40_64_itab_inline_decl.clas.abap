CLASS zcl_40_64_itab_inline_decl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_64_itab_inline_decl IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



* Hier mit Inline Deklaration

    SELECT
        from /dmo/i_airport
        FIELDS AirportID, Name AS AirportName  " Feld Aliasname wird als Spaltenname verwendet
        WHERE city = 'London'
        into TABLE @DATA(airports).    " Hier immer eine Standard Tabelle ohne Schlöüssel

    out->write( airports ).



  ENDMETHOD.
ENDCLASS.
