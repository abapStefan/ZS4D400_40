CLASS zcl_40_03_abap_type_lok_glob DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_03_abap_type_lok_glob IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Lokale Typen

  TYPES c_type TYPE c LENGTH 25.
  TYPES p_type TYPE p LENGTH 3 DECIMALS 2.

  DATA nachname TYPE c_type VALUE 'Banane'.
  DATA vorname TYPE c_type.

  nachname = 'Breidenbach'.
  vorname = 'Stefan'.

* Globale Typen

  DATA flughafen TYPE /DMO/airport_id.

  out->write( vorname && | | && nachname ).







  ENDMETHOD.
ENDCLASS.
