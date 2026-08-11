CLASS zcl_40_28_meth_aufruf_eb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_40_28_meth_aufruf_eb IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA beds TYPE i.
    DATA pools TYPE i.
    DATA name TYPE string.

    DATA hotel TYPE REF TO lcl_hotel.


    DATA hotels TYPE TABLE OF REF TO lcl_hotel.   " Interne Tabelle


    hotel = NEW #(  ).        " Daran denken NEW #( ). zuerst sonat Nullreferenz
    hotel->set_attributes(
           EXPORTING          " Bei Methode mit Importing Paramtern
        i_name = 'Hammer Wellness Hotel'
        i_beds = 645
        i_pools = 3 ).

    APPEND hotel TO hotels.


    hotel = NEW #(  ).
    hotel->set_attributes(
           EXPORTING          " Bei Methode mit Importing Paramtern
        i_name = 'Riu Hotel ALL IN'
        i_beds = 1345
        i_pools = 5 ).

    APPEND hotel TO hotels.

    hotel = NEW #(  ).

    hotel->set_attributes(
           EXPORTING          " Bei Methode mit Importing Paramtern
        i_name = 'Breidenbach SPA Resort'
        i_beds = 345
        i_pools = 7 ).

     APPEND hotel TO hotels.

    hotel = NEW #(  ).

    hotel->set_attributes(                      " Wenn eh nur Importing Parameter kann Exporting weggelassen werden
        i_name = 'Breidenbach 8 Sterne Hotel'   " mehrere Instanzen der gleichen Klasse
        i_beds = 645
        i_pools = 9 ).

     APPEND hotel TO hotels.

    hotel = NEW #(  ).

         hotel->name = 'Superklasse Hotel'.
         hotel->beds = 1045.
         hotel->pools = 5.

    APPEND hotel TO hotels.


    LOOP AT hotels INTO hotel.
       hotel->get_attributes(
           IMPORTING
           e_name = name
           e_beds = beds
           e_pools = pools ).

    out->write( |Hotel: { name }| && |'Anzahl der Betten'{ beds } | && | 'Anzahl der Pools' { pools } | ).

         ENDLOOP.





  ENDMETHOD.
ENDCLASS.
