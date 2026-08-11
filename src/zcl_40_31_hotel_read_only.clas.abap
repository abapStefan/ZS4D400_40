CLASS zcl_40_31_hotel_read_only DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_40_31_hotel_read_only IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA beds TYPE i.
    DATA pools TYPE i.
    DATA name TYPE string.
    DATA count TYPE string_table.

    DATA hotel TYPE REF TO lcl_hotel.


    DATA hotels TYPE TABLE OF REF TO lcl_hotel.   " Interne Tabelle


    hotel = NEW #(  ).        " Daran denken NEW #( ). zuerst sonat Nullreferenz

    TRY.
        hotel->set_attributes(
               EXPORTING          " Bei Methode mit Importing Paramtern
            i_name = 'Hammer Wellness Hotel'
            i_beds = 345
            i_pools = 3 ).
      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.

    APPEND hotel TO hotels.


    hotel = NEW #(  ).

    TRY.
        hotel->set_attributes(
               EXPORTING          " Bei Methode mit Importing Paramtern
            i_name = 'Riu Hotel ALL IN'
            i_beds = 0
            i_pools = 7 ).
                 APPEND hotel TO hotels.
      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).



     ENDTRY.

    hotel = NEW #(  ).

    TRY.
        hotel->set_attributes(
               EXPORTING          " Bei Methode mit Importing Paramtern
            i_name = 'Breidenbach SPA Resort'
            i_beds = 345
            i_pools = 7 ).
      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.

    APPEND hotel TO hotels.

    hotel = NEW #(  ).                          " Wenn eh nur Importing Parameter kann Exporting weggelassen werden

    TRY.
        hotel->set_attributes(
            i_name = 'Breidenbach 8 Sterne Hotel'   " mehrere Instanzen der gleichen Klasse
            i_beds = 645
            i_pools = 9 ).
      CATCH cx_abap_invalid_value.
        out->write( 'Aufruf der Methode fehlgeschlagen' ).
    ENDTRY.

    APPEND hotel TO hotels.

*    hotel = NEW #(  ).                            " Wenn die Attribute auf Privat gesetzt werden funktioniert es ohne Methode nicht
*    hotel->name = 'Superklasse Hotel'.                    " Dieses Hotel wird im Counter nicht mit aufgenommen, er durchläuft kein set-attributes
*
*    hotel->beds = 1045.
*    hotel->pools = 5.
*
*    APPEND hotel TO hotels.


    LOOP AT hotels INTO hotel.
      hotel->get_attributes(
          IMPORTING
          e_name = name
          e_beds = beds
          e_pools = pools ).

      out->write( |Hotel: { name }| && |'Anzahl der Betten'{ beds } | && | 'Anzahl der Pools' { pools } | ).

    ENDLOOP.

    count = lcl_hotel=>get_n_o_hotels(  ).
    out->write( count ).



  ENDMETHOD.
ENDCLASS.
