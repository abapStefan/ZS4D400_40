CLASS zcl_40_einfache_klasse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_einfache_klasse IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  DATA: hotel_1 TYPE c LENGTH 25.
*  DATA: beds_1 TYPE i.
*  DATA: pools_1 TYPE i.
*
*  hotel_1 = 'Breidenbach SPA Hotel'.
*  beds_1  = 345.
*  pools_1 = 7.
*
*
*  out->write( |Hotel1: { hotel_1 } | && |Anzahl der Betten: { beds_1 } | && | Pools: { pools_1 }| ).
*
*  DATA: hotel_2 TYPE c LENGTH 25.
*  DATA: beds_2 TYPE i.
*  DATA: pools_2 TYPE i.
*
*  hotel_2 = 'Super Klasse SPA Hotel'.
*  beds_2  = 745.
*  pools_2 = 8.
*
*
*  out->write( |Hotel2: { hotel_2 } | && |Anzahl der Betten: { beds_2 } | && | Pools: { pools_2 }| ).

  DATA(lv_number) = 5.

  DATA(lo_demo) = NEW lcl_demo(  ).

  lo_demo->add_ten(
       CHANGING
        cv_number = lv_number ).

    out->write( lv_number ).



  ENDMETHOD.
ENDCLASS.
