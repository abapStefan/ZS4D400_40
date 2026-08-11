CLASS zcl_40_25_class_meth_implement DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_40_25_class_meth_implement IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA hotel TYPE REF TO lcl_hotel.
    DATA hotel2 TYPE REF TO lcl_hotel.
    DATA hotel3 TYPE REF TO lcl_hotel.
    DATA hotel4 TYPE REF TO lcl_hotel.

    DATA hotels TYPE TABLE OF REF TO lcl_hotel.   " Interne Tabelle


    hotel = NEW #(  ).
    hotel->name = 'Breidenbach SPA Resort'.
    hotel->beds = 345.
    hotel->pools = 7.

    APPEND hotel TO hotels.

    CLEAR hotel.

    hotel = NEW #(  ).
    hotel->name = 'Breidenbach 13 Sterne Dubai'.
    hotel->beds = 1345.
    hotel->pools = 17.

    APPEND hotel TO hotels.

    hotel2 = hotel.                                 " Hier wir die Adresse kopiert von 1 nach 2

     APPEND hotel2 TO hotels.

    hotel3 = NEW #(  ).
    hotel3->name = 'Breidenbach 8 Sterne Hotel'.   " mehrere Instanzen der gleichen Klasse
    hotel3->beds = 645.
    hotel3->pools = 9.

     APPEND hotel3 TO hotels.

    hotel4 = NEW #(  ).
    hotel4->set_attributes(
        EXPORTING
         i_name = 'Superklasse Hotel'
         i_beds = 1045
         i_pools = 5  ).

    APPEND hotel4 TO hotels.





  ENDMETHOD.
ENDCLASS.
